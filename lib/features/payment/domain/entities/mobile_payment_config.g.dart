// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_payment_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MobilePaymentConfigImpl _$$MobilePaymentConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$MobilePaymentConfigImpl(
      applePay: json['applePay'] == null
          ? null
          : ApplePayConfig.fromJson(json['applePay'] as Map<String, dynamic>),
      googlePay: json['googlePay'] == null
          ? null
          : GooglePayConfig.fromJson(json['googlePay'] as Map<String, dynamic>),
      currency: json['currency'] as String? ?? 'JPY',
      merchantDisplayName: json['merchantDisplayName'] as String?,
      environment: $enumDecodeNullable(
              _$PaymentEnvironmentEnumMap, json['environment']) ??
          PaymentEnvironment.test,
      supportedMethods: (json['supportedMethods'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$PaymentMethodTypeEnumMap, e))
              .toList() ??
          const [],
      additionalConfig: json['additionalConfig'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MobilePaymentConfigImplToJson(
        _$MobilePaymentConfigImpl instance) =>
    <String, dynamic>{
      'applePay': instance.applePay,
      'googlePay': instance.googlePay,
      'currency': instance.currency,
      'merchantDisplayName': instance.merchantDisplayName,
      'environment': _$PaymentEnvironmentEnumMap[instance.environment]!,
      'supportedMethods': instance.supportedMethods
          .map((e) => _$PaymentMethodTypeEnumMap[e]!)
          .toList(),
      'additionalConfig': instance.additionalConfig,
    };

const _$PaymentEnvironmentEnumMap = {
  PaymentEnvironment.test: 'test',
  PaymentEnvironment.production: 'production',
};

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.applePay: 'applePay',
  PaymentMethodType.googlePay: 'googlePay',
  PaymentMethodType.creditCard: 'creditCard',
};

