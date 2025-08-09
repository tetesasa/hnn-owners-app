import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/payment_intent.dart' as domain;
import '../../domain/entities/payment_method.dart';
import '../../domain/repositories/payment_repository.dart';
import '../datasources/stripe_api_client.dart';
import '../../../../core/error/result.dart';

part 'stripe_payment_repository_impl.g.dart';

class StripePaymentRepositoryImpl implements PaymentRepository {
  final StripeApiClient _stripeApiClient;

  StripePaymentRepositoryImpl({
    required StripeApiClient stripeApiClient,
  }) : _stripeApiClient = stripeApiClient;

  @override
  Future<Result<domain.PaymentIntent>> createPaymentIntent({
    required int amount,
    required String currency,
    String? customerId,
    String? description,
    String? bookingId,
    Map<String, String>? metadata,
  }) async {
    try {
      final enhancedMetadata = <String, String>{
        if (bookingId != null) 'booking_id': bookingId,
        'created_by': 'hnn_owners_app',
        'version': '1.0.0',
        ...?metadata,
      };

      final response = await _stripeApiClient.createPaymentIntent(
        amount: amount,
        currency: currency,
        customerId: customerId,
        description: description,
        metadata: enhancedMetadata,
      );

      final paymentIntent = domain.PaymentIntent.fromStripeResponse(response);
      return Result.success(paymentIntent);
    } catch (e) {
      return Result.failure(AppError.payment(
        message: 'Failed to create payment intent: $e',
        code: 'payment_intent_creation_failed',
      ));
    }
  }

  @override
  Future<Result<domain.PaymentIntent>> confirmPaymentIntent({
    required String paymentIntentId,
    required String paymentMethodId,
  }) async {
    try {
      final response = await _stripeApiClient.confirmPaymentIntent(
        paymentIntentId: paymentIntentId,
        paymentMethodId: paymentMethodId,
      );

      final paymentIntent = domain.PaymentIntent.fromStripeResponse(response);
      return Result.success(paymentIntent);
    } catch (e) {
      return Result.failure(AppError.payment(
        message: 'Failed to confirm payment intent: $e',
        code: 'payment_confirmation_failed',
        paymentIntentId: paymentIntentId,
      ));
    }
  }

  @override
  Future<Result<domain.PaymentIntent>> getPaymentIntent(
      String paymentIntentId) async {
    try {
      final response = await _stripeApiClient.getPaymentIntent(paymentIntentId);
      final paymentIntent = domain.PaymentIntent.fromStripeResponse(response);
      return Result.success(paymentIntent);
    } catch (e) {
      return Result.failure(AppError.payment(
        message: 'Failed to get payment intent: $e',
        code: 'payment_intent_retrieval_failed',
        paymentIntentId: paymentIntentId,
      ));
    }
  }

  @override
  Future<Result<domain.PaymentIntent>> updatePaymentIntent({
    required String paymentIntentId,
    int? amount,
    String? description,
    Map<String, String>? metadata,
  }) async {
    try {
      final response = await _stripeApiClient.updatePaymentIntent(
        paymentIntentId: paymentIntentId,
        amount: amount,
        description: description,
        metadata: metadata,
      );

      final paymentIntent = domain.PaymentIntent.fromStripeResponse(response);
      return Result.success(paymentIntent);
    } catch (e) {
      return Result.failure(AppError.payment(
        message: 'Failed to update payment intent: $e',
        code: 'payment_intent_update_failed',
        paymentIntentId: paymentIntentId,
      ));
    }
  }

  @override
  Future<Result<domain.PaymentIntent>> cancelPaymentIntent(
      String paymentIntentId) async {
    try {
      final response =
          await _stripeApiClient.cancelPaymentIntent(paymentIntentId);

      final paymentIntent = domain.PaymentIntent.fromStripeResponse(response);
      return Result.success(paymentIntent);
    } catch (e) {
      return Result.failure(AppError.payment(
        message: 'Failed to cancel payment intent: $e',
        code: 'payment_intent_cancellation_failed',
        paymentIntentId: paymentIntentId,
      ));
    }
  }

