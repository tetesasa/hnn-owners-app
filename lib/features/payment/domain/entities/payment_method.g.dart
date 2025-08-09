// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      id: json['id'] as String,
      type: $enumDecode(_$PaymentMethodTypeEnumMap, json['type']),
      customerId: json['customerId'] as String? ?? '',
      card: json['card'] == null
          ? null
          : CardDetails.fromJson(json['card'] as Map<String, dynamic>),
      wallet: json['wallet'] == null
          ? null
          : WalletDetails.fromJson(json['wallet'] as Map<String, dynamic>),
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      isDefault: json['isDefault'] as bool? ?? false,
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$PaymentMethodTypeEnumMap[instance.type]!,
      'customerId': instance.customerId,
      'card': instance.card,
      'wallet': instance.wallet,
      'metadata': instance.metadata,
      'created': instance.created?.toIso8601String(),
      'isDefault': instance.isDefault,
    };

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.card: 'card',
  PaymentMethodType.applePay: 'applePay',
  PaymentMethodType.googlePay: 'googlePay',
};

_$CardDetailsImpl _$$CardDetailsImplFromJson(Map<String, dynamic> json) =>
    _$CardDetailsImpl(
      last4: json['last4'] as String,
      brand: json['brand'] as String,
      expMonth: (json['expMonth'] as num).toInt(),
      expYear: (json['expYear'] as num).toInt(),
      country: json['country'] as String?,
      funding: json['funding'] as String?,
    );

Map<String, dynamic> _$$CardDetailsImplToJson(_$CardDetailsImpl instance) =>
    <String, dynamic>{
      'last4': instance.last4,
      'brand': instance.brand,
      'expMonth': instance.expMonth,
      'expYear': instance.expYear,
      'country': instance.country,
      'funding': instance.funding,
    };

_$WalletDetailsImpl _$$WalletDetailsImplFromJson(Map<String, dynamic> json) =>
    _$WalletDetailsImpl(
      type: $enumDecode(_$WalletTypeEnumMap, json['type']),
      email: json['email'] as String?,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$WalletDetailsImplToJson(_$WalletDetailsImpl instance) =>
    <String, dynamic>{
      'type': _$WalletTypeEnumMap[instance.type]!,
      'email': instance.email,
      'additionalData': instance.additionalData,
    };

const _$WalletTypeEnumMap = {
  WalletType.applePay: 'applePay',
  WalletType.googlePay: 'googlePay',
};
