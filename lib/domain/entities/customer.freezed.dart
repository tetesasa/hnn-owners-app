// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get firebaseUid => throw _privateConstructorUsedError;
  String? get appUserId => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  CustomerAppPreferences? get appPreferences =>
      throw _privateConstructorUsedError;
  CustomerAppMetadata? get appMetadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String phone,
      String address,
      String? firebaseUid,
      String? appUserId,
      String? profileImageUrl,
      CustomerAppPreferences? appPreferences,
      CustomerAppMetadata? appMetadata,
      DateTime? createdAt,
      DateTime? updatedAt});

  $CustomerAppPreferencesCopyWith<$Res>? get appPreferences;
  $CustomerAppMetadataCopyWith<$Res>? get appMetadata;
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? firebaseUid = freezed,
    Object? appUserId = freezed,
    Object? profileImageUrl = freezed,
    Object? appPreferences = freezed,
    Object? appMetadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseUid: freezed == firebaseUid
          ? _value.firebaseUid
          : firebaseUid // ignore: cast_nullable_to_non_nullable
              as String?,
      appUserId: freezed == appUserId
          ? _value.appUserId
          : appUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      appPreferences: freezed == appPreferences
          ? _value.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as CustomerAppPreferences?,
      appMetadata: freezed == appMetadata
          ? _value.appMetadata
          : appMetadata // ignore: cast_nullable_to_non_nullable
              as CustomerAppMetadata?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerAppPreferencesCopyWith<$Res>? get appPreferences {
    if (_value.appPreferences == null) {
      return null;
    }

    return $CustomerAppPreferencesCopyWith<$Res>(_value.appPreferences!,
        (value) {
      return _then(_value.copyWith(appPreferences: value) as $Val);
    });
  }

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerAppMetadataCopyWith<$Res>? get appMetadata {
    if (_value.appMetadata == null) {
      return null;
    }

    return $CustomerAppMetadataCopyWith<$Res>(_value.appMetadata!, (value) {
      return _then(_value.copyWith(appMetadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerImplCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
          _$CustomerImpl value, $Res Function(_$CustomerImpl) then) =
      __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String phone,
      String address,
      String? firebaseUid,
      String? appUserId,
      String? profileImageUrl,
      CustomerAppPreferences? appPreferences,
      CustomerAppMetadata? appMetadata,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $CustomerAppPreferencesCopyWith<$Res>? get appPreferences;
  @override
  $CustomerAppMetadataCopyWith<$Res>? get appMetadata;
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
      _$CustomerImpl _value, $Res Function(_$CustomerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? firebaseUid = freezed,
    Object? appUserId = freezed,
    Object? profileImageUrl = freezed,
    Object? appPreferences = freezed,
    Object? appMetadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CustomerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseUid: freezed == firebaseUid
          ? _value.firebaseUid
          : firebaseUid // ignore: cast_nullable_to_non_nullable
              as String?,
      appUserId: freezed == appUserId
          ? _value.appUserId
          : appUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      appPreferences: freezed == appPreferences
          ? _value.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as CustomerAppPreferences?,
      appMetadata: freezed == appMetadata
          ? _value.appMetadata
          : appMetadata // ignore: cast_nullable_to_non_nullable
              as CustomerAppMetadata?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerImpl extends _Customer {
  const _$CustomerImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      this.firebaseUid,
      this.appUserId,
      this.profileImageUrl,
      this.appPreferences,
      this.appMetadata,
      this.createdAt,
      this.updatedAt})
      : super._();

  factory _$CustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String address;
  @override
  final String? firebaseUid;
  @override
  final String? appUserId;
  @override
  final String? profileImageUrl;
  @override
  final CustomerAppPreferences? appPreferences;
  @override
  final CustomerAppMetadata? appMetadata;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Customer(id: $id, name: $name, email: $email, phone: $phone, address: $address, firebaseUid: $firebaseUid, appUserId: $appUserId, profileImageUrl: $profileImageUrl, appPreferences: $appPreferences, appMetadata: $appMetadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.firebaseUid, firebaseUid) ||
                other.firebaseUid == firebaseUid) &&
            (identical(other.appUserId, appUserId) ||
                other.appUserId == appUserId) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences) &&
            (identical(other.appMetadata, appMetadata) ||
                other.appMetadata == appMetadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      phone,
      address,
      firebaseUid,
      appUserId,
      profileImageUrl,
      appPreferences,
      appMetadata,
      createdAt,
      updatedAt);

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerImplToJson(
      this,
    );
  }
}

