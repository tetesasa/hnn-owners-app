import 'package:flutter/material.dart';

import '../entities/payment_intent.dart';
import '../repositories/payment_repository.dart';
import '../repositories/invoice_repository.dart';
import '../../data/repositories/booking_payment_repository.dart';
import '../../../../core/error/result.dart';
import '../../../../domain/entities/booking.dart';

class ProcessPaymentUseCase {
  final PaymentRepository _paymentRepository;
  final InvoiceRepository _invoiceRepository;
  final BookingPaymentRepository _bookingRepository;

  ProcessPaymentUseCase({
    required PaymentRepository paymentRepository,
    required InvoiceRepository invoiceRepository,
    required BookingPaymentRepository bookingRepository,
  })  : _paymentRepository = paymentRepository,
        _invoiceRepository = invoiceRepository,
        _bookingRepository = bookingRepository;

  Future<Result<PaymentProcessResult>> call(
      PaymentProcessRequest request) async {
    try {
      // 1. 予約情報の検証
      final bookingResult =
          await _bookingRepository.getBooking(request.bookingId);
      if (bookingResult.isFailure) {
        return Result.failure(AppError.validation(
          message: '予約が見つかりません',
          field: 'bookingId',
        ));
      }

      final booking = bookingResult.data!;

      // 予約状態の検証
      if (booking.status != BookingStatus.confirmed) {
        return Result.failure(AppError.validation(
          message: '確定された予約のみ決済可能です',
          field: 'bookingStatus',
        ));
      }

      // 2. 決済金額の計算・検証
      final calculatedAmount = await _calculatePaymentAmount(booking);
      if (calculatedAmount != request.amount) {
        return Result.failure(AppError.validation(
          message: '決済金額が正しくありません',
          details: {
            'expected': calculatedAmount,
            'provided': request.amount,
          },
        ));
      }

      // 3. PaymentIntent作成
      final paymentIntentResult = await _paymentRepository.createPaymentIntent(
        amount: request.amount,
        currency: request.currency,
        customerId: request.customerId,
        description: _generatePaymentDescription(booking),
        bookingId: request.bookingId,
        metadata: {
          'booking_id': request.bookingId,
          'customer_id': request.customerId,
          'service_type': booking.serviceType.name,
          'app_version': '1.0.0',
        },
      );

      if (paymentIntentResult.isFailure) {
        return Result.failure(paymentIntentResult.error!);
      }

      final paymentIntent = paymentIntentResult.data!;

      // 4. PaymentMethod確認・決済実行
      Result<PaymentIntent> confirmedResult;

      if (request.paymentMethodId != null) {
        // 既存のPaymentMethodを使用
        confirmedResult = await _paymentRepository.confirmPaymentIntent(
          paymentIntentId: paymentIntent.id,
          paymentMethodId: request.paymentMethodId!,
        );
      } else {
        // 新しいPaymentMethodを作成して決済
        return Result.failure(AppError.validation(
          message: 'PaymentMethodが指定されていません',
          field: 'paymentMethodId',
        ));
      }

      if (confirmedResult.isFailure) {
        return Result.failure(confirmedResult.error!);
      }

      final confirmedPaymentIntent = confirmedResult.data!;

      // 5. 決済結果に応じた処理
      switch (confirmedPaymentIntent.status) {
        case PaymentIntentStatus.succeeded:
          // 決済成功時の処理
          await _handlePaymentSuccess(confirmedPaymentIntent, booking);
          break;

        case PaymentIntentStatus.requiresAction:
          // 3D Secure認証が必要
          return Result.success(PaymentProcessResult(
            paymentIntent: confirmedPaymentIntent,
            status: PaymentProcessStatus.requiresAction,
            booking: booking,
          ));

        case PaymentIntentStatus.processing:
          // 処理中
          return Result.success(PaymentProcessResult(
            paymentIntent: confirmedPaymentIntent,
            status: PaymentProcessStatus.processing,
            booking: booking,
          ));

        default:
          // 失敗・その他
          return Result.failure(AppError.payment(
            message: '決済処理に失敗しました',
            code: confirmedPaymentIntent.status.name,
            paymentIntentId: confirmedPaymentIntent.id,
            details: {
              'status': confirmedPaymentIntent.status.name,
              'error': confirmedPaymentIntent.lastPaymentError,
            },
          ));
      }

      return Result.success(PaymentProcessResult(
        paymentIntent: confirmedPaymentIntent,
        status: PaymentProcessStatus.succeeded,
        booking: booking,
      ));
    } catch (e, stackTrace) {
      return Result.failure(AppError.unknown(
        message: '決済処理中に予期しないエラーが発生しました',
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: stackTrace,
      ));
    }
  }

