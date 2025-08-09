// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthenticationResult _$AuthenticationResultFromJson(Map<String, dynamic> json) {
  return _AuthenticationResult.fromJson(json);
}

/// @nodoc
mixin _$AuthenticationResult {
  User get user => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  UserProfile? get profile => throw _privateConstructorUsedError;
  AuthenticationStatus get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get requiresCustomerLinking => throw _privateConstructorUsedError;
  List<Customer>? get potentialMatches => throw _privateConstructorUsedError;

  /// Serializes this AuthenticationResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthenticationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthenticationResultCopyWith<AuthenticationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationResultCopyWith<$Res> {
  factory $AuthenticationResultCopyWith(AuthenticationResult value,
          $Res Function(AuthenticationResult) then) =
      _$AuthenticationResultCopyWithImpl<$Res, AuthenticationResult>;
  @useResult
  $Res call(
      {User user,
      Customer? customer,
      UserProfile? profile,
      AuthenticationStatus status,
      String? message,
      bool? requiresCustomerLinking,
      List<Customer>? potentialMatches});

  $UserCopyWith<$Res> get user;
  $CustomerCopyWith<$Res>? get customer;
  $UserProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$AuthenticationResultCopyWithImpl<$Res,
        $Val extends AuthenticationResult>
    implements $AuthenticationResultCopyWith<$Res> {
  _$AuthenticationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? customer = freezed,
    Object? profile = freezed,
    Object? status = null,
    Object? message = freezed,
    Object? requiresCustomerLinking = freezed,
    Object? potentialMatches = freezed,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresCustomerLinking: freezed == requiresCustomerLinking
          ? _value.requiresCustomerLinking
          : requiresCustomerLinking // ignore: cast_nullable_to_non_nullable
              as bool?,
      potentialMatches: freezed == potentialMatches
          ? _value.potentialMatches
          : potentialMatches // ignore: cast_nullable_to_non_nullable
              as List<Customer>?,
    ) as $Val);
  }

  /// Create a copy of AuthenticationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of AuthenticationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of AuthenticationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthenticationResultImplCopyWith<$Res>
    implements $AuthenticationResultCopyWith<$Res> {
  factory _$$AuthenticationResultImplCopyWith(_$AuthenticationResultImpl value,
          $Res Function(_$AuthenticationResultImpl) then) =
      __$$AuthenticationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      Customer? customer,
      UserProfile? profile,
      AuthenticationStatus status,
      String? message,
      bool? requiresCustomerLinking,
      List<Customer>? potentialMatches});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $UserProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$AuthenticationResultImplCopyWithImpl<$Res>
    extends _$AuthenticationResultCopyWithImpl<$Res, _$AuthenticationResultImpl>
    implements _$$AuthenticationResultImplCopyWith<$Res> {
  __$$AuthenticationResultImplCopyWithImpl(_$AuthenticationResultImpl _value,
      $Res Function(_$AuthenticationResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? customer = freezed,
    Object? profile = freezed,
    Object? status = null,
    Object? message = freezed,
    Object? requiresCustomerLinking = freezed,
    Object? potentialMatches = freezed,
  }) {
    return _then(_$AuthenticationResultImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresCustomerLinking: freezed == requiresCustomerLinking
          ? _value.requiresCustomerLinking
          : requiresCustomerLinking // ignore: cast_nullable_to_non_nullable
              as bool?,
      potentialMatches: freezed == potentialMatches
          ? _value._potentialMatches
          : potentialMatches // ignore: cast_nullable_to_non_nullable
              as List<Customer>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticationResultImpl implements _AuthenticationResult {
  const _$AuthenticationResultImpl(
      {required this.user,
      this.customer,
      this.profile,
      this.status = AuthenticationStatus.success,
      this.message,
      this.requiresCustomerLinking,
      final List<Customer>? potentialMatches})
      : _potentialMatches = potentialMatches;

  factory _$AuthenticationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenticationResultImplFromJson(json);

  @override
  final User user;
  @override
  final Customer? customer;
  @override
  final UserProfile? profile;
  @override
  @JsonKey()
  final AuthenticationStatus status;
  @override
  final String? message;
  @override
  final bool? requiresCustomerLinking;
  final List<Customer>? _potentialMatches;
  @override
  List<Customer>? get potentialMatches {
    final value = _potentialMatches;
    if (value == null) return null;
    if (_potentialMatches is EqualUnmodifiableListView)
      return _potentialMatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AuthenticationResult(user: $user, customer: $customer, profile: $profile, status: $status, message: $message, requiresCustomerLinking: $requiresCustomerLinking, potentialMatches: $potentialMatches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationResultImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(
                    other.requiresCustomerLinking, requiresCustomerLinking) ||
                other.requiresCustomerLinking == requiresCustomerLinking) &&
            const DeepCollectionEquality()
                .equals(other._potentialMatches, _potentialMatches));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      customer,
      profile,
      status,
      message,
      requiresCustomerLinking,
      const DeepCollectionEquality().hash(_potentialMatches));

  /// Create a copy of AuthenticationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationResultImplCopyWith<_$AuthenticationResultImpl>
      get copyWith =>
          __$$AuthenticationResultImplCopyWithImpl<_$AuthenticationResultImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationResultImplToJson(
      this,
    );
  }
}

abstract class _AuthenticationResult implements AuthenticationResult {
  const factory _AuthenticationResult(
      {required final User user,
      final Customer? customer,
      final UserProfile? profile,
      final AuthenticationStatus status,
      final String? message,
      final bool? requiresCustomerLinking,
      final List<Customer>? potentialMatches}) = _$AuthenticationResultImpl;

  factory _AuthenticationResult.fromJson(Map<String, dynamic> json) =
      _$AuthenticationResultImpl.fromJson;

  @override
  User get user;
  @override
  Customer? get customer;
  @override
  UserProfile? get profile;
  @override
  AuthenticationStatus get status;
  @override
  String? get message;
  @override
  bool? get requiresCustomerLinking;
  @override
  List<Customer>? get potentialMatches;

  /// Create a copy of AuthenticationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationResultImplCopyWith<_$AuthenticationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) {
  return _SignInRequest.fromJson(json);
}

/// @nodoc
mixin _$SignInRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this SignInRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInRequestCopyWith<SignInRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInRequestCopyWith<$Res> {
  factory $SignInRequestCopyWith(
          SignInRequest value, $Res Function(SignInRequest) then) =
      _$SignInRequestCopyWithImpl<$Res, SignInRequest>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInRequestCopyWithImpl<$Res, $Val extends SignInRequest>
    implements $SignInRequestCopyWith<$Res> {
  _$SignInRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInRequestImplCopyWith<$Res>
    implements $SignInRequestCopyWith<$Res> {
  factory _$$SignInRequestImplCopyWith(
          _$SignInRequestImpl value, $Res Function(_$SignInRequestImpl) then) =
      __$$SignInRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInRequestImplCopyWithImpl<$Res>
    extends _$SignInRequestCopyWithImpl<$Res, _$SignInRequestImpl>
    implements _$$SignInRequestImplCopyWith<$Res> {
  __$$SignInRequestImplCopyWithImpl(
      _$SignInRequestImpl _value, $Res Function(_$SignInRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignInRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInRequestImpl implements _SignInRequest {
  const _$SignInRequestImpl({required this.email, required this.password});

  factory _$SignInRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignInRequest(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of SignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInRequestImplCopyWith<_$SignInRequestImpl> get copyWith =>
      __$$SignInRequestImplCopyWithImpl<_$SignInRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInRequestImplToJson(
      this,
    );
  }
}

abstract class _SignInRequest implements SignInRequest {
  const factory _SignInRequest(
      {required final String email,
      required final String password}) = _$SignInRequestImpl;

  factory _SignInRequest.fromJson(Map<String, dynamic> json) =
      _$SignInRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of SignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInRequestImplCopyWith<_$SignInRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) {
  return _SignUpRequest.fromJson(json);
}

/// @nodoc
mixin _$SignUpRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  /// Serializes this SignUpRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignUpRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpRequestCopyWith<SignUpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpRequestCopyWith<$Res> {
  factory $SignUpRequestCopyWith(
          SignUpRequest value, $Res Function(SignUpRequest) then) =
      _$SignUpRequestCopyWithImpl<$Res, SignUpRequest>;
  @useResult
  $Res call(
      {String email,
      String password,
      String name,
      String phone,
      String? address});
}

/// @nodoc
class _$SignUpRequestCopyWithImpl<$Res, $Val extends SignUpRequest>
    implements $SignUpRequestCopyWith<$Res> {
  _$SignUpRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? name = null,
    Object? phone = null,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpRequestImplCopyWith<$Res>
    implements $SignUpRequestCopyWith<$Res> {
  factory _$$SignUpRequestImplCopyWith(
          _$SignUpRequestImpl value, $Res Function(_$SignUpRequestImpl) then) =
      __$$SignUpRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String name,
      String phone,
      String? address});
}

/// @nodoc
class __$$SignUpRequestImplCopyWithImpl<$Res>
    extends _$SignUpRequestCopyWithImpl<$Res, _$SignUpRequestImpl>
    implements _$$SignUpRequestImplCopyWith<$Res> {
  __$$SignUpRequestImplCopyWithImpl(
      _$SignUpRequestImpl _value, $Res Function(_$SignUpRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? name = null,
    Object? phone = null,
    Object? address = freezed,
  }) {
    return _then(_$SignUpRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpRequestImpl implements _SignUpRequest {
  const _$SignUpRequestImpl(
      {required this.email,
      required this.password,
      required this.name,
      required this.phone,
      this.address});

  factory _$SignUpRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String? address;

  @override
  String toString() {
    return 'SignUpRequest(email: $email, password: $password, name: $name, phone: $phone, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, name, phone, address);

  /// Create a copy of SignUpRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpRequestImplCopyWith<_$SignUpRequestImpl> get copyWith =>
      __$$SignUpRequestImplCopyWithImpl<_$SignUpRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpRequestImplToJson(
      this,
    );
  }
}

abstract class _SignUpRequest implements SignUpRequest {
  const factory _SignUpRequest(
      {required final String email,
      required final String password,
      required final String name,
      required final String phone,
      final String? address}) = _$SignUpRequestImpl;

  factory _SignUpRequest.fromJson(Map<String, dynamic> json) =
      _$SignUpRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get name;
  @override
  String get phone;
  @override
  String? get address;

  /// Create a copy of SignUpRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpRequestImplCopyWith<_$SignUpRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerLinkingRequest _$CustomerLinkingRequestFromJson(
    Map<String, dynamic> json) {
  return _CustomerLinkingRequest.fromJson(json);
}

/// @nodoc
mixin _$CustomerLinkingRequest {
  String get firebaseUid => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String? get additionalInfo => throw _privateConstructorUsedError;

  /// Serializes this CustomerLinkingRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerLinkingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerLinkingRequestCopyWith<CustomerLinkingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerLinkingRequestCopyWith<$Res> {
  factory $CustomerLinkingRequestCopyWith(CustomerLinkingRequest value,
          $Res Function(CustomerLinkingRequest) then) =
      _$CustomerLinkingRequestCopyWithImpl<$Res, CustomerLinkingRequest>;
  @useResult
  $Res call({String firebaseUid, String customerId, String? additionalInfo});
}

/// @nodoc
class _$CustomerLinkingRequestCopyWithImpl<$Res,
        $Val extends CustomerLinkingRequest>
    implements $CustomerLinkingRequestCopyWith<$Res> {
  _$CustomerLinkingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerLinkingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firebaseUid = null,
    Object? customerId = null,
    Object? additionalInfo = freezed,
  }) {
    return _then(_value.copyWith(
      firebaseUid: null == firebaseUid
          ? _value.firebaseUid
          : firebaseUid // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      additionalInfo: freezed == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerLinkingRequestImplCopyWith<$Res>
    implements $CustomerLinkingRequestCopyWith<$Res> {
  factory _$$CustomerLinkingRequestImplCopyWith(
          _$CustomerLinkingRequestImpl value,
          $Res Function(_$CustomerLinkingRequestImpl) then) =
      __$$CustomerLinkingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firebaseUid, String customerId, String? additionalInfo});
}

/// @nodoc
class __$$CustomerLinkingRequestImplCopyWithImpl<$Res>
    extends _$CustomerLinkingRequestCopyWithImpl<$Res,
        _$CustomerLinkingRequestImpl>
    implements _$$CustomerLinkingRequestImplCopyWith<$Res> {
  __$$CustomerLinkingRequestImplCopyWithImpl(
      _$CustomerLinkingRequestImpl _value,
      $Res Function(_$CustomerLinkingRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerLinkingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firebaseUid = null,
    Object? customerId = null,
    Object? additionalInfo = freezed,
  }) {
    return _then(_$CustomerLinkingRequestImpl(
      firebaseUid: null == firebaseUid
          ? _value.firebaseUid
          : firebaseUid // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      additionalInfo: freezed == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerLinkingRequestImpl implements _CustomerLinkingRequest {
  const _$CustomerLinkingRequestImpl(
      {required this.firebaseUid,
      required this.customerId,
      this.additionalInfo});

  factory _$CustomerLinkingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerLinkingRequestImplFromJson(json);

  @override
  final String firebaseUid;
  @override
  final String customerId;
  @override
  final String? additionalInfo;

  @override
  String toString() {
    return 'CustomerLinkingRequest(firebaseUid: $firebaseUid, customerId: $customerId, additionalInfo: $additionalInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerLinkingRequestImpl &&
            (identical(other.firebaseUid, firebaseUid) ||
                other.firebaseUid == firebaseUid) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.additionalInfo, additionalInfo) ||
                other.additionalInfo == additionalInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firebaseUid, customerId, additionalInfo);

  /// Create a copy of CustomerLinkingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerLinkingRequestImplCopyWith<_$CustomerLinkingRequestImpl>
      get copyWith => __$$CustomerLinkingRequestImplCopyWithImpl<
          _$CustomerLinkingRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerLinkingRequestImplToJson(
      this,
    );
  }
}

abstract class _CustomerLinkingRequest implements CustomerLinkingRequest {
  const factory _CustomerLinkingRequest(
      {required final String firebaseUid,
      required final String customerId,
      final String? additionalInfo}) = _$CustomerLinkingRequestImpl;

  factory _CustomerLinkingRequest.fromJson(Map<String, dynamic> json) =
      _$CustomerLinkingRequestImpl.fromJson;

  @override
  String get firebaseUid;
  @override
  String get customerId;
  @override
  String? get additionalInfo;

  /// Create a copy of CustomerLinkingRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerLinkingRequestImplCopyWith<_$CustomerLinkingRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
