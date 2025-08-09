import 'package:freezed_annotation/freezed_annotation.dart';

part 'mobile_payment_config.freezed.dart';
part 'mobile_payment_config.g.dart';

/// モバイル決済設定エンティティ
@freezed
class MobilePaymentConfig with _$MobilePaymentConfig {
  const MobilePaymentConfig._();

  const factory MobilePaymentConfig({
    /// Apple Pay設定
    ApplePayConfig? applePay,

    /// Google Pay設定
    GooglePayConfig? googlePay,

    /// 利用可能通貨
    @Default('JPY') String currency,

    /// 商品詳細
    String? merchantDisplayName,

    /// 決済環境（test/production）
    @Default(PaymentEnvironment.test) PaymentEnvironment environment,

    /// サポートされている決済方法
    @Default([]) List<PaymentMethodType> supportedMethods,

    /// 追加設定
    Map<String, dynamic>? additionalConfig,
  }) = _MobilePaymentConfig;

  factory MobilePaymentConfig.fromJson(Map<String, dynamic> json) =>
      _$MobilePaymentConfigFromJson(json);

  /// デフォルト設定（開発用）
  factory MobilePaymentConfig.development() {
    return const MobilePaymentConfig(
      applePay: ApplePayConfig(
        merchantId: 'merchant.com.hnn.owners',
        countryCode: 'JP',
        currencyCode: 'JPY',
        merchantCapabilities: [
          ApplePayMerchantCapability.capability3DS,
          ApplePayMerchantCapability.capabilityEMV,
        ],
        supportedNetworks: [
          ApplePaySupportedNetwork.visa,
          ApplePaySupportedNetwork.masterCard,
          ApplePaySupportedNetwork.jcb,
        ],
      ),
      googlePay: GooglePayConfig(
        merchantId: 'merchant.com.hnn.owners',
        environment: GooglePayEnvironment.test,
        countryCode: 'JP',
        currencyCode: 'JPY',
        allowedCardNetworks: [
          GooglePayCardNetwork.visa,
          GooglePayCardNetwork.mastercard,
          GooglePayCardNetwork.jcb,
        ],
        allowedCardAuthMethods: [
          GooglePayCardAuthMethod.panOnly,
          GooglePayCardAuthMethod.cryptogram3ds,
        ],
      ),
      currency: 'JPY',
      merchantDisplayName: 'HNN Cat Home Service',
      environment: PaymentEnvironment.test,
      supportedMethods: [
        PaymentMethodType.applePay,
        PaymentMethodType.googlePay,
      ],
    );
  }

  /// 本番設定
  factory MobilePaymentConfig.production() {
    return const MobilePaymentConfig(
      applePay: ApplePayConfig(
        merchantId: 'merchant.com.hnn.owners.production',
        countryCode: 'JP',
        currencyCode: 'JPY',
        merchantCapabilities: [
          ApplePayMerchantCapability.capability3DS,
          ApplePayMerchantCapability.capabilityEMV,
        ],
        supportedNetworks: [
          ApplePaySupportedNetwork.visa,
          ApplePaySupportedNetwork.masterCard,
          ApplePaySupportedNetwork.jcb,
          ApplePaySupportedNetwork.americanExpress,
        ],
      ),
      googlePay: GooglePayConfig(
        merchantId: 'merchant.com.hnn.owners.production',
        environment: GooglePayEnvironment.production,
        countryCode: 'JP',
        currencyCode: 'JPY',
        allowedCardNetworks: [
          GooglePayCardNetwork.visa,
          GooglePayCardNetwork.mastercard,
          GooglePayCardNetwork.jcb,
          GooglePayCardNetwork.americanExpress,
        ],
        allowedCardAuthMethods: [
          GooglePayCardAuthMethod.panOnly,
          GooglePayCardAuthMethod.cryptogram3ds,
        ],
      ),
      currency: 'JPY',
      merchantDisplayName: 'HNN Cat Home Service',
      environment: PaymentEnvironment.production,
      supportedMethods: [
        PaymentMethodType.applePay,
        PaymentMethodType.googlePay,
      ],
    );
  }

  /// Apple Pay利用可能かチェック
  bool get isApplePaySupported =>
      applePay != null && supportedMethods.contains(PaymentMethodType.applePay);

  /// Google Pay利用可能かチェック
  bool get isGooglePaySupported =>
      googlePay != null &&
      supportedMethods.contains(PaymentMethodType.googlePay);

  /// 本番環境かチェック
  bool get isProduction => environment == PaymentEnvironment.production;

  /// テスト環境かチェック
  bool get isTest => environment == PaymentEnvironment.test;
}

/// Apple Pay設定
@freezed
class ApplePayConfig with _$ApplePayConfig {
  const factory ApplePayConfig({
    required String merchantId,
    required String countryCode,
    required String currencyCode,
    @Default([]) List<ApplePayMerchantCapability> merchantCapabilities,
    @Default([]) List<ApplePaySupportedNetwork> supportedNetworks,
    String? merchantDisplayName,
    Map<String, dynamic>? additionalConfig,
  }) = _ApplePayConfig;

  factory ApplePayConfig.fromJson(Map<String, dynamic> json) =>
      _$ApplePayConfigFromJson(json);
}

