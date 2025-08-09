// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return _PaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethod {
  String get id => throw _privateConstructorUsedError;
  PaymentMethodType get type => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  CardDetails? get card => throw _privateConstructorUsedError;
  WalletDetails? get wallet => throw _privateConstructorUsedError;
  Map<String, String>? get metadata => throw _privateConstructorUsedError;
  DateTime? get created => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
          PaymentMethod value, $Res Function(PaymentMethod) then) =
      _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call(
      {String id,
      PaymentMethodType type,
      String customerId,
      CardDetails? card,
      WalletDetails? wallet,
      Map<String, String>? metadata,
      DateTime? created,
      bool isDefault});

  $CardDetailsCopyWith<$Res>? get card;
  $WalletDetailsCopyWith<$Res>? get wallet;
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? customerId = null,
    Object? card = freezed,
    Object? wallet = freezed,
    Object? metadata = freezed,
    Object? created = freezed,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentMethodType,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      card: freezed == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardDetails?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletDetails?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardDetailsCopyWith<$Res>? get card {
    if (_value.card == null) {
      return null;
    }

    return $CardDetailsCopyWith<$Res>(_value.card!, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletDetailsCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $WalletDetailsCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentMethodImplCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$PaymentMethodImplCopyWith(
          _$PaymentMethodImpl value, $Res Function(_$PaymentMethodImpl) then) =
      __$$PaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      PaymentMethodType type,
      String customerId,
      CardDetails? card,
      WalletDetails? wallet,
      Map<String, String>? metadata,
      DateTime? created,
      bool isDefault});

  @override
  $CardDetailsCopyWith<$Res>? get card;
  @override
  $WalletDetailsCopyWith<$Res>? get wallet;
}

