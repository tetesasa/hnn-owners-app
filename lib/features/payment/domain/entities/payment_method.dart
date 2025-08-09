import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method.freezed.dart';
part 'payment_method.g.dart';

@freezed
class PaymentMethod with _$PaymentMethod {
  const PaymentMethod._();

  const factory PaymentMethod({
    required String id,
    required PaymentMethodType type,
    @Default('') String customerId,
    CardDetails? card,
    WalletDetails? wallet,
    Map<String, String>? metadata,
    DateTime? created,
    @Default(false) bool isDefault,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  // Firestoreとの変換用メソッド
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'type': type.name,
      'customerId': customerId,
      'card': card?.toFirestore(),
      'wallet': wallet?.toFirestore(),
      'metadata': metadata,
      'created': created?.toIso8601String(),
      'isDefault': isDefault,
    };
  }

  factory PaymentMethod.fromFirestore(Map<String, dynamic> data) {
    return PaymentMethod(
      id: data['id'] ?? '',
      type: PaymentMethodType.values.firstWhere(
        (t) => t.name == data['type'],
        orElse: () => PaymentMethodType.card,
      ),
      customerId: data['customerId'] ?? '',
      card:
          data['card'] != null ? CardDetails.fromFirestore(data['card']) : null,
      wallet: data['wallet'] != null
          ? WalletDetails.fromFirestore(data['wallet'])
          : null,
      metadata: Map<String, String>.from(data['metadata'] ?? {}),
      created: data['created'] != null ? DateTime.parse(data['created']) : null,
      isDefault: data['isDefault'] ?? false,
    );
  }
}

@freezed
class CardDetails with _$CardDetails {
  const CardDetails._();
  
  const factory CardDetails({
    required String last4,
    required String brand,
    required int expMonth,
    required int expYear,
    String? country,
    String? funding,
  }) = _CardDetails;

  factory CardDetails.fromJson(Map<String, dynamic> json) =>
      _$CardDetailsFromJson(json);

  Map<String, dynamic> toFirestore() {
    return {
      'last4': last4,
      'brand': brand,
      'expMonth': expMonth,
      'expYear': expYear,
      'country': country,
      'funding': funding,
    };
  }

  factory CardDetails.fromFirestore(Map<String, dynamic> data) {
    return CardDetails(
      last4: data['last4'] ?? '',
      brand: data['brand'] ?? '',
      expMonth: data['expMonth'] ?? 0,
      expYear: data['expYear'] ?? 0,
      country: data['country'],
      funding: data['funding'],
    );
  }
}

@freezed
class WalletDetails with _$WalletDetails {
  const WalletDetails._();
  
  const factory WalletDetails({
    required WalletType type,
    String? email,
    Map<String, dynamic>? additionalData,
  }) = _WalletDetails;

  factory WalletDetails.fromJson(Map<String, dynamic> json) =>
      _$WalletDetailsFromJson(json);

  Map<String, dynamic> toFirestore() {
    return {
      'type': type.name,
      'email': email,
      'additionalData': additionalData,
    };
  }

  factory WalletDetails.fromFirestore(Map<String, dynamic> data) {
    return WalletDetails(
      type: WalletType.values.firstWhere(
        (t) => t.name == data['type'],
        orElse: () => WalletType.applePay,
      ),
      email: data['email'],
      additionalData: data['additionalData'],
    );
  }
}

enum PaymentMethodType {
  card,
  applePay,
  googlePay,
}

enum WalletType {
  applePay,
  googlePay,
}
