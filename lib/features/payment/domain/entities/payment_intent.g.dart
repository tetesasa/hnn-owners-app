// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentIntentImpl _$$PaymentIntentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentIntentImpl(
      id: json['id'] as String,
      clientSecret: json['clientSecret'] as String,
      amount: (json['amount'] as num).toInt(),
      currency: json['currency'] as String,
      status: $enumDecode(_$PaymentIntentStatusEnumMap, json['status']),
      customerId: json['customerId'] as String?,
      paymentMethodId: json['paymentMethodId'] as String?,
      description: json['description'] as String?,
      bookingId: json['bookingId'] as String?,
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      lastPaymentError: json['lastPaymentError'] as String?,
      livemode: json['livemode'] as bool?,
    );

Map<String, dynamic> _$$PaymentIntentImplToJson(_$PaymentIntentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientSecret': instance.clientSecret,
      'amount': instance.amount,
      'currency': instance.currency,
      'status': _$PaymentIntentStatusEnumMap[instance.status]!,
      'customerId': instance.customerId,
      'paymentMethodId': instance.paymentMethodId,
      'description': instance.description,
      'bookingId': instance.bookingId,
      'metadata': instance.metadata,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'lastPaymentError': instance.lastPaymentError,
      'livemode': instance.livemode,
    };

const _$PaymentIntentStatusEnumMap = {
  PaymentIntentStatus.pending: 'pending',
  PaymentIntentStatus.requiresPaymentMethod: 'requiresPaymentMethod',
  PaymentIntentStatus.requiresConfirmation: 'requiresConfirmation',
  PaymentIntentStatus.requiresAction: 'requiresAction',
  PaymentIntentStatus.processing: 'processing',
  PaymentIntentStatus.requiresCapture: 'requiresCapture',
  PaymentIntentStatus.canceled: 'canceled',
  PaymentIntentStatus.succeeded: 'succeeded',
};
