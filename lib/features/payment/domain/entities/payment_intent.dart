import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_intent.freezed.dart';
part 'payment_intent.g.dart';

@freezed
class PaymentIntent with _$PaymentIntent {
  const PaymentIntent._();

  const factory PaymentIntent({
    required String id,
    required String clientSecret,
    required int amount,
    required String currency,
    required PaymentIntentStatus status,
    String? customerId,
    String? paymentMethodId,
    String? description,
    String? bookingId,
    Map<String, String>? metadata,
    DateTime? created,
    DateTime? updated,
    String? lastPaymentError,
    bool? livemode,
  }) = _PaymentIntent;

  factory PaymentIntent.fromJson(Map<String, dynamic> json) =>
      _$PaymentIntentFromJson(json);

  // Firestoreとの変換用メソッド
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'clientSecret': clientSecret,
      'amount': amount,
      'currency': currency,
      'status': status.name,
      'customerId': customerId,
      'paymentMethodId': paymentMethodId,
      'description': description,
      'bookingId': bookingId,
      'metadata': metadata,
      'created': created?.toIso8601String(),
      'updated': updated?.toIso8601String(),
      'lastPaymentError': lastPaymentError,
      'livemode': livemode,
    };
  }

  factory PaymentIntent.fromFirestore(Map<String, dynamic> data) {
    return PaymentIntent(
      id: data['id'] ?? '',
      clientSecret: data['clientSecret'] ?? '',
      amount: data['amount'] ?? 0,
      currency: data['currency'] ?? 'jpy',
      status: PaymentIntentStatus.values.firstWhere(
        (s) => s.name == data['status'],
        orElse: () => PaymentIntentStatus.pending,
      ),
      customerId: data['customerId'],
      paymentMethodId: data['paymentMethodId'],
      description: data['description'],
      bookingId: data['bookingId'],
      metadata: data['metadata'] != null
          ? Map<String, String>.from(data['metadata'])
          : null,
      created: data['created'] != null ? DateTime.parse(data['created']) : null,
      updated: data['updated'] != null ? DateTime.parse(data['updated']) : null,
      lastPaymentError: data['lastPaymentError'],
      livemode: data['livemode'],
    );
  }

  // Stripe APIレスポンスからの変換
  factory PaymentIntent.fromStripeResponse(Map<String, dynamic> data) {
    return PaymentIntent(
      id: data['id'] ?? '',
      clientSecret: data['client_secret'] ?? '',
      amount: data['amount'] ?? 0,
      currency: data['currency'] ?? 'jpy',
      status: _mapStripeStatus(data['status']),
      customerId: data['customer'],
      paymentMethodId: data['payment_method'],
      description: data['description'],
      metadata: data['metadata'] != null
          ? Map<String, String>.from(data['metadata'])
          : null,
      created: data['created'] != null
          ? DateTime.fromMillisecondsSinceEpoch(data['created'] * 1000)
          : null,
      lastPaymentError: data['last_payment_error']?['message'],
      livemode: data['livemode'],
    );
  }

  static PaymentIntentStatus _mapStripeStatus(String? status) {
    switch (status) {
      case 'requires_payment_method':
        return PaymentIntentStatus.requiresPaymentMethod;
      case 'requires_confirmation':
        return PaymentIntentStatus.requiresConfirmation;
      case 'requires_action':
        return PaymentIntentStatus.requiresAction;
      case 'processing':
        return PaymentIntentStatus.processing;
      case 'requires_capture':
        return PaymentIntentStatus.requiresCapture;
      case 'canceled':
        return PaymentIntentStatus.canceled;
      case 'succeeded':
        return PaymentIntentStatus.succeeded;
      default:
        return PaymentIntentStatus.pending;
    }
  }

  // 金額を円表記にフォーマット
  String get formattedAmount {
    if (currency.toLowerCase() == 'jpy') {
      return '¥${amount.toString().replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},',
          )}';
    }
    return '$amount $currency';
  }

  // 決済が成功したかどうか
  bool get isSucceeded => status == PaymentIntentStatus.succeeded;

  // 決済にアクションが必要かどうか
  bool get requiresAction => status == PaymentIntentStatus.requiresAction;

  // 決済が失敗したかどうか
  bool get isFailed =>
      status == PaymentIntentStatus.canceled || lastPaymentError != null;
}

enum PaymentIntentStatus {
  pending,
  requiresPaymentMethod,
  requiresConfirmation,
  requiresAction,
  processing,
  requiresCapture,
  canceled,
  succeeded,
}
