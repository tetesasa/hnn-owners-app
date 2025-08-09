import '../../domain/entities/booking.dart';
import '../../domain/repositories/booking_repository.dart';

class CancelBookingUseCase {
  CancelBookingUseCase({
    required BookingRepository bookingRepository,
  }) : _bookingRepository = bookingRepository;

  final BookingRepository _bookingRepository;

  Future<void> call(CancelBookingRequest request) async {
    // 既存予約を取得
    final booking = await _bookingRepository.getBookingById(request.bookingId);
    if (booking == null) {
      throw BookingNotFoundException('予約が見つかりません（ID: ${request.bookingId}）');
    }

    // キャンセル権限チェック
    _validateCancelPermissions(booking, request);

    // キャンセル条件チェック
    _validateCancelConditions(booking, request);

    // キャンセル料金計算
    final cancellationFee = _calculateCancellationFee(booking);

    // 予約キャンセル実行
    await _bookingRepository.cancelBooking(
      request.bookingId,
      reason: request.reason,
      cancelledBy: request.cancelledBy,
    );

    // キャンセル料金が発生する場合は通知（実装は省略）
    if (cancellationFee > 0) {
      await _notifyCancellationFee(booking, cancellationFee);
    }
  }

  void _validateCancelPermissions(
      Booking booking, CancelBookingRequest request) {
    // 顧客IDチェック
    if (booking.customerId != request.customerId) {
      throw BookingCancellationException('他のお客様の予約はキャンセルできません');
    }

    // ステータスによるキャンセル制限
    switch (booking.status) {
      case BookingStatus.completed:
        throw BookingCancellationException('完了済みの予約はキャンセルできません');
      case BookingStatus.cancelled:
        throw BookingCancellationException('この予約は既にキャンセルされています');
      case BookingStatus.noShow:
        throw BookingCancellationException('ノーショーの予約はキャンセルできません');
      case BookingStatus.inProgress:
        throw BookingCancellationException(
            '進行中の予約はキャンセルできません。直接スタッフにお問い合わせください');
      default:
        // pending, confirmed はキャンセル可能
        break;
    }
  }

  void _validateCancelConditions(
      Booking booking, CancelBookingRequest request) {
    // キャンセル理由の必須チェック
    if (request.reason.isEmpty) {
      throw BookingCancellationException('キャンセル理由を入力してください');
    }

    // 開始時刻をチェックして警告メッセージを生成
    final timeUntilStart = booking.sittingDateStart.difference(DateTime.now());

    if (timeUntilStart.inHours < 2) {
      // 2時間以内のキャンセルは緊急対応が必要
      if (!request.isEmergencyCancel) {
        throw BookingCancellationException(
            '2時間以内のキャンセルは緊急対応となります。緊急キャンセルとして処理しますか？');
      }
    }
  }

  double _calculateCancellationFee(Booking booking) {
    final timeUntilStart = booking.sittingDateStart.difference(DateTime.now());
    final basePrice = booking.pricing?.basePrice ?? 0.0;

    // キャンセル料金ポリシー
    if (timeUntilStart.inHours < 2) {
      // 2時間以内: 100%
      return basePrice;
    } else if (timeUntilStart.inHours < 24) {
      // 24時間以内: 50%
      return basePrice * 0.5;
    } else if (timeUntilStart.inDays < 3) {
      // 3日以内: 25%
      return basePrice * 0.25;
    } else {
      // 3日以上前: 無料
      return 0.0;
    }
  }

  Future<void> _notifyCancellationFee(Booking booking, double fee) async {
    // キャンセル料金通知の実装
    // 実際のアプリではプッシュ通知やメール送信などを行う
    // ここでは省略
  }
}

/// 予約一覧を取得するUseCase
class GetBookingsUseCase {
  GetBookingsUseCase({
    required BookingRepository bookingRepository,
  }) : _bookingRepository = bookingRepository;

  final BookingRepository _bookingRepository;

  Future<List<Booking>> call(GetBookingsRequest request) async {
    try {
      return await _bookingRepository.getBookings(
        customerId: request.customerId,
        status: request.status,
        startDate: request.startDate,
        endDate: request.endDate,
        limit: request.limit,
      );
    } catch (e) {
      throw BookingFetchException('予約一覧の取得に失敗しました: $e');
    }
  }
}

/// 予約詳細を取得するUseCase
class GetBookingDetailUseCase {
  GetBookingDetailUseCase({
    required BookingRepository bookingRepository,
  }) : _bookingRepository = bookingRepository;

  final BookingRepository _bookingRepository;

  Future<Booking> call(String bookingId, String customerId) async {
    final booking = await _bookingRepository.getBookingById(bookingId);

    if (booking == null) {
      throw BookingNotFoundException('予約が見つかりません（ID: $bookingId）');
    }

    // 所有者確認
    if (booking.customerId != customerId) {
      throw BookingAccessException('この予約にアクセスする権限がありません');
    }

    return booking;
  }
}

// リクエストクラス
class CancelBookingRequest {
  CancelBookingRequest({
    required this.bookingId,
    required this.customerId,
    required this.reason,
    this.cancelledBy,
    this.isEmergencyCancel = false,
  });

  final String bookingId;
  final String customerId;
  final String reason;
  final String? cancelledBy;
  final bool isEmergencyCancel;
}

class GetBookingsRequest {
  GetBookingsRequest({
    required this.customerId,
    this.status,
    this.startDate,
    this.endDate,
    this.limit,
  });

  final String customerId;
  final BookingStatus? status;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? limit;
}

// 例外クラス
class BookingCancellationException implements Exception {
  BookingCancellationException(this.message);

  final String message;

  @override
  String toString() => 'BookingCancellationException: $message';
}

class BookingFetchException implements Exception {
  BookingFetchException(this.message);

  final String message;

  @override
  String toString() => 'BookingFetchException: $message';
}

class BookingAccessException implements Exception {
  BookingAccessException(this.message);

  final String message;

  @override
  String toString() => 'BookingAccessException: $message';
}

class BookingNotFoundException implements Exception {
  BookingNotFoundException(this.message);

  final String message;

  @override
  String toString() => 'BookingNotFoundException: $message';
}