abstract class _Customer extends Customer {
  const factory _Customer(
      {required final String id,
      required final String name,
      required final String email,
      required final String phone,
      required final String address,
      final String? firebaseUid,
      final String? appUserId,
      final String? profileImageUrl,
      final CustomerAppPreferences? appPreferences,
      final CustomerAppMetadata? appMetadata,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CustomerImpl;
  const _Customer._() : super._();

  factory _Customer.fromJson(Map<String, dynamic> json) =
      _$CustomerImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get address;
  @override
  String? get firebaseUid;
  @override
  String? get appUserId;
  @override
  String? get profileImageUrl;
  @override
  CustomerAppPreferences? get appPreferences;
  @override
  CustomerAppMetadata? get appMetadata;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerAppPreferences _$CustomerAppPreferencesFromJson(
    Map<String, dynamic> json) {
  return _CustomerAppPreferences.fromJson(json);
}

/// @nodoc
mixin _$CustomerAppPreferences {
  NotificationSettings? get notificationSettings =>
      throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;

  /// Serializes this CustomerAppPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerAppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerAppPreferencesCopyWith<CustomerAppPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerAppPreferencesCopyWith<$Res> {
  factory $CustomerAppPreferencesCopyWith(CustomerAppPreferences value,
          $Res Function(CustomerAppPreferences) then) =
      _$CustomerAppPreferencesCopyWithImpl<$Res, CustomerAppPreferences>;
  @useResult
  $Res call(
      {NotificationSettings? notificationSettings,
      String language,
      String theme});

  $NotificationSettingsCopyWith<$Res>? get notificationSettings;
}

/// @nodoc
class _$CustomerAppPreferencesCopyWithImpl<$Res,
        $Val extends CustomerAppPreferences>
    implements $CustomerAppPreferencesCopyWith<$Res> {
  _$CustomerAppPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerAppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationSettings = freezed,
    Object? language = null,
    Object? theme = null,
  }) {
    return _then(_value.copyWith(
      notificationSettings: freezed == notificationSettings
          ? _value.notificationSettings
          : notificationSettings // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of CustomerAppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res>? get notificationSettings {
    if (_value.notificationSettings == null) {
      return null;
    }

    return $NotificationSettingsCopyWith<$Res>(_value.notificationSettings!,
        (value) {
      return _then(_value.copyWith(notificationSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerAppPreferencesImplCopyWith<$Res>
    implements $CustomerAppPreferencesCopyWith<$Res> {
  factory _$$CustomerAppPreferencesImplCopyWith(
          _$CustomerAppPreferencesImpl value,
          $Res Function(_$CustomerAppPreferencesImpl) then) =
      __$$CustomerAppPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NotificationSettings? notificationSettings,
      String language,
      String theme});

  @override
  $NotificationSettingsCopyWith<$Res>? get notificationSettings;
}

/// @nodoc
class __$$CustomerAppPreferencesImplCopyWithImpl<$Res>
    extends _$CustomerAppPreferencesCopyWithImpl<$Res,
        _$CustomerAppPreferencesImpl>
    implements _$$CustomerAppPreferencesImplCopyWith<$Res> {
  __$$CustomerAppPreferencesImplCopyWithImpl(
      _$CustomerAppPreferencesImpl _value,
      $Res Function(_$CustomerAppPreferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerAppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationSettings = freezed,
    Object? language = null,
    Object? theme = null,
  }) {
    return _then(_$CustomerAppPreferencesImpl(
      notificationSettings: freezed == notificationSettings
          ? _value.notificationSettings
          : notificationSettings // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerAppPreferencesImpl implements _CustomerAppPreferences {
  const _$CustomerAppPreferencesImpl(
      {this.notificationSettings, this.language = 'ja', this.theme = 'system'});

  factory _$CustomerAppPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerAppPreferencesImplFromJson(json);

  @override
  final NotificationSettings? notificationSettings;
  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey()
  final String theme;

  @override
  String toString() {
    return 'CustomerAppPreferences(notificationSettings: $notificationSettings, language: $language, theme: $theme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerAppPreferencesImpl &&
            (identical(other.notificationSettings, notificationSettings) ||
                other.notificationSettings == notificationSettings) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, notificationSettings, language, theme);

  /// Create a copy of CustomerAppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerAppPreferencesImplCopyWith<_$CustomerAppPreferencesImpl>
      get copyWith => __$$CustomerAppPreferencesImplCopyWithImpl<
          _$CustomerAppPreferencesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerAppPreferencesImplToJson(
      this,
    );
  }
}

abstract class _CustomerAppPreferences implements CustomerAppPreferences {
  const factory _CustomerAppPreferences(
      {final NotificationSettings? notificationSettings,
      final String language,
      final String theme}) = _$CustomerAppPreferencesImpl;

  factory _CustomerAppPreferences.fromJson(Map<String, dynamic> json) =
      _$CustomerAppPreferencesImpl.fromJson;

  @override
  NotificationSettings? get notificationSettings;
  @override
  String get language;
  @override
  String get theme;

  /// Create a copy of CustomerAppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerAppPreferencesImplCopyWith<_$CustomerAppPreferencesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CustomerAppMetadata _$CustomerAppMetadataFromJson(Map<String, dynamic> json) {
  return _CustomerAppMetadata.fromJson(json);
}

/// @nodoc
mixin _$CustomerAppMetadata {
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;
  DeviceInfo? get deviceInfo => throw _privateConstructorUsedError;

  /// Serializes this CustomerAppMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerAppMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerAppMetadataCopyWith<CustomerAppMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerAppMetadataCopyWith<$Res> {
  factory $CustomerAppMetadataCopyWith(
          CustomerAppMetadata value, $Res Function(CustomerAppMetadata) then) =
      _$CustomerAppMetadataCopyWithImpl<$Res, CustomerAppMetadata>;
  @useResult
  $Res call(
      {DateTime? lastLoginAt, String? appVersion, DeviceInfo? deviceInfo});

  $DeviceInfoCopyWith<$Res>? get deviceInfo;
}

/// @nodoc
class _$CustomerAppMetadataCopyWithImpl<$Res, $Val extends CustomerAppMetadata>
    implements $CustomerAppMetadataCopyWith<$Res> {
  _$CustomerAppMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerAppMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastLoginAt = freezed,
    Object? appVersion = freezed,
    Object? deviceInfo = freezed,
  }) {
    return _then(_value.copyWith(
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo?,
    ) as $Val);
  }

  /// Create a copy of CustomerAppMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceInfoCopyWith<$Res>? get deviceInfo {
    if (_value.deviceInfo == null) {
      return null;
    }

    return $DeviceInfoCopyWith<$Res>(_value.deviceInfo!, (value) {
      return _then(_value.copyWith(deviceInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerAppMetadataImplCopyWith<$Res>
    implements $CustomerAppMetadataCopyWith<$Res> {
  factory _$$CustomerAppMetadataImplCopyWith(_$CustomerAppMetadataImpl value,
          $Res Function(_$CustomerAppMetadataImpl) then) =
      __$$CustomerAppMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? lastLoginAt, String? appVersion, DeviceInfo? deviceInfo});

  @override
  $DeviceInfoCopyWith<$Res>? get deviceInfo;
}

/// @nodoc
class __$$CustomerAppMetadataImplCopyWithImpl<$Res>
    extends _$CustomerAppMetadataCopyWithImpl<$Res, _$CustomerAppMetadataImpl>
    implements _$$CustomerAppMetadataImplCopyWith<$Res> {
  __$$CustomerAppMetadataImplCopyWithImpl(_$CustomerAppMetadataImpl _value,
      $Res Function(_$CustomerAppMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerAppMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastLoginAt = freezed,
    Object? appVersion = freezed,
    Object? deviceInfo = freezed,
  }) {
    return _then(_$CustomerAppMetadataImpl(
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerAppMetadataImpl implements _CustomerAppMetadata {
  const _$CustomerAppMetadataImpl(
      {this.lastLoginAt, this.appVersion, this.deviceInfo});

  factory _$CustomerAppMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerAppMetadataImplFromJson(json);

  @override
  final DateTime? lastLoginAt;
  @override
  final String? appVersion;
  @override
  final DeviceInfo? deviceInfo;

  @override
  String toString() {
    return 'CustomerAppMetadata(lastLoginAt: $lastLoginAt, appVersion: $appVersion, deviceInfo: $deviceInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerAppMetadataImpl &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lastLoginAt, appVersion, deviceInfo);

  /// Create a copy of CustomerAppMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerAppMetadataImplCopyWith<_$CustomerAppMetadataImpl> get copyWith =>
      __$$CustomerAppMetadataImplCopyWithImpl<_$CustomerAppMetadataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerAppMetadataImplToJson(
      this,
    );
  }
}

abstract class _CustomerAppMetadata implements CustomerAppMetadata {
  const factory _CustomerAppMetadata(
      {final DateTime? lastLoginAt,
      final String? appVersion,
      final DeviceInfo? deviceInfo}) = _$CustomerAppMetadataImpl;

  factory _CustomerAppMetadata.fromJson(Map<String, dynamic> json) =
      _$CustomerAppMetadataImpl.fromJson;

  @override
  DateTime? get lastLoginAt;
  @override
  String? get appVersion;
  @override
  DeviceInfo? get deviceInfo;

  /// Create a copy of CustomerAppMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerAppMetadataImplCopyWith<_$CustomerAppMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationSettings _$NotificationSettingsFromJson(Map<String, dynamic> json) {
  return _NotificationSettings.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettings {
  bool get bookingUpdates => throw _privateConstructorUsedError;
  bool get messageNotifications => throw _privateConstructorUsedError;
  bool get serviceReports => throw _privateConstructorUsedError;
  bool get promotionalEmails => throw _privateConstructorUsedError;
  bool get pushNotifications => throw _privateConstructorUsedError;

  /// Serializes this NotificationSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationSettingsCopyWith<NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(NotificationSettings value,
          $Res Function(NotificationSettings) then) =
      _$NotificationSettingsCopyWithImpl<$Res, NotificationSettings>;
  @useResult
  $Res call(
      {bool bookingUpdates,
      bool messageNotifications,
      bool serviceReports,
      bool promotionalEmails,
      bool pushNotifications});
}

/// @nodoc
class _$NotificationSettingsCopyWithImpl<$Res,
        $Val extends NotificationSettings>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingUpdates = null,
    Object? messageNotifications = null,
    Object? serviceReports = null,
    Object? promotionalEmails = null,
    Object? pushNotifications = null,
  }) {
    return _then(_value.copyWith(
      bookingUpdates: null == bookingUpdates
          ? _value.bookingUpdates
          : bookingUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
      messageNotifications: null == messageNotifications
          ? _value.messageNotifications
          : messageNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceReports: null == serviceReports
          ? _value.serviceReports
          : serviceReports // ignore: cast_nullable_to_non_nullable
              as bool,
      promotionalEmails: null == promotionalEmails
          ? _value.promotionalEmails
          : promotionalEmails // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotifications: null == pushNotifications
          ? _value.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSettingsImplCopyWith<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  factory _$$NotificationSettingsImplCopyWith(_$NotificationSettingsImpl value,
          $Res Function(_$NotificationSettingsImpl) then) =
      __$$NotificationSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool bookingUpdates,
      bool messageNotifications,
      bool serviceReports,
      bool promotionalEmails,
      bool pushNotifications});
}

/// @nodoc
class __$$NotificationSettingsImplCopyWithImpl<$Res>
    extends _$NotificationSettingsCopyWithImpl<$Res, _$NotificationSettingsImpl>
    implements _$$NotificationSettingsImplCopyWith<$Res> {
  __$$NotificationSettingsImplCopyWithImpl(_$NotificationSettingsImpl _value,
      $Res Function(_$NotificationSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingUpdates = null,
    Object? messageNotifications = null,
    Object? serviceReports = null,
    Object? promotionalEmails = null,
    Object? pushNotifications = null,
  }) {
    return _then(_$NotificationSettingsImpl(
      bookingUpdates: null == bookingUpdates
          ? _value.bookingUpdates
          : bookingUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
      messageNotifications: null == messageNotifications
          ? _value.messageNotifications
          : messageNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceReports: null == serviceReports
          ? _value.serviceReports
          : serviceReports // ignore: cast_nullable_to_non_nullable
              as bool,
      promotionalEmails: null == promotionalEmails
          ? _value.promotionalEmails
          : promotionalEmails // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotifications: null == pushNotifications
          ? _value.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingsImpl implements _NotificationSettings {
  const _$NotificationSettingsImpl(
      {this.bookingUpdates = true,
      this.messageNotifications = true,
      this.serviceReports = true,
      this.promotionalEmails = false,
      this.pushNotifications = true});

  factory _$NotificationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool bookingUpdates;
  @override
  @JsonKey()
  final bool messageNotifications;
  @override
  @JsonKey()
  final bool serviceReports;
  @override
  @JsonKey()
  final bool promotionalEmails;
  @override
  @JsonKey()
  final bool pushNotifications;

  @override
  String toString() {
    return 'NotificationSettings(bookingUpdates: $bookingUpdates, messageNotifications: $messageNotifications, serviceReports: $serviceReports, promotionalEmails: $promotionalEmails, pushNotifications: $pushNotifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsImpl &&
            (identical(other.bookingUpdates, bookingUpdates) ||
                other.bookingUpdates == bookingUpdates) &&
            (identical(other.messageNotifications, messageNotifications) ||
                other.messageNotifications == messageNotifications) &&
            (identical(other.serviceReports, serviceReports) ||
                other.serviceReports == serviceReports) &&
            (identical(other.promotionalEmails, promotionalEmails) ||
                other.promotionalEmails == promotionalEmails) &&
            (identical(other.pushNotifications, pushNotifications) ||
                other.pushNotifications == pushNotifications));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookingUpdates,
      messageNotifications,
      serviceReports,
      promotionalEmails,
      pushNotifications);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
      get copyWith =>
          __$$NotificationSettingsImplCopyWithImpl<_$NotificationSettingsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingsImplToJson(
      this,
    );
  }
}

abstract class _NotificationSettings implements NotificationSettings {
  const factory _NotificationSettings(
      {final bool bookingUpdates,
      final bool messageNotifications,
      final bool serviceReports,
      final bool promotionalEmails,
      final bool pushNotifications}) = _$NotificationSettingsImpl;

  factory _NotificationSettings.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingsImpl.fromJson;

  @override
  bool get bookingUpdates;
  @override
  bool get messageNotifications;
  @override
  bool get serviceReports;
  @override
  bool get promotionalEmails;
  @override
  bool get pushNotifications;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) {
  return _DeviceInfo.fromJson(json);
}

/// @nodoc
mixin _$DeviceInfo {
  String? get platform => throw _privateConstructorUsedError;
  String? get deviceModel => throw _privateConstructorUsedError;
  String? get osVersion => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;

  /// Serializes this DeviceInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceInfoCopyWith<DeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoCopyWith<$Res> {
  factory $DeviceInfoCopyWith(
          DeviceInfo value, $Res Function(DeviceInfo) then) =
      _$DeviceInfoCopyWithImpl<$Res, DeviceInfo>;
  @useResult
  $Res call(
      {String? platform,
      String? deviceModel,
      String? osVersion,
      String? appVersion});
}

/// @nodoc
class _$DeviceInfoCopyWithImpl<$Res, $Val extends DeviceInfo>
    implements $DeviceInfoCopyWith<$Res> {
  _$DeviceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = freezed,
    Object? deviceModel = freezed,
    Object? osVersion = freezed,
    Object? appVersion = freezed,
  }) {
    return _then(_value.copyWith(
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceModel: freezed == deviceModel
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String?,
      osVersion: freezed == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceInfoImplCopyWith<$Res>
    implements $DeviceInfoCopyWith<$Res> {
  factory _$$DeviceInfoImplCopyWith(
          _$DeviceInfoImpl value, $Res Function(_$DeviceInfoImpl) then) =
      __$$DeviceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? platform,
      String? deviceModel,
      String? osVersion,
      String? appVersion});
}

/// @nodoc
class __$$DeviceInfoImplCopyWithImpl<$Res>
    extends _$DeviceInfoCopyWithImpl<$Res, _$DeviceInfoImpl>
    implements _$$DeviceInfoImplCopyWith<$Res> {
  __$$DeviceInfoImplCopyWithImpl(
      _$DeviceInfoImpl _value, $Res Function(_$DeviceInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = freezed,
    Object? deviceModel = freezed,
    Object? osVersion = freezed,
    Object? appVersion = freezed,
  }) {
    return _then(_$DeviceInfoImpl(
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceModel: freezed == deviceModel
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String?,
      osVersion: freezed == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceInfoImpl implements _DeviceInfo {
  const _$DeviceInfoImpl(
      {this.platform, this.deviceModel, this.osVersion, this.appVersion});

  factory _$DeviceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceInfoImplFromJson(json);

  @override
  final String? platform;
  @override
  final String? deviceModel;
  @override
  final String? osVersion;
  @override
  final String? appVersion;

  @override
  String toString() {
    return 'DeviceInfo(platform: $platform, deviceModel: $deviceModel, osVersion: $osVersion, appVersion: $appVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceInfoImpl &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.deviceModel, deviceModel) ||
                other.deviceModel == deviceModel) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, platform, deviceModel, osVersion, appVersion);

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceInfoImplCopyWith<_$DeviceInfoImpl> get copyWith =>
      __$$DeviceInfoImplCopyWithImpl<_$DeviceInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceInfoImplToJson(
      this,
    );
  }
}

abstract class _DeviceInfo implements DeviceInfo {
  const factory _DeviceInfo(
      {final String? platform,
      final String? deviceModel,
      final String? osVersion,
      final String? appVersion}) = _$DeviceInfoImpl;

  factory _DeviceInfo.fromJson(Map<String, dynamic> json) =
      _$DeviceInfoImpl.fromJson;

  @override
  String? get platform;
  @override
  String? get deviceModel;
  @override
  String? get osVersion;
  @override
  String? get appVersion;

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceInfoImplCopyWith<_$DeviceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