/// @nodoc
class __$$PaymentMethodImplCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$PaymentMethodImpl>
    implements _$$PaymentMethodImplCopyWith<$Res> {
  __$$PaymentMethodImplCopyWithImpl(
      _$PaymentMethodImpl _value, $Res Function(_$PaymentMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? customerId = null,
    Object? card = freezed,
    Object? wallet = freezed,
    Object? metadata = freezed,
    Object? created = freezed,
    Object? isDefault = null,
  }) {
    return _then(_$PaymentMethodImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentMethodType,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      card: freezed == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardDetails?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletDetails?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodImpl extends _PaymentMethod {
  const _$PaymentMethodImpl(
      {required this.id,
      required this.type,
      this.customerId = '',
      this.card,
      this.wallet,
      final Map<String, String>? metadata,
      this.created,
      this.isDefault = false})
      : _metadata = metadata,
        super._();

  factory _$PaymentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodImplFromJson(json);

  @override
  final String id;
  @override
  final PaymentMethodType type;
  @override
  @JsonKey()
  final String customerId;
  @override
  final CardDetails? card;
  @override
  final WalletDetails? wallet;
  final Map<String, String>? _metadata;
  @override
  Map<String, String>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? created;
  @override
  @JsonKey()
  final bool isDefault;

  @override
  String toString() {
    return 'PaymentMethod(id: $id, type: $type, customerId: $customerId, card: $card, wallet: $wallet, metadata: $metadata, created: $created, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      customerId,
      card,
      wallet,
      const DeepCollectionEquality().hash(_metadata),
      created,
      isDefault);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      __$$PaymentMethodImplCopyWithImpl<_$PaymentMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethod extends PaymentMethod {
  const factory _PaymentMethod(
      {required final String id,
      required final PaymentMethodType type,
      final String customerId,
      final CardDetails? card,
      final WalletDetails? wallet,
      final Map<String, String>? metadata,
      final DateTime? created,
      final bool isDefault}) = _$PaymentMethodImpl;
  const _PaymentMethod._() : super._();

  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodImpl.fromJson;

  @override
  String get id;
  @override
  PaymentMethodType get type;
  @override
  String get customerId;
  @override
  CardDetails? get card;
  @override
  WalletDetails? get wallet;
  @override
  Map<String, String>? get metadata;
  @override
  DateTime? get created;
  @override
  bool get isDefault;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CardDetails _$CardDetailsFromJson(Map<String, dynamic> json) {
  return _CardDetails.fromJson(json);
}

/// @nodoc
mixin _$CardDetails {
  String get last4 => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  int get expMonth => throw _privateConstructorUsedError;
  int get expYear => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get funding => throw _privateConstructorUsedError;

  /// Serializes this CardDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardDetailsCopyWith<CardDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardDetailsCopyWith<$Res> {
  factory $CardDetailsCopyWith(
          CardDetails value, $Res Function(CardDetails) then) =
      _$CardDetailsCopyWithImpl<$Res, CardDetails>;
  @useResult
  $Res call(
      {String last4,
      String brand,
      int expMonth,
      int expYear,
      String? country,
      String? funding});
}

/// @nodoc
class _$CardDetailsCopyWithImpl<$Res, $Val extends CardDetails>
    implements $CardDetailsCopyWith<$Res> {
  _$CardDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? last4 = null,
    Object? brand = null,
    Object? expMonth = null,
    Object? expYear = null,
    Object? country = freezed,
    Object? funding = freezed,
  }) {
    return _then(_value.copyWith(
      last4: null == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      expMonth: null == expMonth
          ? _value.expMonth
          : expMonth // ignore: cast_nullable_to_non_nullable
              as int,
      expYear: null == expYear
          ? _value.expYear
          : expYear // ignore: cast_nullable_to_non_nullable
              as int,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      funding: freezed == funding
          ? _value.funding
          : funding // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardDetailsImplCopyWith<$Res>
    implements $CardDetailsCopyWith<$Res> {
  factory _$$CardDetailsImplCopyWith(
          _$CardDetailsImpl value, $Res Function(_$CardDetailsImpl) then) =
      __$$CardDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String last4,
      String brand,
      int expMonth,
      int expYear,
      String? country,
      String? funding});
}

/// @nodoc
class __$$CardDetailsImplCopyWithImpl<$Res>
    extends _$CardDetailsCopyWithImpl<$Res, _$CardDetailsImpl>
    implements _$$CardDetailsImplCopyWith<$Res> {
  __$$CardDetailsImplCopyWithImpl(
      _$CardDetailsImpl _value, $Res Function(_$CardDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? last4 = null,
    Object? brand = null,
    Object? expMonth = null,
    Object? expYear = null,
    Object? country = freezed,
    Object? funding = freezed,
  }) {
    return _then(_$CardDetailsImpl(
      last4: null == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      expMonth: null == expMonth
          ? _value.expMonth
          : expMonth // ignore: cast_nullable_to_non_nullable
              as int,
      expYear: null == expYear
          ? _value.expYear
          : expYear // ignore: cast_nullable_to_non_nullable
              as int,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      funding: freezed == funding
          ? _value.funding
          : funding // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardDetailsImpl extends _CardDetails {
  const _$CardDetailsImpl(
      {required this.last4,
      required this.brand,
      required this.expMonth,
      required this.expYear,
      this.country,
      this.funding})
      : super._();

  factory _$CardDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardDetailsImplFromJson(json);

  @override
  final String last4;
  @override
  final String brand;
  @override
  final int expMonth;
  @override
  final int expYear;
  @override
  final String? country;
  @override
  final String? funding;

  @override
  String toString() {
    return 'CardDetails(last4: $last4, brand: $brand, expMonth: $expMonth, expYear: $expYear, country: $country, funding: $funding)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardDetailsImpl &&
            (identical(other.last4, last4) || other.last4 == last4) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.expMonth, expMonth) ||
                other.expMonth == expMonth) &&
            (identical(other.expYear, expYear) || other.expYear == expYear) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.funding, funding) || other.funding == funding));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, last4, brand, expMonth, expYear, country, funding);

  /// Create a copy of CardDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardDetailsImplCopyWith<_$CardDetailsImpl> get copyWith =>
      __$$CardDetailsImplCopyWithImpl<_$CardDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardDetailsImplToJson(
      this,
    );
  }
}

abstract class _CardDetails extends CardDetails {
  const factory _CardDetails(
      {required final String last4,
      required final String brand,
      required final int expMonth,
      required final int expYear,
      final String? country,
      final String? funding}) = _$CardDetailsImpl;
  const _CardDetails._() : super._();

  factory _CardDetails.fromJson(Map<String, dynamic> json) =
      _$CardDetailsImpl.fromJson;

  @override
  String get last4;
  @override
  String get brand;
  @override
  int get expMonth;
  @override
  int get expYear;
  @override
  String? get country;
  @override
  String? get funding;

  /// Create a copy of CardDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardDetailsImplCopyWith<_$CardDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletDetails _$WalletDetailsFromJson(Map<String, dynamic> json) {
  return _WalletDetails.fromJson(json);
}

/// @nodoc
mixin _$WalletDetails {
  WalletType get type => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;

  /// Serializes this WalletDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletDetailsCopyWith<WalletDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletDetailsCopyWith<$Res> {
  factory $WalletDetailsCopyWith(
          WalletDetails value, $Res Function(WalletDetails) then) =
      _$WalletDetailsCopyWithImpl<$Res, WalletDetails>;
  @useResult
  $Res call(
      {WalletType type, String? email, Map<String, dynamic>? additionalData});
}

/// @nodoc
class _$WalletDetailsCopyWithImpl<$Res, $Val extends WalletDetails>
    implements $WalletDetailsCopyWith<$Res> {
  _$WalletDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? email = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WalletType,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletDetailsImplCopyWith<$Res>
    implements $WalletDetailsCopyWith<$Res> {
  factory _$$WalletDetailsImplCopyWith(
          _$WalletDetailsImpl value, $Res Function(_$WalletDetailsImpl) then) =
      __$$WalletDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WalletType type, String? email, Map<String, dynamic>? additionalData});
}

/// @nodoc
class __$$WalletDetailsImplCopyWithImpl<$Res>
    extends _$WalletDetailsCopyWithImpl<$Res, _$WalletDetailsImpl>
    implements _$$WalletDetailsImplCopyWith<$Res> {
  __$$WalletDetailsImplCopyWithImpl(
      _$WalletDetailsImpl _value, $Res Function(_$WalletDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? email = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_$WalletDetailsImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WalletType,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
class _$WalletDetailsImpl extends _WalletDetails {
  const _$WalletDetailsImpl(
      {required this.type,
      this.email,
      final Map<String, dynamic>? additionalData})
      : _additionalData = additionalData,
        super._();

  factory _$WalletDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletDetailsImplFromJson(json);

  @override
  final WalletType type;
  @override
  final String? email;
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
    return 'WalletDetails(type: $type, email: $email, additionalData: $additionalData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletDetailsImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._additionalData, _additionalData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, email,
      const DeepCollectionEquality().hash(_additionalData));

  /// Create a copy of WalletDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletDetailsImplCopyWith<_$WalletDetailsImpl> get copyWith =>
      __$$WalletDetailsImplCopyWithImpl<_$WalletDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletDetailsImplToJson(
      this,
    );
  }
}

abstract class _WalletDetails extends WalletDetails {
  const factory _WalletDetails(
      {required final WalletType type,
      final String? email,
      final Map<String, dynamic>? additionalData}) = _$WalletDetailsImpl;
  const _WalletDetails._() : super._();

  factory _WalletDetails.fromJson(Map<String, dynamic> json) =
      _$WalletDetailsImpl.fromJson;

  @override
  WalletType get type;
  @override
  String? get email;
  @override
  Map<String, dynamic>? get additionalData;

  /// Create a copy of WalletDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletDetailsImplCopyWith<_$WalletDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