/// Google Pay設定
@freezed
class GooglePayConfig with _$GooglePayConfig {
  const factory GooglePayConfig({
    required String merchantId,
    required GooglePayEnvironment environment,
    required String countryCode,
    required String currencyCode,
    @Default([]) List<GooglePayCardNetwork> allowedCardNetworks,
    @Default([]) List<GooglePayCardAuthMethod> allowedCardAuthMethods,
    String? merchantName,
    Map<String, dynamic>? additionalConfig,
  }) = _GooglePayConfig;

  factory GooglePayConfig.fromJson(Map<String, dynamic> json) =>
      _$GooglePayConfigFromJson(json);
}

/// 決済環境
enum PaymentEnvironment {
  test,
  production,
}

/// 決済方法タイプ
enum PaymentMethodType {
  applePay,
  googlePay,
  creditCard,
}

/// Apple Pay マーチャント機能
enum ApplePayMerchantCapability {
  capability3DS,
  capabilityEMV,
  capabilityCredit,
  capabilityDebit,
}

/// Apple Pay サポートネットワーク
enum ApplePaySupportedNetwork {
  visa,
  masterCard,
  americanExpress,
  discover,
  jcb,
  chinaUnionPay,
  interac,
  eftpos,
  electron,
  maestro,
  vPay,
}

/// Google Pay環境
enum GooglePayEnvironment {
  test,
  production,
}

/// Google Pay カードネットワーク
enum GooglePayCardNetwork {
  visa,
  mastercard,
  americanExpress,
  discover,
  jcb,
  interac,
}

/// Google Pay認証方法
enum GooglePayCardAuthMethod {
  panOnly,
  cryptogram3ds,
}

/// モバイル決済結果
@freezed
class MobilePaymentResult with _$MobilePaymentResult {
  const MobilePaymentResult._();

  const factory MobilePaymentResult({
    required String paymentMethodId,
    required PaymentMethodType type,
    required String token,
    Map<String, dynamic>? billingContact,
    Map<String, dynamic>? shippingContact,
    String? transactionId,
    Map<String, dynamic>? additionalData,
  }) = _MobilePaymentResult;

  factory MobilePaymentResult.fromJson(Map<String, dynamic> json) =>
      _$MobilePaymentResultFromJson(json);

  /// Apple Payの結果かチェック
  bool get isApplePay => type == PaymentMethodType.applePay;

  /// Google Payの結果かチェック
  bool get isGooglePay => type == PaymentMethodType.googlePay;
}

/// モバイル決済エラー
@freezed
class MobilePaymentError with _$MobilePaymentError {
  const factory MobilePaymentError({
    required MobilePaymentErrorType type,
    required String message,
    String? code,
    Map<String, dynamic>? details,
  }) = _MobilePaymentError;

  factory MobilePaymentError.fromJson(Map<String, dynamic> json) =>
      _$MobilePaymentErrorFromJson(json);
}

/// モバイル決済エラータイプ
enum MobilePaymentErrorType {
  /// デバイス非対応
  deviceNotSupported,

  /// 決済方法未設定
  paymentMethodNotSetup,

  /// ネットワークエラー
  networkError,

  /// ユーザーキャンセル
  userCancelled,

  /// 認証失敗
  authenticationFailed,

  /// 無効な設定
  invalidConfiguration,

  /// 不明なエラー
  unknown,
}

/// 決済アイテム
@freezed
class PaymentItem with _$PaymentItem {
  const factory PaymentItem({
    required String label,
    required String amount,
    @Default(PaymentItemType.finalItem) PaymentItemType type,
  }) = _PaymentItem;

  factory PaymentItem.fromJson(Map<String, dynamic> json) =>
      _$PaymentItemFromJson(json);
}

/// 決済アイテムタイプ
enum PaymentItemType {
  finalItem,
  pending,
}

extension PaymentEnvironmentExtension on PaymentEnvironment {
  String get displayName {
    switch (this) {
      case PaymentEnvironment.test:
        return 'テスト';
      case PaymentEnvironment.production:
        return '本番';
    }
  }
}

extension PaymentMethodTypeExtension on PaymentMethodType {
  String get displayName {
    switch (this) {
      case PaymentMethodType.applePay:
        return 'Apple Pay';
      case PaymentMethodType.googlePay:
        return 'Google Pay';
      case PaymentMethodType.creditCard:
        return 'クレジットカード';
    }
  }

  String get iconAsset {
    switch (this) {
      case PaymentMethodType.applePay:
        return 'assets/icons/apple_pay.png';
      case PaymentMethodType.googlePay:
        return 'assets/icons/google_pay.png';
      case PaymentMethodType.creditCard:
        return 'assets/icons/credit_card.png';
    }
  }
}

extension MobilePaymentErrorTypeExtension on MobilePaymentErrorType {
  String get displayMessage {
    switch (this) {
      case MobilePaymentErrorType.deviceNotSupported:
        return 'このデバイスでは利用できません';
      case MobilePaymentErrorType.paymentMethodNotSetup:
        return '決済方法が設定されていません';
      case MobilePaymentErrorType.networkError:
        return 'ネットワークエラーが発生しました';
      case MobilePaymentErrorType.userCancelled:
        return '決済がキャンセルされました';
      case MobilePaymentErrorType.authenticationFailed:
        return '認証に失敗しました';
      case MobilePaymentErrorType.invalidConfiguration:
        return '決済設定に問題があります';
      case MobilePaymentErrorType.unknown:
        return '不明なエラーが発生しました';
    }
  }
}
