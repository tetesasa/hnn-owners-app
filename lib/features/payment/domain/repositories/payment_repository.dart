import '../entities/payment_intent.dart';
import '../entities/payment_method.dart';
import '../../../../core/error/result.dart';

abstract class PaymentRepository {
  // PaymentIntent関連
  Future<Result<PaymentIntent>> createPaymentIntent({
    required int amount,
    required String currency,
    String? customerId,
    String? description,
    String? bookingId,
    Map<String, String>? metadata,
  });

  Future<Result<PaymentIntent>> confirmPaymentIntent({
    required String paymentIntentId,
    required String paymentMethodId,
  });

  Future<Result<PaymentIntent>> getPaymentIntent(String paymentIntentId);

  Future<Result<PaymentIntent>> updatePaymentIntent({
    required String paymentIntentId,
    int? amount,
    String? description,
    Map<String, String>? metadata,
  });

  Future<Result<PaymentIntent>> cancelPaymentIntent(String paymentIntentId);

  // PaymentMethod関連
  Future<Result<PaymentMethod>> createPaymentMethod({
    required PaymentMethodType type,
    required String customerId,
    Map<String, dynamic>? cardData,
    Map<String, dynamic>? walletData,
  });

  Future<Result<void>> attachPaymentMethod({
    required String paymentMethodId,
    required String customerId,
  });

  Future<Result<void>> detachPaymentMethod(String paymentMethodId);

  Future<Result<List<PaymentMethod>>> getCustomerPaymentMethods(
    String customerId,
  );

  Future<Result<void>> setDefaultPaymentMethod({
    required String customerId,
    required String paymentMethodId,
  });

  // Customer関連
  Future<Result<String>> createCustomer({
    required String email,
    String? name,
    String? phone,
    Map<String, String>? address,
    Map<String, String>? metadata,
  });

  Future<Result<Map<String, dynamic>>> getCustomer(String customerId);

  Future<Result<Map<String, dynamic>>> updateCustomer({
    required String customerId,
    String? email,
    String? name,
    String? phone,
    Map<String, String>? address,
    Map<String, String>? metadata,
  });

  // Webhook関連
  Future<Result<bool>> verifyWebhook({
    required String payload,
    required String signature,
    required String endpointSecret,
  });

  Future<Result<void>> handleWebhookEvent({
    required String eventType,
    required Map<String, dynamic> data,
  });

  // 決済履歴
  Future<Result<List<PaymentIntent>>> getPaymentHistory({
    required String customerId,
    int? limit,
    String? startingAfter,
  });

  // 返金処理
  Future<Result<Map<String, dynamic>>> createRefund({
    required String paymentIntentId,
    int? amount,
    String? reason,
    Map<String, String>? metadata,
  });
}