  // Simplified stub implementations for other methods
  @override
  Future<Result<PaymentMethod>> createPaymentMethod({
    required PaymentMethodType type,
    required String customerId,
    Map<String, dynamic>? cardData,
    Map<String, dynamic>? walletData,
  }) async {
    // Simplified implementation
    return Result.failure(
        const AppError.unknown(message: 'Not implemented yet'));
  }

  @override
  Future<Result<void>> attachPaymentMethod({
    required String paymentMethodId,
    required String customerId,
  }) async {
    return Result.failure(
        const AppError.unknown(message: 'Not implemented yet'));
  }

  @override
  Future<Result<void>> detachPaymentMethod(String paymentMethodId) async {
    return Result.failure(
        const AppError.unknown(message: 'Not implemented yet'));
  }

  Future<Result<List<PaymentMethod>>> getPaymentMethods({
    required String customerId,
    PaymentMethodType? type,
  }) async {
    return Result.failure(
        const AppError.unknown(message: 'Not implemented yet'));
  }

  @override
  Future<Result<List<PaymentMethod>>> getCustomerPaymentMethods(
      String customerId) async {
    return Result.failure(
        const AppError.unknown(message: 'Not implemented yet'));
  }

  @override
  Future<Result<void>> setDefaultPaymentMethod({
    required String customerId,
    required String paymentMethodId,
  }) async {
    return Result.failure(
        const AppError.unknown(message: 'Not implemented yet'));
  }

  @override
  Future<Result<String>> createCustomer({
    required String email,
    String? name,
    String? phone,
    Map<String, String>? address,
    Map<String, String>? metadata,
  }) async {
    return Result.failure(
        const AppError.unknown(message: 'Not implemented yet'));
  }

  @override
  Future<Result<Map<String, dynamic>>> getCustomer(String customerId) async {
    return Result.failure(
        const AppError.unknown(message: 'Not implemented yet'));
  }

  @override
  Future<Result<Map<String, dynamic>>> updateCustomer({
    required String customerId,
    String? email,
    String? name,
    String? phone,
    Map<String, String>? address,
    Map<String, String>? metadata,
  }) async {
    return Result.failure(
        const AppError.unknown(message: 'Not implemented yet'));
  }

  @override
  Future<Result<bool>> verifyWebhook({
    required String payload,
    required String signature,
    required String endpointSecret,
  }) async {
    return Result.failure(
        const AppError.unknown(message: 'Not implemented yet'));
  }

  @override
  Future<Result<void>> handleWebhookEvent({
    required String eventType,
    required Map<String, dynamic> data,
  }) async {
    return Result.failure(
        const AppError.unknown(message: 'Not implemented yet'));
  }

  @override
  Future<Result<List<domain.PaymentIntent>>> getPaymentHistory({
    required String customerId,
    int? limit,
    String? startingAfter,
  }) async {
    return Result.failure(
        const AppError.unknown(message: 'Not implemented yet'));
  }

  @override
  Future<Result<Map<String, dynamic>>> createRefund({
    required String paymentIntentId,
    int? amount,
    String? reason,
    Map<String, String>? metadata,
  }) async {
    return Result.failure(
        const AppError.unknown(message: 'Not implemented yet'));
  }
}

@riverpod
StripePaymentRepositoryImpl stripePaymentRepositoryImpl(
  Ref ref,
) {
  final stripeClient = ref.watch(stripeApiClientProvider);
  return StripePaymentRepositoryImpl(stripeApiClient: stripeClient);
}

@riverpod
StripeApiClient stripeApiClient(Ref ref) {
  const publishableKey = 'pk_test_...';
  const secretKey = 'sk_test_...';

  return StripeApiClient(
    publishableKey: publishableKey,
    secretKey: secretKey,
  );
}

@riverpod
PaymentRepository paymentRepository(Ref ref) {
  return ref.watch(stripePaymentRepositoryImplProvider);
}
