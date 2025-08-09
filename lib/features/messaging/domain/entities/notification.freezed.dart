// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) {
  return _AppNotification.fromJson(json);
}

/// @nodoc
mixin _$AppNotification {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get actionUrl => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  NotificationPriority get priority => throw _privateConstructorUsedError;
  DateTime? get scheduledAt => throw _privateConstructorUsedError;
  DateTime? get sentAt => throw _privateConstructorUsedError;
  DateTime? get readAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  Map<String, String>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this AppNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppNotificationCopyWith<AppNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNotificationCopyWith<$Res> {
  factory $AppNotificationCopyWith(
          AppNotification value, $Res Function(AppNotification) then) =
      _$AppNotificationCopyWithImpl<$Res, AppNotification>;
  @useResult
  $Res call(
      {String id,
      String userId,
      NotificationType type,
      String title,
      String body,
      Map<String, dynamic>? data,
      String? imageUrl,
      String? actionUrl,
      bool isRead,
      NotificationPriority priority,
      DateTime? scheduledAt,
      DateTime? sentAt,
      DateTime? readAt,
      DateTime? expiresAt,
      DateTime? createdAt,
      Map<String, String>? metadata});
}

/// @nodoc
class _$AppNotificationCopyWithImpl<$Res, $Val extends AppNotification>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? body = null,
    Object? data = freezed,
    Object? imageUrl = freezed,
    Object? actionUrl = freezed,
    Object? isRead = null,
    Object? priority = null,
    Object? scheduledAt = freezed,
    Object? sentAt = freezed,
    Object? readAt = freezed,
    Object? expiresAt = freezed,
    Object? createdAt = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppNotificationImplCopyWith<$Res>
    implements $AppNotificationCopyWith<$Res> {
  factory _$$AppNotificationImplCopyWith(_$AppNotificationImpl value,
          $Res Function(_$AppNotificationImpl) then) =
      __$$AppNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      NotificationType type,
      String title,
      String body,
      Map<String, dynamic>? data,
      String? imageUrl,
      String? actionUrl,
      bool isRead,
      NotificationPriority priority,
      DateTime? scheduledAt,
      DateTime? sentAt,
      DateTime? readAt,
      DateTime? expiresAt,
      DateTime? createdAt,
      Map<String, String>? metadata});
}