_$ApplePayConfigImpl _$$ApplePayConfigImplFromJson(Map<String, dynamic> json) =>
    _$ApplePayConfigImpl(
      merchantId: json['merchantId'] as String,
      countryCode: json['countryCode'] as String,
      currencyCode: json['currencyCode'] as String,
      merchantCapabilities: (json['merchantCapabilities'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$ApplePayMerchantCapabilityEnumMap, e))
              .toList() ??
          const [],
      supportedNetworks: (json['supportedNetworks'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$ApplePaySupportedNetworkEnumMap, e))
              .toList() ??
          const [],
      merchantDisplayName: json['merchantDisplayName'] as String?,
      additionalConfig: json['additionalConfig'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ApplePayConfigImplToJson(
        _$ApplePayConfigImpl instance) =>
    <String, dynamic>{
      'merchantId': instance.merchantId,
      'countryCode': instance.countryCode,
      'currencyCode': instance.currencyCode,
      'merchantCapabilities': instance.merchantCapabilities
          .map((e) => _$ApplePayMerchantCapabilityEnumMap[e]!)
          .toList(),
      'supportedNetworks': instance.supportedNetworks
          .map((e) => _$ApplePaySupportedNetworkEnumMap[e]!)
          .toList(),
      'merchantDisplayName': instance.merchantDisplayName,
      'additionalConfig': instance.additionalConfig,
    };

const _$ApplePayMerchantCapabilityEnumMap = {
  ApplePayMerchantCapability.capability3DS: 'capability3DS',
  ApplePayMerchantCapability.capabilityEMV: 'capabilityEMV',
  ApplePayMerchantCapability.capabilityCredit: 'capabilityCredit',
  ApplePayMerchantCapability.capabilityDebit: 'capabilityDebit',
};

const _$ApplePaySupportedNetworkEnumMap = {
  ApplePaySupportedNetwork.visa: 'visa',
  ApplePaySupportedNetwork.masterCard: 'masterCard',
  ApplePaySupportedNetwork.americanExpress: 'americanExpress',
  ApplePaySupportedNetwork.discover: 'discover',
  ApplePaySupportedNetwork.jcb: 'jcb',
  ApplePaySupportedNetwork.chinaUnionPay: 'chinaUnionPay',
  ApplePaySupportedNetwork.interac: 'interac',
  ApplePaySupportedNetwork.eftpos: 'eftpos',
  ApplePaySupportedNetwork.electron: 'electron',
  ApplePaySupportedNetwork.maestro: 'maestro',
  ApplePaySupportedNetwork.vPay: 'vPay',
};

_$GooglePayConfigImpl _$$GooglePayConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$GooglePayConfigImpl(
      merchantId: json['merchantId'] as String,
      environment:
          $enumDecode(_$GooglePayEnvironmentEnumMap, json['environment']),
      countryCode: json['countryCode'] as String,
      currencyCode: json['currencyCode'] as String,
      allowedCardNetworks: (json['allowedCardNetworks'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$GooglePayCardNetworkEnumMap, e))
              .toList() ??
          const [],
      allowedCardAuthMethods: (json['allowedCardAuthMethods'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$GooglePayCardAuthMethodEnumMap, e))
              .toList() ??
          const [],
      merchantName: json['merchantName'] as String?,
      additionalConfig: json['additionalConfig'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$GooglePayConfigImplToJson(
        _$GooglePayConfigImpl instance) =>
    <String, dynamic>{
      'merchantId': instance.merchantId,
      'environment': _$GooglePayEnvironmentEnumMap[instance.environment]!,
      'countryCode': instance.countryCode,
      'currencyCode': instance.currencyCode,
      'allowedCardNetworks': instance.allowedCardNetworks
          .map((e) => _$GooglePayCardNetworkEnumMap[e]!)
          .toList(),
      'allowedCardAuthMethods': instance.allowedCardAuthMethods
          .map((e) => _$GooglePayCardAuthMethodEnumMap[e]!)
          .toList(),
      'merchantName': instance.merchantName,
      'additionalConfig': instance.additionalConfig,
    };

const _$GooglePayEnvironmentEnumMap = {
  GooglePayEnvironment.test: 'test',
  GooglePayEnvironment.production: 'production',
};

const _$GooglePayCardNetworkEnumMap = {
  GooglePayCardNetwork.visa: 'visa',
  GooglePayCardNetwork.mastercard: 'mastercard',
  GooglePayCardNetwork.americanExpress: 'americanExpress',
  GooglePayCardNetwork.discover: 'discover',
  GooglePayCardNetwork.jcb: 'jcb',
  GooglePayCardNetwork.interac: 'interac',
};

const _$GooglePayCardAuthMethodEnumMap = {
  GooglePayCardAuthMethod.panOnly: 'panOnly',
  GooglePayCardAuthMethod.cryptogram3ds: 'cryptogram3ds',
};

_$MobilePaymentResultImpl _$$MobilePaymentResultImplFromJson(
        Map<String, dynamic> json) =>
    _$MobilePaymentResultImpl(
      paymentMethodId: json['paymentMethodId'] as String,
      type: $enumDecode(_$PaymentMethodTypeEnumMap, json['type']),
      token: json['token'] as String,
      billingContact: json['billingContact'] as Map<String, dynamic>?,
      shippingContact: json['shippingContact'] as Map<String, dynamic>?,
      transactionId: json['transactionId'] as String?,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MobilePaymentResultImplToJson(
        _$MobilePaymentResultImpl instance) =>
    <String, dynamic>{
      'paymentMethodId': instance.paymentMethodId,
      'type': _$PaymentMethodTypeEnumMap[instance.type]!,
      'token': instance.token,
      'billingContact': instance.billingContact,
      'shippingContact': instance.shippingContact,
      'transactionId': instance.transactionId,
      'additionalData': instance.additionalData,
    };

_$MobilePaymentErrorImpl _$$MobilePaymentErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$MobilePaymentErrorImpl(
      type: $enumDecode(_$MobilePaymentErrorTypeEnumMap, json['type']),
      message: json['message'] as String,
      code: json['code'] as String?,
      details: json['details'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MobilePaymentErrorImplToJson(
        _$MobilePaymentErrorImpl instance) =>
    <String, dynamic>{
      'type': _$MobilePaymentErrorTypeEnumMap[instance.type]!,
      'message': instance.message,
      'code': instance.code,
      'details': instance.details,
    };

const _$MobilePaymentErrorTypeEnumMap = {
  MobilePaymentErrorType.deviceNotSupported: 'deviceNotSupported',
  MobilePaymentErrorType.paymentMethodNotSetup: 'paymentMethodNotSetup',
  MobilePaymentErrorType.networkError: 'networkError',
  MobilePaymentErrorType.userCancelled: 'userCancelled',
  MobilePaymentErrorType.authenticationFailed: 'authenticationFailed',
  MobilePaymentErrorType.invalidConfiguration: 'invalidConfiguration',
  MobilePaymentErrorType.unknown: 'unknown',
};

_$PaymentItemImpl _$$PaymentItemImplFromJson(Map<String, dynamic> json) =>
    _$PaymentItemImpl(
      label: json['label'] as String,
      amount: json['amount'] as String,
      type: $enumDecodeNullable(_$PaymentItemTypeEnumMap, json['type']) ??
          PaymentItemType.finalItem,
    );

Map<String, dynamic> _$$PaymentItemImplToJson(_$PaymentItemImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'amount': instance.amount,
      'type': _$PaymentItemTypeEnumMap[instance.type]!,
    };

const _$PaymentItemTypeEnumMap = {
  PaymentItemType.finalItem: 'finalItem',
  PaymentItemType.pending: 'pending',
};
