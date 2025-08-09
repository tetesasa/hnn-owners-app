// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mobile_payment_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MobilePaymentConfig _$MobilePaymentConfigFromJson(Map<String, dynamic> json) {
  return _MobilePaymentConfig.fromJson(json);
}

/// @nodoc
mixin _$MobilePaymentConfig {
  /// Apple Pay設定
  ApplePayConfig? get applePay => throw _privateConstructorUsedError;

  /// Google Pay設定
  GooglePayConfig? get googlePay => throw _privateConstructorUsedError;

  /// 利用可能通貨
  String get currency => throw _privateConstructorUsedError;

  /// 商品詳細
  String? get merchantDisplayName => throw _privateConstructorUsedError;

  /// 決済環境（test/production）
  PaymentEnvironment get environment => throw _privateConstructorUsedError;

  /// サポートされている決済方法
  List<PaymentMethodType> get supportedMethods =>
      throw _privateConstructorUsedError;

  /// 追加設定
  Map<String, dynamic>? get additionalConfig =>
      throw _privateConstructorUsedError;

  /// Serializes this MobilePaymentConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MobilePaymentConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MobilePaymentConfigCopyWith<MobilePaymentConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobilePaymentConfigCopyWith<$Res> {
  factory $MobilePaymentConfigCopyWith(
          MobilePaymentConfig value, $Res Function(MobilePaymentConfig) then) =
      _$MobilePaymentConfigCopyWithImpl<$Res, MobilePaymentConfig>;
  @useResult
  $Res call(
      {ApplePayConfig? applePay,
      GooglePayConfig? googlePay,
      String currency,
      String? merchantDisplayName,
      PaymentEnvironment environment,
      List<PaymentMethodType> supportedMethods,
      Map<String, dynamic>? additionalConfig});

  $ApplePayConfigCopyWith<$Res>? get applePay;
  $GooglePayConfigCopyWith<$Res>? get googlePay;
}

