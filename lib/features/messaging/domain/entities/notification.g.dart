// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppNotificationImpl _$$AppNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$AppNotificationImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      title: json['title'] as String,
      body: json['body'] as String,
      data: json['data'] as Map<String, dynamic>?,
      imageUrl: json['imageUrl'] as String?,
      actionUrl: json['actionUrl'] as String?,
      isRead: json['isRead'] as bool? ?? false,
      priority: $enumDecodeNullable(
              _$NotificationPriorityEnumMap, json['priority']) ??
          NotificationPriority.normal,
      scheduledAt: json['scheduledAt'] == null
          ? null
          : DateTime.parse(json['scheduledAt'] as String),
      sentAt: json['sentAt'] == null
          ? null
          : DateTime.parse(json['sentAt'] as String),
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$AppNotificationImplToJson(
        _$AppNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'title': instance.title,
      'body': instance.body,
      'data': instance.data,
      'imageUrl': instance.imageUrl,
      'actionUrl': instance.actionUrl,
      'isRead': instance.isRead,
      'priority': _$NotificationPriorityEnumMap[instance.priority]!,
      'scheduledAt': instance.scheduledAt?.toIso8601String(),
      'sentAt': instance.sentAt?.toIso8601String(),
      'readAt': instance.readAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.bookingConfirmed: 'bookingConfirmed',
  NotificationType.bookingReminder: 'bookingReminder',
  NotificationType.serviceStarted: 'serviceStarted',
  NotificationType.serviceCompleted: 'serviceCompleted',
  NotificationType.messageReceived: 'messageReceived',
  NotificationType.paymentSuccess: 'paymentSuccess',
  NotificationType.paymentFailed: 'paymentFailed',
  NotificationType.systemMaintenance: 'systemMaintenance',
  NotificationType.general: 'general',
};

const _$NotificationPriorityEnumMap = {
  NotificationPriority.low: 'low',
  NotificationPriority.normal: 'normal',
  NotificationPriority.high: 'high',
  NotificationPriority.critical: 'critical',
};

_$NotificationSettingsImpl _$$NotificationSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSettingsImpl(
      userId: json['userId'] as String,
      enabled: json['enabled'] as bool? ?? true,
      bookingNotifications: json['bookingNotifications'] as bool? ?? true,
      paymentNotifications: json['paymentNotifications'] as bool? ?? true,
      messageNotifications: json['messageNotifications'] as bool? ?? true,
      marketingNotifications: json['marketingNotifications'] as bool? ?? false,
      soundEnabled: json['soundEnabled'] as bool? ?? true,
      vibrationEnabled: json['vibrationEnabled'] as bool? ?? true,
      soundType: json['soundType'] as String? ?? 'default',
      quietHours: json['quietHours'] == null
          ? const NotificationTime()
          : NotificationTime.fromJson(
              json['quietHours'] as Map<String, dynamic>),
      fcmTokens: (json['fcmTokens'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$NotificationSettingsImplToJson(
        _$NotificationSettingsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'enabled': instance.enabled,
      'bookingNotifications': instance.bookingNotifications,
      'paymentNotifications': instance.paymentNotifications,
      'messageNotifications': instance.messageNotifications,
      'marketingNotifications': instance.marketingNotifications,
      'soundEnabled': instance.soundEnabled,
      'vibrationEnabled': instance.vibrationEnabled,
      'soundType': instance.soundType,
      'quietHours': instance.quietHours,
      'fcmTokens': instance.fcmTokens,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$NotificationTimeImpl _$$NotificationTimeImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationTimeImpl(
      startHour: (json['startHour'] as num?)?.toInt() ?? 22,
      startMinute: (json['startMinute'] as num?)?.toInt() ?? 0,
      endHour: (json['endHour'] as num?)?.toInt() ?? 8,
      endMinute: (json['endMinute'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$NotificationTimeImplToJson(
        _$NotificationTimeImpl instance) =>
    <String, dynamic>{
      'startHour': instance.startHour,
      'startMinute': instance.startMinute,
      'endHour': instance.endHour,
      'endMinute': instance.endMinute,
    };