  Future<int> _calculatePaymentAmount(Booking booking) async {
    // 予約内容に基づいて決済金額を計算
    // サービスタイプ、期間、ペット数などを考慮

    int baseAmount = 0;

    switch (booking.serviceType) {
      case ServiceType.visiting:
        baseAmount = 3000; // 基本料金
        break;
      case ServiceType.boarding:
        baseAmount = 8000; // 基本料金
        break;
      case ServiceType.daycare:
        baseAmount = 5000; // 基本料金
        break;
      case ServiceType.grooming:
        baseAmount = 4000; // 基本料金
        break;
      case ServiceType.walking:
        baseAmount = 2000; // 基本料金
        break;
    }

    // ペット数による調整
    final petCount = booking.petIds.length;
    if (petCount > 1) {
      baseAmount += (petCount - 1) * 1000; // 追加ペット料金
    }

    // 期間による調整
    final duration =
        booking.sittingDateEnd.difference(booking.sittingDateStart);
    if (booking.serviceType == ServiceType.visiting) {
      final hours = duration.inHours;
      baseAmount = baseAmount * hours;
    } else if (booking.serviceType == ServiceType.boarding) {
      final days = duration.inDays;
      baseAmount = baseAmount * days;
    }

    return baseAmount;
  }

  String _generatePaymentDescription(Booking booking) {
    final serviceType = booking.serviceType.name;
    final petCount = booking.petIds.length;
    final startDate = booking.sittingDateStart.toIso8601String().split('T')[0];

    return 'Pet $serviceType service - $petCount pet(s) - $startDate';
  }

  Future<void> _handlePaymentSuccess(
    PaymentIntent paymentIntent,
    Booking booking,
  ) async {
    try {
      // 1. 予約状態を「支払い完了」に更新
      await _bookingRepository.updateBookingStatus(
        bookingId: booking.id,
        status: BookingStatus.completed,
        paymentIntentId: paymentIntent.id,
      );

      // 2. 請求書生成
      await _invoiceRepository.createInvoice(
        customerId: paymentIntent.customerId!,
        bookingId: booking.id,
        lineItems: [
          // InvoiceLineItem実装が必要
        ],
        description: paymentIntent.description,
        metadata: {
          'payment_intent_id': paymentIntent.id,
          'booking_id': booking.id,
        },
      );

      // 3. 決済成功通知の送信（後で実装）
      // await _notificationService.sendPaymentSuccessNotification(...)
    } catch (e) {
      // エラーログ記録
      debugPrint('Payment success handling error: $e');
    }
  }
}

class PaymentProcessRequest {
  final String bookingId;
  final String customerId;
  final int amount;
  final String currency;
  final String? paymentMethodId;
  final Map<String, String>? metadata;

  const PaymentProcessRequest({
    required this.bookingId,
    required this.customerId,
    required this.amount,
    required this.currency,
    this.paymentMethodId,
    this.metadata,
  });
}

class PaymentProcessResult {
  final PaymentIntent paymentIntent;
  final PaymentProcessStatus status;
  final Booking booking;

  const PaymentProcessResult({
    required this.paymentIntent,
    required this.status,
    required this.booking,
  });
}

enum PaymentProcessStatus {
  succeeded,
  requiresAction,
  processing,
  failed,
}