/// @nodoc
class _$MobilePaymentConfigCopyWithImpl<$Res, $Val extends MobilePaymentConfig>
    implements $MobilePaymentConfigCopyWith<$Res> {
  _$MobilePaymentConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MobilePaymentConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applePay = freezed,
    Object? googlePay = freezed,
    Object? currency = null,
    Object? merchantDisplayName = freezed,
    Object? environment = null,
    Object? supportedMethods = null,
    Object? additionalConfig = freezed,
  }) {
    return _then(_value.copyWith(
      applePay: freezed == applePay
          ? _value.applePay
          : applePay // ignore: cast_nullable_to_non_nullable
              as ApplePayConfig?,
      googlePay: freezed == googlePay
          ? _value.googlePay
          : googlePay // ignore: cast_nullable_to_non_nullable
              as GooglePayConfig?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      merchantDisplayName: freezed == merchantDisplayName
          ? _value.merchantDisplayName
          : merchantDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      environment: null == environment
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as PaymentEnvironment,
      supportedMethods: null == supportedMethods
          ? _value.supportedMethods
          : supportedMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodType>,
      additionalConfig: freezed == additionalConfig
          ? _value.additionalConfig
          : additionalConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  /// Create a copy of MobilePaymentConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApplePayConfigCopyWith<$Res>? get applePay {
    if (_value.applePay == null) {
      return null;
    }

    return $ApplePayConfigCopyWith<$Res>(_value.applePay!, (value) {
      return _then(_value.copyWith(applePay: value) as $Val);
    });
  }

  /// Create a copy of MobilePaymentConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GooglePayConfigCopyWith<$Res>? get googlePay {
    if (_value.googlePay == null) {
      return null;
    }

    return $GooglePayConfigCopyWith<$Res>(_value.googlePay!, (value) {
      return _then(_value.copyWith(googlePay: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MobilePaymentConfigImplCopyWith<$Res>
    implements $MobilePaymentConfigCopyWith<$Res> {
  factory _$$MobilePaymentConfigImplCopyWith(_$MobilePaymentConfigImpl value,
          $Res Function(_$MobilePaymentConfigImpl) then) =
      __$$MobilePaymentConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApplePayConfig? applePay,
      GooglePayConfig? googlePay,
      String currency,
      String? merchantDisplayName,
      PaymentEnvironment environment,
      List<PaymentMethodType> supportedMethods,
      Map<String, dynamic>? additionalConfig});

  @override
  $ApplePayConfigCopyWith<$Res>? get applePay;
  @override
  $GooglePayConfigCopyWith<$Res>? get googlePay;
}

/// @nodoc
class __$$MobilePaymentConfigImplCopyWithImpl<$Res>
    extends _$MobilePaymentConfigCopyWithImpl<$Res, _$MobilePaymentConfigImpl>
    implements _$$MobilePaymentConfigImplCopyWith<$Res> {
  __$$MobilePaymentConfigImplCopyWithImpl(_$MobilePaymentConfigImpl _value,
      $Res Function(_$MobilePaymentConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of MobilePaymentConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applePay = freezed,
    Object? googlePay = freezed,
    Object? currency = null,
    Object? merchantDisplayName = freezed,
    Object? environment = null,
    Object? supportedMethods = null,
    Object? additionalConfig = freezed,
  }) {
    return _then(_$MobilePaymentConfigImpl(
      applePay: freezed == applePay
          ? _value.applePay
          : applePay // ignore: cast_nullable_to_non_nullable
              as ApplePayConfig?,
      googlePay: freezed == googlePay
          ? _value.googlePay
          : googlePay // ignore: cast_nullable_to_non_nullable
              as GooglePayConfig?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      merchantDisplayName: freezed == merchantDisplayName
          ? _value.merchantDisplayName
          : merchantDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      environment: null == environment
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as PaymentEnvironment,
      supportedMethods: null == supportedMethods
          ? _value._supportedMethods
          : supportedMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodType>,
      additionalConfig: freezed == additionalConfig
          ? _value._additionalConfig
          : additionalConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MobilePaymentConfigImpl extends _MobilePaymentConfig {
  const _$MobilePaymentConfigImpl(
      {this.applePay,
      this.googlePay,
      this.currency = 'JPY',
      this.merchantDisplayName,
      this.environment = PaymentEnvironment.test,
      final List<PaymentMethodType> supportedMethods = const [],
      final Map<String, dynamic>? additionalConfig})
      : _supportedMethods = supportedMethods,
        _additionalConfig = additionalConfig,
        super._();

  factory _$MobilePaymentConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$MobilePaymentConfigImplFromJson(json);

  /// Apple Pay設定
  @override
  final ApplePayConfig? applePay;

  /// Google Pay設定
  @override
  final GooglePayConfig? googlePay;

  /// 利用可能通貨
  @override
  @JsonKey()
  final String currency;

  /// 商品詳細
  @override
  final String? merchantDisplayName;

  /// 決済環境（test/production）
  @override
  @JsonKey()
  final PaymentEnvironment environment;

  /// サポートされている決済方法
  final List<PaymentMethodType> _supportedMethods;

  /// サポートされている決済方法
  @override
  @JsonKey()
  List<PaymentMethodType> get supportedMethods {
    if (_supportedMethods is EqualUnmodifiableListView)
      return _supportedMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedMethods);
  }

  /// 追加設定
  final Map<String, dynamic>? _additionalConfig;

  /// 追加設定
  @override
  Map<String, dynamic>? get additionalConfig {
    final value = _additionalConfig;
    if (value == null) return null;
    if (_additionalConfig is EqualUnmodifiableMapView) return _additionalConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'MobilePaymentConfig(applePay: $applePay, googlePay: $googlePay, currency: $currency, merchantDisplayName: $merchantDisplayName, environment: $environment, supportedMethods: $supportedMethods, additionalConfig: $additionalConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MobilePaymentConfigImpl &&
            (identical(other.applePay, applePay) ||
                other.applePay == applePay) &&
            (identical(other.googlePay, googlePay) ||
                other.googlePay == googlePay) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.merchantDisplayName, merchantDisplayName) ||
                other.merchantDisplayName == merchantDisplayName) &&
            (identical(other.environment, environment) ||
                other.environment == environment) &&
            const DeepCollectionEquality()
                .equals(other._supportedMethods, _supportedMethods) &&
            const DeepCollectionEquality()
                .equals(other._additionalConfig, _additionalConfig));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      applePay,
      googlePay,
      currency,
      merchantDisplayName,
      environment,
      const DeepCollectionEquality().hash(_supportedMethods),
      const DeepCollectionEquality().hash(_additionalConfig));

  /// Create a copy of MobilePaymentConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MobilePaymentConfigImplCopyWith<_$MobilePaymentConfigImpl> get copyWith =>
      __$$MobilePaymentConfigImplCopyWithImpl<_$MobilePaymentConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MobilePaymentConfigImplToJson(
      this,
    );
  }
}

abstract class _MobilePaymentConfig extends MobilePaymentConfig {
  const factory _MobilePaymentConfig(
          {final ApplePayConfig? applePay,
          final GooglePayConfig? googlePay,
          final String currency,
          final String? merchantDisplayName,
          final PaymentEnvironment environment,
          final List<PaymentMethodType> supportedMethods,
          final Map<String, dynamic>? additionalConfig}) =
      _$MobilePaymentConfigImpl;
  const _MobilePaymentConfig._() : super._();

  factory _MobilePaymentConfig.fromJson(Map<String, dynamic> json) =
      _$MobilePaymentConfigImpl.fromJson;

  /// Apple Pay設定
  @override
  ApplePayConfig? get applePay;

  /// Google Pay設定
  @override
  GooglePayConfig? get googlePay;

  /// 利用可能通貨
  @override
  String get currency;

  /// 商品詳細
  @override
  String? get merchantDisplayName;

  /// 決済環境（test/production）
  @override
  PaymentEnvironment get environment;

  /// サポートされている決済方法
  @override
  List<PaymentMethodType> get supportedMethods;

  /// 追加設定
  @override
  Map<String, dynamic>? get additionalConfig;

  /// Create a copy of MobilePaymentConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MobilePaymentConfigImplCopyWith<_$MobilePaymentConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApplePayConfig _$ApplePayConfigFromJson(Map<String, dynamic> json) {
  return _ApplePayConfig.fromJson(json);
}

/// @nodoc
mixin _$ApplePayConfig {
  String get merchantId => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get currencyCode => throw _privateConstructorUsedError;
  List<ApplePayMerchantCapability> get merchantCapabilities =>
      throw _privateConstructorUsedError;
  List<ApplePaySupportedNetwork> get supportedNetworks =>
      throw _privateConstructorUsedError;
  String? get merchantDisplayName => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalConfig =>
      throw _privateConstructorUsedError;

  /// Serializes this ApplePayConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApplePayConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplePayConfigCopyWith<ApplePayConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplePayConfigCopyWith<$Res> {
  factory $ApplePayConfigCopyWith(
          ApplePayConfig value, $Res Function(ApplePayConfig) then) =
      _$ApplePayConfigCopyWithImpl<$Res, ApplePayConfig>;
  @useResult
  $Res call(
      {String merchantId,
      String countryCode,
      String currencyCode,
      List<ApplePayMerchantCapability> merchantCapabilities,
      List<ApplePaySupportedNetwork> supportedNetworks,
      String? merchantDisplayName,
      Map<String, dynamic>? additionalConfig});
}

/// @nodoc
class _$ApplePayConfigCopyWithImpl<$Res, $Val extends ApplePayConfig>
    implements $ApplePayConfigCopyWith<$Res> {
  _$ApplePayConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplePayConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchantId = null,
    Object? countryCode = null,
    Object? currencyCode = null,
    Object? merchantCapabilities = null,
    Object? supportedNetworks = null,
    Object? merchantDisplayName = freezed,
    Object? additionalConfig = freezed,
  }) {
    return _then(_value.copyWith(
      merchantId: null == merchantId
          ? _value.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      merchantCapabilities: null == merchantCapabilities
          ? _value.merchantCapabilities
          : merchantCapabilities // ignore: cast_nullable_to_non_nullable
              as List<ApplePayMerchantCapability>,
      supportedNetworks: null == supportedNetworks
          ? _value.supportedNetworks
          : supportedNetworks // ignore: cast_nullable_to_non_nullable
              as List<ApplePaySupportedNetwork>,
      merchantDisplayName: freezed == merchantDisplayName
          ? _value.merchantDisplayName
          : merchantDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalConfig: freezed == additionalConfig
          ? _value.additionalConfig
          : additionalConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplePayConfigImplCopyWith<$Res>
    implements $ApplePayConfigCopyWith<$Res> {
  factory _$$ApplePayConfigImplCopyWith(_$ApplePayConfigImpl value,
          $Res Function(_$ApplePayConfigImpl) then) =
      __$$ApplePayConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String merchantId,
      String countryCode,
      String currencyCode,
      List<ApplePayMerchantCapability> merchantCapabilities,
      List<ApplePaySupportedNetwork> supportedNetworks,
      String? merchantDisplayName,
      Map<String, dynamic>? additionalConfig});
}

/// @nodoc
class __$$ApplePayConfigImplCopyWithImpl<$Res>
    extends _$ApplePayConfigCopyWithImpl<$Res, _$ApplePayConfigImpl>
    implements _$$ApplePayConfigImplCopyWith<$Res> {
  __$$ApplePayConfigImplCopyWithImpl(
      _$ApplePayConfigImpl _value, $Res Function(_$ApplePayConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApplePayConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchantId = null,
    Object? countryCode = null,
    Object? currencyCode = null,
    Object? merchantCapabilities = null,
    Object? supportedNetworks = null,
    Object? merchantDisplayName = freezed,
    Object? additionalConfig = freezed,
  }) {
    return _then(_$ApplePayConfigImpl(
      merchantId: null == merchantId
          ? _value.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      merchantCapabilities: null == merchantCapabilities
          ? _value._merchantCapabilities
          : merchantCapabilities // ignore: cast_nullable_to_non_nullable
              as List<ApplePayMerchantCapability>,
      supportedNetworks: null == supportedNetworks
          ? _value._supportedNetworks
          : supportedNetworks // ignore: cast_nullable_to_non_nullable
              as List<ApplePaySupportedNetwork>,
      merchantDisplayName: freezed == merchantDisplayName
          ? _value.merchantDisplayName
          : merchantDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalConfig: freezed == additionalConfig
          ? _value._additionalConfig
          : additionalConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplePayConfigImpl implements _ApplePayConfig {
  const _$ApplePayConfigImpl(
      {required this.merchantId,
      required this.countryCode,
      required this.currencyCode,
      final List<ApplePayMerchantCapability> merchantCapabilities = const [],
      final List<ApplePaySupportedNetwork> supportedNetworks = const [],
      this.merchantDisplayName,
      final Map<String, dynamic>? additionalConfig})
      : _merchantCapabilities = merchantCapabilities,
        _supportedNetworks = supportedNetworks,
        _additionalConfig = additionalConfig;

  factory _$ApplePayConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplePayConfigImplFromJson(json);

  @override
  final String merchantId;
  @override
  final String countryCode;
  @override
  final String currencyCode;
  final List<ApplePayMerchantCapability> _merchantCapabilities;
  @override
  @JsonKey()
  List<ApplePayMerchantCapability> get merchantCapabilities {
    if (_merchantCapabilities is EqualUnmodifiableListView)
      return _merchantCapabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_merchantCapabilities);
  }

  final List<ApplePaySupportedNetwork> _supportedNetworks;
  @override
  @JsonKey()
  List<ApplePaySupportedNetwork> get supportedNetworks {
    if (_supportedNetworks is EqualUnmodifiableListView)
      return _supportedNetworks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedNetworks);
  }

  @override
  final String? merchantDisplayName;
  final Map<String, dynamic>? _additionalConfig;
  @override
  Map<String, dynamic>? get additionalConfig {
    final value = _additionalConfig;
    if (value == null) return null;
    if (_additionalConfig is EqualUnmodifiableMapView) return _additionalConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ApplePayConfig(merchantId: $merchantId, countryCode: $countryCode, currencyCode: $currencyCode, merchantCapabilities: $merchantCapabilities, supportedNetworks: $supportedNetworks, merchantDisplayName: $merchantDisplayName, additionalConfig: $additionalConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplePayConfigImpl &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            const DeepCollectionEquality()
                .equals(other._merchantCapabilities, _merchantCapabilities) &&
            const DeepCollectionEquality()
                .equals(other._supportedNetworks, _supportedNetworks) &&
            (identical(other.merchantDisplayName, merchantDisplayName) ||
                other.merchantDisplayName == merchantDisplayName) &&
            const DeepCollectionEquality()
                .equals(other._additionalConfig, _additionalConfig));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      merchantId,
      countryCode,
      currencyCode,
      const DeepCollectionEquality().hash(_merchantCapabilities),
      const DeepCollectionEquality().hash(_supportedNetworks),
      merchantDisplayName,
      const DeepCollectionEquality().hash(_additionalConfig));

  /// Create a copy of ApplePayConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplePayConfigImplCopyWith<_$ApplePayConfigImpl> get copyWith =>
      __$$ApplePayConfigImplCopyWithImpl<_$ApplePayConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplePayConfigImplToJson(
      this,
    );
  }
}

abstract class _ApplePayConfig implements ApplePayConfig {
  const factory _ApplePayConfig(
      {required final String merchantId,
      required final String countryCode,
      required final String currencyCode,
      final List<ApplePayMerchantCapability> merchantCapabilities,
      final List<ApplePaySupportedNetwork> supportedNetworks,
      final String? merchantDisplayName,
      final Map<String, dynamic>? additionalConfig}) = _$ApplePayConfigImpl;

  factory _ApplePayConfig.fromJson(Map<String, dynamic> json) =
      _$ApplePayConfigImpl.fromJson;

  @override
  String get merchantId;
  @override
  String get countryCode;
  @override
  String get currencyCode;
  @override
  List<ApplePayMerchantCapability> get merchantCapabilities;
  @override
  List<ApplePaySupportedNetwork> get supportedNetworks;
  @override
  String? get merchantDisplayName;
  @override
  Map<String, dynamic>? get additionalConfig;

  /// Create a copy of ApplePayConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplePayConfigImplCopyWith<_$ApplePayConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GooglePayConfig _$GooglePayConfigFromJson(Map<String, dynamic> json) {
  return _GooglePayConfig.fromJson(json);
}

/// @nodoc
mixin _$GooglePayConfig {
  String get merchantId => throw _privateConstructorUsedError;
  GooglePayEnvironment get environment => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get currencyCode => throw _privateConstructorUsedError;
  List<GooglePayCardNetwork> get allowedCardNetworks =>
      throw _privateConstructorUsedError;
  List<GooglePayCardAuthMethod> get allowedCardAuthMethods =>
      throw _privateConstructorUsedError;
  String? get merchantName => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalConfig =>
      throw _privateConstructorUsedError;

  /// Serializes this GooglePayConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GooglePayConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GooglePayConfigCopyWith<GooglePayConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GooglePayConfigCopyWith<$Res> {
  factory $GooglePayConfigCopyWith(
          GooglePayConfig value, $Res Function(GooglePayConfig) then) =
      _$GooglePayConfigCopyWithImpl<$Res, GooglePayConfig>;
  @useResult
  $Res call(
      {String merchantId,
      GooglePayEnvironment environment,
      String countryCode,
      String currencyCode,
      List<GooglePayCardNetwork> allowedCardNetworks,
      List<GooglePayCardAuthMethod> allowedCardAuthMethods,
      String? merchantName,
      Map<String, dynamic>? additionalConfig});
}

/// @nodoc
class _$GooglePayConfigCopyWithImpl<$Res, $Val extends GooglePayConfig>
    implements $GooglePayConfigCopyWith<$Res> {
  _$GooglePayConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GooglePayConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchantId = null,
    Object? environment = null,
    Object? countryCode = null,
    Object? currencyCode = null,
    Object? allowedCardNetworks = null,
    Object? allowedCardAuthMethods = null,
    Object? merchantName = freezed,
    Object? additionalConfig = freezed,
  }) {
    return _then(_value.copyWith(
      merchantId: null == merchantId
          ? _value.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String,
      environment: null == environment
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as GooglePayEnvironment,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      allowedCardNetworks: null == allowedCardNetworks
          ? _value.allowedCardNetworks
          : allowedCardNetworks // ignore: cast_nullable_to_non_nullable
              as List<GooglePayCardNetwork>,
      allowedCardAuthMethods: null == allowedCardAuthMethods
          ? _value.allowedCardAuthMethods
          : allowedCardAuthMethods // ignore: cast_nullable_to_non_nullable
              as List<GooglePayCardAuthMethod>,
      merchantName: freezed == merchantName
          ? _value.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalConfig: freezed == additionalConfig
          ? _value.additionalConfig
          : additionalConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GooglePayConfigImplCopyWith<$Res>
    implements $GooglePayConfigCopyWith<$Res> {
  factory _$$GooglePayConfigImplCopyWith(_$GooglePayConfigImpl value,
          $Res Function(_$GooglePayConfigImpl) then) =
      __$$GooglePayConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String merchantId,
      GooglePayEnvironment environment,
      String countryCode,
      String currencyCode,
      List<GooglePayCardNetwork> allowedCardNetworks,
      List<GooglePayCardAuthMethod> allowedCardAuthMethods,
      String? merchantName,
      Map<String, dynamic>? additionalConfig});
}

/// @nodoc
class __$$GooglePayConfigImplCopyWithImpl<$Res>
    extends _$GooglePayConfigCopyWithImpl<$Res, _$GooglePayConfigImpl>
    implements _$$GooglePayConfigImplCopyWith<$Res> {
  __$$GooglePayConfigImplCopyWithImpl(
      _$GooglePayConfigImpl _value, $Res Function(_$GooglePayConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of GooglePayConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchantId = null,
    Object? environment = null,
    Object? countryCode = null,
    Object? currencyCode = null,
    Object? allowedCardNetworks = null,
    Object? allowedCardAuthMethods = null,
    Object? merchantName = freezed,
    Object? additionalConfig = freezed,
  }) {
    return _then(_$GooglePayConfigImpl(
      merchantId: null == merchantId
          ? _value.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String,
      environment: null == environment
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as GooglePayEnvironment,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      allowedCardNetworks: null == allowedCardNetworks
          ? _value._allowedCardNetworks
          : allowedCardNetworks // ignore: cast_nullable_to_non_nullable
              as List<GooglePayCardNetwork>,
      allowedCardAuthMethods: null == allowedCardAuthMethods
          ? _value._allowedCardAuthMethods
          : allowedCardAuthMethods // ignore: cast_nullable_to_non_nullable
              as List<GooglePayCardAuthMethod>,
      merchantName: freezed == merchantName
          ? _value.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalConfig: freezed == additionalConfig
          ? _value._additionalConfig
          : additionalConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GooglePayConfigImpl implements _GooglePayConfig {
  const _$GooglePayConfigImpl(
      {required this.merchantId,
      required this.environment,
      required this.countryCode,
      required this.currencyCode,
      final List<GooglePayCardNetwork> allowedCardNetworks = const [],
      final List<GooglePayCardAuthMethod> allowedCardAuthMethods = const [],
      this.merchantName,
      final Map<String, dynamic>? additionalConfig})
      : _allowedCardNetworks = allowedCardNetworks,
        _allowedCardAuthMethods = allowedCardAuthMethods,
        _additionalConfig = additionalConfig;

  factory _$GooglePayConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$GooglePayConfigImplFromJson(json);

  @override
  final String merchantId;
  @override
  final GooglePayEnvironment environment;
  @override
  final String countryCode;
  @override
  final String currencyCode;
  final List<GooglePayCardNetwork> _allowedCardNetworks;
  @override
  @JsonKey()
  List<GooglePayCardNetwork> get allowedCardNetworks {
    if (_allowedCardNetworks is EqualUnmodifiableListView)
      return _allowedCardNetworks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedCardNetworks);
  }

  final List<GooglePayCardAuthMethod> _allowedCardAuthMethods;
  @override
  @JsonKey()
  List<GooglePayCardAuthMethod> get allowedCardAuthMethods {
    if (_allowedCardAuthMethods is EqualUnmodifiableListView)
      return _allowedCardAuthMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedCardAuthMethods);
  }

  @override
  final String? merchantName;
  final Map<String, dynamic>? _additionalConfig;
  @override
  Map<String, dynamic>? get additionalConfig {
    final value = _additionalConfig;
    if (value == null) return null;
    if (_additionalConfig is EqualUnmodifiableMapView) return _additionalConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GooglePayConfig(merchantId: $merchantId, environment: $environment, countryCode: $countryCode, currencyCode: $currencyCode, allowedCardNetworks: $allowedCardNetworks, allowedCardAuthMethods: $allowedCardAuthMethods, merchantName: $merchantName, additionalConfig: $additionalConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GooglePayConfigImpl &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.environment, environment) ||
                other.environment == environment) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            const DeepCollectionEquality()
                .equals(other._allowedCardNetworks, _allowedCardNetworks) &&
            const DeepCollectionEquality().equals(
                other._allowedCardAuthMethods, _allowedCardAuthMethods) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            const DeepCollectionEquality()
                .equals(other._additionalConfig, _additionalConfig));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      merchantId,
      environment,
      countryCode,
      currencyCode,
      const DeepCollectionEquality().hash(_allowedCardNetworks),
      const DeepCollectionEquality().hash(_allowedCardAuthMethods),
      merchantName,
      const DeepCollectionEquality().hash(_additionalConfig));

  /// Create a copy of GooglePayConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GooglePayConfigImplCopyWith<_$GooglePayConfigImpl> get copyWith =>
      __$$GooglePayConfigImplCopyWithImpl<_$GooglePayConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GooglePayConfigImplToJson(
      this,
    );
  }
}

abstract class _GooglePayConfig implements GooglePayConfig {
  const factory _GooglePayConfig(
      {required final String merchantId,
      required final GooglePayEnvironment environment,
      required final String countryCode,
      required final String currencyCode,
      final List<GooglePayCardNetwork> allowedCardNetworks,
      final List<GooglePayCardAuthMethod> allowedCardAuthMethods,
      final String? merchantName,
      final Map<String, dynamic>? additionalConfig}) = _$GooglePayConfigImpl;

  factory _GooglePayConfig.fromJson(Map<String, dynamic> json) =
      _$GooglePayConfigImpl.fromJson;

  @override
  String get merchantId;
  @override
  GooglePayEnvironment get environment;
  @override
  String get countryCode;
  @override
  String get currencyCode;
  @override
  List<GooglePayCardNetwork> get allowedCardNetworks;
  @override
  List<GooglePayCardAuthMethod> get allowedCardAuthMethods;
  @override
  String? get merchantName;
  @override
  Map<String, dynamic>? get additionalConfig;

  /// Create a copy of GooglePayConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GooglePayConfigImplCopyWith<_$GooglePayConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MobilePaymentResult _$MobilePaymentResultFromJson(Map<String, dynamic> json) {
  return _MobilePaymentResult.fromJson(json);
}

/// @nodoc
mixin _$MobilePaymentResult {
  String get paymentMethodId => throw _privateConstructorUsedError;
  PaymentMethodType get type => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  Map<String, dynamic>? get billingContact =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get shippingContact =>
      throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;

  /// Serializes this MobilePaymentResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MobilePaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MobilePaymentResultCopyWith<MobilePaymentResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobilePaymentResultCopyWith<$Res> {
  factory $MobilePaymentResultCopyWith(
          MobilePaymentResult value, $Res Function(MobilePaymentResult) then) =
      _$MobilePaymentResultCopyWithImpl<$Res, MobilePaymentResult>;
  @useResult
  $Res call(
      {String paymentMethodId,
      PaymentMethodType type,
      String token,
      Map<String, dynamic>? billingContact,
      Map<String, dynamic>? shippingContact,
      String? transactionId,
      Map<String, dynamic>? additionalData});
}

/// @nodoc
class _$MobilePaymentResultCopyWithImpl<$Res, $Val extends MobilePaymentResult>
    implements $MobilePaymentResultCopyWith<$Res> {
  _$MobilePaymentResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MobilePaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethodId = null,
    Object? type = null,
    Object? token = null,
    Object? billingContact = freezed,
    Object? shippingContact = freezed,
    Object? transactionId = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_value.copyWith(
      paymentMethodId: null == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentMethodType,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      billingContact: freezed == billingContact
          ? _value.billingContact
          : billingContact // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      shippingContact: freezed == shippingContact
          ? _value.shippingContact
          : shippingContact // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MobilePaymentResultImplCopyWith<$Res>
    implements $MobilePaymentResultCopyWith<$Res> {
  factory _$$MobilePaymentResultImplCopyWith(_$MobilePaymentResultImpl value,
          $Res Function(_$MobilePaymentResultImpl) then) =
      __$$MobilePaymentResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String paymentMethodId,
      PaymentMethodType type,
      String token,
      Map<String, dynamic>? billingContact,
      Map<String, dynamic>? shippingContact,
      String? transactionId,
      Map<String, dynamic>? additionalData});
}

/// @nodoc
class __$$MobilePaymentResultImplCopyWithImpl<$Res>
    extends _$MobilePaymentResultCopyWithImpl<$Res, _$MobilePaymentResultImpl>
    implements _$$MobilePaymentResultImplCopyWith<$Res> {
  __$$MobilePaymentResultImplCopyWithImpl(_$MobilePaymentResultImpl _value,
      $Res Function(_$MobilePaymentResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of MobilePaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethodId = null,
    Object? type = null,
    Object? token = null,
    Object? billingContact = freezed,
    Object? shippingContact = freezed,
    Object? transactionId = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_$MobilePaymentResultImpl(
      paymentMethodId: null == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentMethodType,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      billingContact: freezed == billingContact
          ? _value._billingContact
          : billingContact // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      shippingContact: freezed == shippingContact
          ? _value._shippingContact
          : shippingContact // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value._additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MobilePaymentResultImpl extends _MobilePaymentResult {
  const _$MobilePaymentResultImpl(
      {required this.paymentMethodId,
      required this.type,
      required this.token,
      final Map<String, dynamic>? billingContact,
      final Map<String, dynamic>? shippingContact,
      this.transactionId,
      final Map<String, dynamic>? additionalData})
      : _billingContact = billingContact,
        _shippingContact = shippingContact,
        _additionalData = additionalData,
        super._();

  factory _$MobilePaymentResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$MobilePaymentResultImplFromJson(json);

  @override
  final String paymentMethodId;
  @override
  final PaymentMethodType type;
  @override
  final String token;
  final Map<String, dynamic>? _billingContact;
  @override
  Map<String, dynamic>? get billingContact {
    final value = _billingContact;
    if (value == null) return null;
    if (_billingContact is EqualUnmodifiableMapView) return _billingContact;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _shippingContact;
  @override
  Map<String, dynamic>? get shippingContact {
    final value = _shippingContact;
    if (value == null) return null;
    if (_shippingContact is EqualUnmodifiableMapView) return _shippingContact;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? transactionId;
  final Map<String, dynamic>? _additionalData;
  @override
  Map<String, dynamic>? get additionalData {
    final value = _additionalData;
    if (value == null) return null;
    if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'MobilePaymentResult(paymentMethodId: $paymentMethodId, type: $type, token: $token, billingContact: $billingContact, shippingContact: $shippingContact, transactionId: $transactionId, additionalData: $additionalData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MobilePaymentResultImpl &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.token, token) || other.token == token) &&
            const DeepCollectionEquality()
                .equals(other._billingContact, _billingContact) &&
            const DeepCollectionEquality()
                .equals(other._shippingContact, _shippingContact) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            const DeepCollectionEquality()
                .equals(other._additionalData, _additionalData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentMethodId,
      type,
      token,
      const DeepCollectionEquality().hash(_billingContact),
      const DeepCollectionEquality().hash(_shippingContact),
      transactionId,
      const DeepCollectionEquality().hash(_additionalData));

  /// Create a copy of MobilePaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MobilePaymentResultImplCopyWith<_$MobilePaymentResultImpl> get copyWith =>
      __$$MobilePaymentResultImplCopyWithImpl<_$MobilePaymentResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MobilePaymentResultImplToJson(
      this,
    );
  }
}

abstract class _MobilePaymentResult extends MobilePaymentResult {
  const factory _MobilePaymentResult(
      {required final String paymentMethodId,
      required final PaymentMethodType type,
      required final String token,
      final Map<String, dynamic>? billingContact,
      final Map<String, dynamic>? shippingContact,
      final String? transactionId,
      final Map<String, dynamic>? additionalData}) = _$MobilePaymentResultImpl;
  const _MobilePaymentResult._() : super._();

  factory _MobilePaymentResult.fromJson(Map<String, dynamic> json) =
      _$MobilePaymentResultImpl.fromJson;

  @override
  String get paymentMethodId;
  @override
  PaymentMethodType get type;
  @override
  String get token;
  @override
  Map<String, dynamic>? get billingContact;
  @override
  Map<String, dynamic>? get shippingContact;
  @override
  String? get transactionId;
  @override
  Map<String, dynamic>? get additionalData;

  /// Create a copy of MobilePaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MobilePaymentResultImplCopyWith<_$MobilePaymentResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MobilePaymentError _$MobilePaymentErrorFromJson(Map<String, dynamic> json) {
  return _MobilePaymentError.fromJson(json);
}

/// @nodoc
mixin _$MobilePaymentError {
  MobilePaymentErrorType get type => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  Map<String, dynamic>? get details => throw _privateConstructorUsedError;

  /// Serializes this MobilePaymentError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MobilePaymentError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MobilePaymentErrorCopyWith<MobilePaymentError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobilePaymentErrorCopyWith<$Res> {
  factory $MobilePaymentErrorCopyWith(
          MobilePaymentError value, $Res Function(MobilePaymentError) then) =
      _$MobilePaymentErrorCopyWithImpl<$Res, MobilePaymentError>;
  @useResult
  $Res call(
      {MobilePaymentErrorType type,
      String message,
      String? code,
      Map<String, dynamic>? details});
}

/// @nodoc
class _$MobilePaymentErrorCopyWithImpl<$Res, $Val extends MobilePaymentError>
    implements $MobilePaymentErrorCopyWith<$Res> {
  _$MobilePaymentErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MobilePaymentError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
    Object? code = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MobilePaymentErrorType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MobilePaymentErrorImplCopyWith<$Res>
    implements $MobilePaymentErrorCopyWith<$Res> {
  factory _$$MobilePaymentErrorImplCopyWith(_$MobilePaymentErrorImpl value,
          $Res Function(_$MobilePaymentErrorImpl) then) =
      __$$MobilePaymentErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MobilePaymentErrorType type,
      String message,
      String? code,
      Map<String, dynamic>? details});
}

/// @nodoc
class __$$MobilePaymentErrorImplCopyWithImpl<$Res>
    extends _$MobilePaymentErrorCopyWithImpl<$Res, _$MobilePaymentErrorImpl>
    implements _$$MobilePaymentErrorImplCopyWith<$Res> {
  __$$MobilePaymentErrorImplCopyWithImpl(_$MobilePaymentErrorImpl _value,
      $Res Function(_$MobilePaymentErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MobilePaymentError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
    Object? code = freezed,
    Object? details = freezed,
  }) {
    return _then(_$MobilePaymentErrorImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MobilePaymentErrorType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MobilePaymentErrorImpl implements _MobilePaymentError {
  const _$MobilePaymentErrorImpl(
      {required this.type,
      required this.message,
      this.code,
      final Map<String, dynamic>? details})
      : _details = details;

  factory _$MobilePaymentErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$MobilePaymentErrorImplFromJson(json);

  @override
  final MobilePaymentErrorType type;
  @override
  final String message;
  @override
  final String? code;
  final Map<String, dynamic>? _details;
  @override
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'MobilePaymentError(type: $type, message: $message, code: $code, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MobilePaymentErrorImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, message, code,
      const DeepCollectionEquality().hash(_details));

  /// Create a copy of MobilePaymentError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MobilePaymentErrorImplCopyWith<_$MobilePaymentErrorImpl> get copyWith =>
      __$$MobilePaymentErrorImplCopyWithImpl<_$MobilePaymentErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MobilePaymentErrorImplToJson(
      this,
    );
  }
}

abstract class _MobilePaymentError implements MobilePaymentError {
  const factory _MobilePaymentError(
      {required final MobilePaymentErrorType type,
      required final String message,
      final String? code,
      final Map<String, dynamic>? details}) = _$MobilePaymentErrorImpl;

  factory _MobilePaymentError.fromJson(Map<String, dynamic> json) =
      _$MobilePaymentErrorImpl.fromJson;

  @override
  MobilePaymentErrorType get type;
  @override
  String get message;
  @override
  String? get code;
  @override
  Map<String, dynamic>? get details;

  /// Create a copy of MobilePaymentError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MobilePaymentErrorImplCopyWith<_$MobilePaymentErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentItem _$PaymentItemFromJson(Map<String, dynamic> json) {
  return _PaymentItem.fromJson(json);
}

/// @nodoc
mixin _$PaymentItem {
  String get label => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  PaymentItemType get type => throw _privateConstructorUsedError;

  /// Serializes this PaymentItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentItemCopyWith<PaymentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentItemCopyWith<$Res> {
  factory $PaymentItemCopyWith(
          PaymentItem value, $Res Function(PaymentItem) then) =
      _$PaymentItemCopyWithImpl<$Res, PaymentItem>;
  @useResult
  $Res call({String label, String amount, PaymentItemType type});
}

/// @nodoc
class _$PaymentItemCopyWithImpl<$Res, $Val extends PaymentItem>
    implements $PaymentItemCopyWith<$Res> {
  _$PaymentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? amount = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentItemType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentItemImplCopyWith<$Res>
    implements $PaymentItemCopyWith<$Res> {
  factory _$$PaymentItemImplCopyWith(
          _$PaymentItemImpl value, $Res Function(_$PaymentItemImpl) then) =
      __$$PaymentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String amount, PaymentItemType type});
}

/// @nodoc
class __$$PaymentItemImplCopyWithImpl<$Res>
    extends _$PaymentItemCopyWithImpl<$Res, _$PaymentItemImpl>
    implements _$$PaymentItemImplCopyWith<$Res> {
  __$$PaymentItemImplCopyWithImpl(
      _$PaymentItemImpl _value, $Res Function(_$PaymentItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? amount = null,
    Object? type = null,
  }) {
    return _then(_$PaymentItemImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentItemType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentItemImpl implements _PaymentItem {
  const _$PaymentItemImpl(
      {required this.label,
      required this.amount,
      this.type = PaymentItemType.finalItem});

  factory _$PaymentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentItemImplFromJson(json);

  @override
  final String label;
  @override
  final String amount;
  @override
  @JsonKey()
  final PaymentItemType type;

  @override
  String toString() {
    return 'PaymentItem(label: $label, amount: $amount, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentItemImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, amount, type);

  /// Create a copy of PaymentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentItemImplCopyWith<_$PaymentItemImpl> get copyWith =>
      __$$PaymentItemImplCopyWithImpl<_$PaymentItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentItemImplToJson(
      this,
    );
  }
}

abstract class _PaymentItem implements PaymentItem {
  const factory _PaymentItem(
      {required final String label,
      required final String amount,
      final PaymentItemType type}) = _$PaymentItemImpl;

  factory _PaymentItem.fromJson(Map<String, dynamic> json) =
      _$PaymentItemImpl.fromJson;

  @override
  String get label;
  @override
  String get amount;
  @override
  PaymentItemType get type;

  /// Create a copy of PaymentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentItemImplCopyWith<_$PaymentItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