/// @nodoc
class __$$AppNotificationImplCopyWithImpl<$Res>
    extends _$AppNotificationCopyWithImpl<$Res, _$AppNotificationImpl>
    implements _$$AppNotificationImplCopyWith<$Res> {
  __$$AppNotificationImplCopyWithImpl(
      _$AppNotificationImpl _value, $Res Function(_$AppNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? body = null,
    Object? data = freezed,
    Object? imageUrl = freezed,
    Object? actionUrl = freezed,
    Object? isRead = null,
    Object? priority = null,
    Object? scheduledAt = freezed,
    Object? sentAt = freezed,
    Object? readAt = freezed,
    Object? expiresAt = freezed,
    Object? createdAt = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$AppNotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppNotificationImpl extends _AppNotification {
  const _$AppNotificationImpl(
      {required this.id,
      required this.userId,
      required this.type,
      required this.title,
      required this.body,
      final Map<String, dynamic>? data,
      this.imageUrl,
      this.actionUrl,
      this.isRead = false,
      this.priority = NotificationPriority.normal,
      this.scheduledAt,
      this.sentAt,
      this.readAt,
      this.expiresAt,
      this.createdAt,
      final Map<String, String>? metadata})
      : _data = data,
        _metadata = metadata,
        super._();

  factory _$AppNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppNotificationImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final NotificationType type;
  @override
  final String title;
  @override
  final String body;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? imageUrl;
  @override
  final String? actionUrl;
  @override
  @JsonKey()
  final bool isRead;
  @override
  @JsonKey()
  final NotificationPriority priority;
  @override
  final DateTime? scheduledAt;
  @override
  final DateTime? sentAt;
  @override
  final DateTime? readAt;
  @override
  final DateTime? expiresAt;
  @override
  final DateTime? createdAt;
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
  String toString() {
    return 'AppNotification(id: $id, userId: $userId, type: $type, title: $title, body: $body, data: $data, imageUrl: $imageUrl, actionUrl: $actionUrl, isRead: $isRead, priority: $priority, scheduledAt: $scheduledAt, sentAt: $sentAt, readAt: $readAt, expiresAt: $expiresAt, createdAt: $createdAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      type,
      title,
      body,
      const DeepCollectionEquality().hash(_data),
      imageUrl,
      actionUrl,
      isRead,
      priority,
      scheduledAt,
      sentAt,
      readAt,
      expiresAt,
      createdAt,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppNotificationImplCopyWith<_$AppNotificationImpl> get copyWith =>
      __$$AppNotificationImplCopyWithImpl<_$AppNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppNotificationImplToJson(
      this,
    );
  }
}

abstract class _AppNotification extends AppNotification {
  const factory _AppNotification(
      {required final String id,
      required final String userId,
      required final NotificationType type,
      required final String title,
      required final String body,
      final Map<String, dynamic>? data,
      final String? imageUrl,
      final String? actionUrl,
      final bool isRead,
      final NotificationPriority priority,
      final DateTime? scheduledAt,
      final DateTime? sentAt,
      final DateTime? readAt,
      final DateTime? expiresAt,
      final DateTime? createdAt,
      final Map<String, String>? metadata}) = _$AppNotificationImpl;
  const _AppNotification._() : super._();

  factory _AppNotification.fromJson(Map<String, dynamic> json) =
      _$AppNotificationImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  NotificationType get type;
  @override
  String get title;
  @override
  String get body;
  @override
  Map<String, dynamic>? get data;
  @override
  String? get imageUrl;
  @override
  String? get actionUrl;
  @override
  bool get isRead;
  @override
  NotificationPriority get priority;
  @override
  DateTime? get scheduledAt;
  @override
  DateTime? get sentAt;
  @override
  DateTime? get readAt;
  @override
  DateTime? get expiresAt;
  @override
  DateTime? get createdAt;
  @override
  Map<String, String>? get metadata;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppNotificationImplCopyWith<_$AppNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationSettings _$NotificationSettingsFromJson(Map<String, dynamic> json) {
  return _NotificationSettings.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettings {
  String get userId => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  bool get bookingNotifications => throw _privateConstructorUsedError;
  bool get paymentNotifications => throw _privateConstructorUsedError;
  bool get messageNotifications => throw _privateConstructorUsedError;
  bool get marketingNotifications => throw _privateConstructorUsedError;
  bool get soundEnabled => throw _privateConstructorUsedError;
  bool get vibrationEnabled => throw _privateConstructorUsedError;
  String get soundType => throw _privateConstructorUsedError;
  NotificationTime get quietHours => throw _privateConstructorUsedError;
  List<String>? get fcmTokens => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

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
      {String userId,
      bool enabled,
      bool bookingNotifications,
      bool paymentNotifications,
      bool messageNotifications,
      bool marketingNotifications,
      bool soundEnabled,
      bool vibrationEnabled,
      String soundType,
      NotificationTime quietHours,
      List<String>? fcmTokens,
      DateTime? updatedAt});

  $NotificationTimeCopyWith<$Res> get quietHours;
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
    Object? userId = null,
    Object? enabled = null,
    Object? bookingNotifications = null,
    Object? paymentNotifications = null,
    Object? messageNotifications = null,
    Object? marketingNotifications = null,
    Object? soundEnabled = null,
    Object? vibrationEnabled = null,
    Object? soundType = null,
    Object? quietHours = null,
    Object? fcmTokens = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      bookingNotifications: null == bookingNotifications
          ? _value.bookingNotifications
          : bookingNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentNotifications: null == paymentNotifications
          ? _value.paymentNotifications
          : paymentNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      messageNotifications: null == messageNotifications
          ? _value.messageNotifications
          : messageNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingNotifications: null == marketingNotifications
          ? _value.marketingNotifications
          : marketingNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      soundEnabled: null == soundEnabled
          ? _value.soundEnabled
          : soundEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      vibrationEnabled: null == vibrationEnabled
          ? _value.vibrationEnabled
          : vibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      soundType: null == soundType
          ? _value.soundType
          : soundType // ignore: cast_nullable_to_non_nullable
              as String,
      quietHours: null == quietHours
          ? _value.quietHours
          : quietHours // ignore: cast_nullable_to_non_nullable
              as NotificationTime,
      fcmTokens: freezed == fcmTokens
          ? _value.fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationTimeCopyWith<$Res> get quietHours {
    return $NotificationTimeCopyWith<$Res>(_value.quietHours, (value) {
      return _then(_value.copyWith(quietHours: value) as $Val);
    });
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
      {String userId,
      bool enabled,
      bool bookingNotifications,
      bool paymentNotifications,
      bool messageNotifications,
      bool marketingNotifications,
      bool soundEnabled,
      bool vibrationEnabled,
      String soundType,
      NotificationTime quietHours,
      List<String>? fcmTokens,
      DateTime? updatedAt});

  @override
  $NotificationTimeCopyWith<$Res> get quietHours;
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
    Object? userId = null,
    Object? enabled = null,
    Object? bookingNotifications = null,
    Object? paymentNotifications = null,
    Object? messageNotifications = null,
    Object? marketingNotifications = null,
    Object? soundEnabled = null,
    Object? vibrationEnabled = null,
    Object? soundType = null,
    Object? quietHours = null,
    Object? fcmTokens = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$NotificationSettingsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      bookingNotifications: null == bookingNotifications
          ? _value.bookingNotifications
          : bookingNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentNotifications: null == paymentNotifications
          ? _value.paymentNotifications
          : paymentNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      messageNotifications: null == messageNotifications
          ? _value.messageNotifications
          : messageNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingNotifications: null == marketingNotifications
          ? _value.marketingNotifications
          : marketingNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      soundEnabled: null == soundEnabled
          ? _value.soundEnabled
          : soundEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      vibrationEnabled: null == vibrationEnabled
          ? _value.vibrationEnabled
          : vibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      soundType: null == soundType
          ? _value.soundType
          : soundType // ignore: cast_nullable_to_non_nullable
              as String,
      quietHours: null == quietHours
          ? _value.quietHours
          : quietHours // ignore: cast_nullable_to_non_nullable
              as NotificationTime,
      fcmTokens: freezed == fcmTokens
          ? _value._fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingsImpl extends _NotificationSettings {
  const _$NotificationSettingsImpl(
      {required this.userId,
      this.enabled = true,
      this.bookingNotifications = true,
      this.paymentNotifications = true,
      this.messageNotifications = true,
      this.marketingNotifications = false,
      this.soundEnabled = true,
      this.vibrationEnabled = true,
      this.soundType = 'default',
      this.quietHours = const NotificationTime(),
      final List<String>? fcmTokens,
      this.updatedAt})
      : _fcmTokens = fcmTokens,
        super._();

  factory _$NotificationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingsImplFromJson(json);

  @override
  final String userId;
  @override
  @JsonKey()
  final bool enabled;
  @override
  @JsonKey()
  final bool bookingNotifications;
  @override
  @JsonKey()
  final bool paymentNotifications;
  @override
  @JsonKey()
  final bool messageNotifications;
  @override
  @JsonKey()
  final bool marketingNotifications;
  @override
  @JsonKey()
  final bool soundEnabled;
  @override
  @JsonKey()
  final bool vibrationEnabled;
  @override
  @JsonKey()
  final String soundType;
  @override
  @JsonKey()
  final NotificationTime quietHours;
  final List<String>? _fcmTokens;
  @override
  List<String>? get fcmTokens {
    final value = _fcmTokens;
    if (value == null) return null;
    if (_fcmTokens is EqualUnmodifiableListView) return _fcmTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'NotificationSettings(userId: $userId, enabled: $enabled, bookingNotifications: $bookingNotifications, paymentNotifications: $paymentNotifications, messageNotifications: $messageNotifications, marketingNotifications: $marketingNotifications, soundEnabled: $soundEnabled, vibrationEnabled: $vibrationEnabled, soundType: $soundType, quietHours: $quietHours, fcmTokens: $fcmTokens, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.bookingNotifications, bookingNotifications) ||
                other.bookingNotifications == bookingNotifications) &&
            (identical(other.paymentNotifications, paymentNotifications) ||
                other.paymentNotifications == paymentNotifications) &&
            (identical(other.messageNotifications, messageNotifications) ||
                other.messageNotifications == messageNotifications) &&
            (identical(other.marketingNotifications, marketingNotifications) ||
                other.marketingNotifications == marketingNotifications) &&
            (identical(other.soundEnabled, soundEnabled) ||
                other.soundEnabled == soundEnabled) &&
            (identical(other.vibrationEnabled, vibrationEnabled) ||
                other.vibrationEnabled == vibrationEnabled) &&
            (identical(other.soundType, soundType) ||
                other.soundType == soundType) &&
            (identical(other.quietHours, quietHours) ||
                other.quietHours == quietHours) &&
            const DeepCollectionEquality()
                .equals(other._fcmTokens, _fcmTokens) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      enabled,
      bookingNotifications,
      paymentNotifications,
      messageNotifications,
      marketingNotifications,
      soundEnabled,
      vibrationEnabled,
      soundType,
      quietHours,
      const DeepCollectionEquality().hash(_fcmTokens),
      updatedAt);

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

abstract class _NotificationSettings extends NotificationSettings {
  const factory _NotificationSettings(
      {required final String userId,
      final bool enabled,
      final bool bookingNotifications,
      final bool paymentNotifications,
      final bool messageNotifications,
      final bool marketingNotifications,
      final bool soundEnabled,
      final bool vibrationEnabled,
      final String soundType,
      final NotificationTime quietHours,
      final List<String>? fcmTokens,
      final DateTime? updatedAt}) = _$NotificationSettingsImpl;
  const _NotificationSettings._() : super._();

  factory _NotificationSettings.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingsImpl.fromJson;

  @override
  String get userId;
  @override
  bool get enabled;
  @override
  bool get bookingNotifications;
  @override
  bool get paymentNotifications;
  @override
  bool get messageNotifications;
  @override
  bool get marketingNotifications;
  @override
  bool get soundEnabled;
  @override
  bool get vibrationEnabled;
  @override
  String get soundType;
  @override
  NotificationTime get quietHours;
  @override
  List<String>? get fcmTokens;
  @override
  DateTime? get updatedAt;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NotificationTime _$NotificationTimeFromJson(Map<String, dynamic> json) {
  return _NotificationTime.fromJson(json);
}

/// @nodoc
mixin _$NotificationTime {
  int get startHour => throw _privateConstructorUsedError; // 22:00
  int get startMinute => throw _privateConstructorUsedError;
  int get endHour => throw _privateConstructorUsedError; // 08:00
  int get endMinute => throw _privateConstructorUsedError;

  /// Serializes this NotificationTime to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationTimeCopyWith<NotificationTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTimeCopyWith<$Res> {
  factory $NotificationTimeCopyWith(
          NotificationTime value, $Res Function(NotificationTime) then) =
      _$NotificationTimeCopyWithImpl<$Res, NotificationTime>;
  @useResult
  $Res call({int startHour, int startMinute, int endHour, int endMinute});
}

/// @nodoc
class _$NotificationTimeCopyWithImpl<$Res, $Val extends NotificationTime>
    implements $NotificationTimeCopyWith<$Res> {
  _$NotificationTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startHour = null,
    Object? startMinute = null,
    Object? endHour = null,
    Object? endMinute = null,
  }) {
    return _then(_value.copyWith(
      startHour: null == startHour
          ? _value.startHour
          : startHour // ignore: cast_nullable_to_non_nullable
              as int,
      startMinute: null == startMinute
          ? _value.startMinute
          : startMinute // ignore: cast_nullable_to_non_nullable
              as int,
      endHour: null == endHour
          ? _value.endHour
          : endHour // ignore: cast_nullable_to_non_nullable
              as int,
      endMinute: null == endMinute
          ? _value.endMinute
          : endMinute // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationTimeImplCopyWith<$Res>
    implements $NotificationTimeCopyWith<$Res> {
  factory _$$NotificationTimeImplCopyWith(_$NotificationTimeImpl value,
          $Res Function(_$NotificationTimeImpl) then) =
      __$$NotificationTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int startHour, int startMinute, int endHour, int endMinute});
}

/// @nodoc
class __$$NotificationTimeImplCopyWithImpl<$Res>
    extends _$NotificationTimeCopyWithImpl<$Res, _$NotificationTimeImpl>
    implements _$$NotificationTimeImplCopyWith<$Res> {
  __$$NotificationTimeImplCopyWithImpl(_$NotificationTimeImpl _value,
      $Res Function(_$NotificationTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startHour = null,
    Object? startMinute = null,
    Object? endHour = null,
    Object? endMinute = null,
  }) {
    return _then(_$NotificationTimeImpl(
      startHour: null == startHour
          ? _value.startHour
          : startHour // ignore: cast_nullable_to_non_nullable
              as int,
      startMinute: null == startMinute
          ? _value.startMinute
          : startMinute // ignore: cast_nullable_to_non_nullable
              as int,
      endHour: null == endHour
          ? _value.endHour
          : endHour // ignore: cast_nullable_to_non_nullable
              as int,
      endMinute: null == endMinute
          ? _value.endMinute
          : endMinute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationTimeImpl implements _NotificationTime {
  const _$NotificationTimeImpl(
      {this.startHour = 22,
      this.startMinute = 0,
      this.endHour = 8,
      this.endMinute = 0});

  factory _$NotificationTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationTimeImplFromJson(json);

  @override
  @JsonKey()
  final int startHour;
// 22:00
  @override
  @JsonKey()
  final int startMinute;
  @override
  @JsonKey()
  final int endHour;
// 08:00
  @override
  @JsonKey()
  final int endMinute;

  @override
  String toString() {
    return 'NotificationTime(startHour: $startHour, startMinute: $startMinute, endHour: $endHour, endMinute: $endMinute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationTimeImpl &&
            (identical(other.startHour, startHour) ||
                other.startHour == startHour) &&
            (identical(other.startMinute, startMinute) ||
                other.startMinute == startMinute) &&
            (identical(other.endHour, endHour) || other.endHour == endHour) &&
            (identical(other.endMinute, endMinute) ||
                other.endMinute == endMinute));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startHour, startMinute, endHour, endMinute);

  /// Create a copy of NotificationTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationTimeImplCopyWith<_$NotificationTimeImpl> get copyWith =>
      __$$NotificationTimeImplCopyWithImpl<_$NotificationTimeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationTimeImplToJson(
      this,
    );
  }
}

abstract class _NotificationTime implements NotificationTime {
  const factory _NotificationTime(
      {final int startHour,
      final int startMinute,
      final int endHour,
      final int endMinute}) = _$NotificationTimeImpl;

  factory _NotificationTime.fromJson(Map<String, dynamic> json) =
      _$NotificationTimeImpl.fromJson;

  @override
  int get startHour; // 22:00
  @override
  int get startMinute;
  @override
  int get endHour; // 08:00
  @override
  int get endMinute;

  /// Create a copy of NotificationTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationTimeImplCopyWith<_$NotificationTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
