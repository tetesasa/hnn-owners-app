// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceImpl _$$InvoiceImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceImpl(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      bookingId: json['bookingId'] as String,
      amount: (json['amount'] as num).toInt(),
      currency: json['currency'] as String,
      status: $enumDecode(_$InvoiceStatusEnumMap, json['status']),
      paymentIntentId: json['paymentIntentId'] as String?,
      description: json['description'] as String?,
      lineItems: (json['lineItems'] as List<dynamic>?)
          ?.map((e) => InvoiceLineItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      billing: json['billing'] == null
          ? null
          : InvoiceBilling.fromJson(json['billing'] as Map<String, dynamic>),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      paidAt: json['paidAt'] == null
          ? null
          : DateTime.parse(json['paidAt'] as String),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$InvoiceImplToJson(_$InvoiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'bookingId': instance.bookingId,
      'amount': instance.amount,
      'currency': instance.currency,
      'status': _$InvoiceStatusEnumMap[instance.status]!,
      'paymentIntentId': instance.paymentIntentId,
      'description': instance.description,
      'lineItems': instance.lineItems,
      'billing': instance.billing,
      'dueDate': instance.dueDate?.toIso8601String(),
      'paidAt': instance.paidAt?.toIso8601String(),
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$InvoiceStatusEnumMap = {
  InvoiceStatus.draft: 'draft',
  InvoiceStatus.open: 'open',
  InvoiceStatus.paid: 'paid',
  InvoiceStatus.uncollectible: 'uncollectible',
  InvoiceStatus.void_: 'void_',
};

_$InvoiceLineItemImpl _$$InvoiceLineItemImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceLineItemImpl(
      id: json['id'] as String,
      description: json['description'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitAmount: (json['unitAmount'] as num).toInt(),
      currency: json['currency'] as String?,
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$InvoiceLineItemImplToJson(
        _$InvoiceLineItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'quantity': instance.quantity,
      'unitAmount': instance.unitAmount,
      'currency': instance.currency,
      'metadata': instance.metadata,
    };

_$InvoiceBillingImpl _$$InvoiceBillingImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceBillingImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      address: json['address'] == null
          ? null
          : InvoiceAddress.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InvoiceBillingImplToJson(
        _$InvoiceBillingImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
    };

_$InvoiceAddressImpl _$$InvoiceAddressImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceAddressImpl(
      line1: json['line1'] as String?,
      line2: json['line2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$InvoiceAddressImplToJson(
        _$InvoiceAddressImpl instance) =>
    <String, dynamic>{
      'line1': instance.line1,
      'line2': instance.line2,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
    };
