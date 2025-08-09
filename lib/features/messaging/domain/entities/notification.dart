import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class AppNotification with _$AppNotification {
  const AppNotification._();

  const factory AppNotification({
    required String id,
    required String userId,
    required NotificationType type,
    required String title,
    required String body,
    Map<String, dynamic>? data,
    String? imageUrl,
    String? actionUrl,
    @Default(false) bool isRead,
    @Default(NotificationPriority.normal) NotificationPriority priority,
    DateTime? scheduledAt,
    DateTime? sentAt,
    DateTime? readAt,
    DateTime? expiresAt,
    DateTime? createdAt,
    Map<String, String>? metadata,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);

  // Firestoreとの変換用メソッド
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'userId': userId,
      'type': type.name,
      'title': title,
      'body': body,
      'data': data,
      'imageUrl': imageUrl,
      'actionUrl': actionUrl,
      'isRead': isRead,
      'priority': priority.name,
      'scheduledAt': scheduledAt?.toIso8601String(),
      'sentAt': sentAt?.toIso8601String(),
      'readAt': readAt?.toIso8601String(),
      'expiresAt': expiresAt?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'metadata': metadata,
    };
  }

  factory AppNotification.fromFirestore(Map<String, dynamic> data) {
    return AppNotification(
      id: data['id'] ?? '',
      userId: data['userId'] ?? '',
      type: NotificationType.values.firstWhere(
        (t) => t.name == data['type'],
        orElse: () => NotificationType.general,
      ),
      title: data['title'] ?? '',
      body: data['body'] ?? '',
      data: data['data'],
      imageUrl: data['imageUrl'],
      actionUrl: data['actionUrl'],
      isRead: data['isRead'] ?? false,
      priority: NotificationPriority.values.firstWhere(
        (p) => p.name == data['priority'],
        orElse: () => NotificationPriority.normal,
      ),
      scheduledAt: data['scheduledAt'] != null
          ? DateTime.parse(data['scheduledAt'])
          : null,
      sentAt: data['sentAt'] != null ? DateTime.parse(data['sentAt']) : null,
      readAt: data['readAt'] != null ? DateTime.parse(data['readAt']) : null,
      expiresAt:
          data['expiresAt'] != null ? DateTime.parse(data['expiresAt']) : null,
      createdAt:
          data['createdAt'] != null ? DateTime.parse(data['createdAt']) : null,
      metadata: data['metadata'] != null
          ? Map<String, String>.from(data['metadata'])
          : null,
    );
  }

  // FCM用のペイロード生成
  Map<String, dynamic> toFCMPayload() {
    return {
      'notification': {
        'title': title,
        'body': body,
        if (imageUrl != null) 'image': imageUrl,
      },
      'data': {
        'id': id,
        'type': type.name,
        'priority': priority.name,
        if (actionUrl != null) 'actionUrl': actionUrl,
        if (data != null) ...data!.map((k, v) => MapEntry(k, v.toString())),
      },
      'android': {
        'priority': _getAndroidPriority(),
        'notification': {
          'channel_id': _getChannelId(),
          'sound': 'default',
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        },
      },
      'apns': {
        'payload': {
          'aps': {
            'alert': {
              'title': title,
              'body': body,
            },
            'sound': 'default',
            'badge': 1,
            'content-available': 1,
          },
        },
      },
    };
  }

  // 通知が期限切れかチェック
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  // 通知が送信済みかチェック
  bool get isSent => sentAt != null;

  // 通知がスケジュール済みかチェック
  bool get isScheduled => scheduledAt != null && sentAt == null;

  // 通知の重要度に基づくアイコン
  String get priorityIcon {
    switch (priority) {
      case NotificationPriority.low:
        return 'info';
      case NotificationPriority.normal:
        return 'notifications';
      case NotificationPriority.high:
        return 'priority_high';
      case NotificationPriority.critical:
        return 'error';
    }
  }

  String _getAndroidPriority() {
    switch (priority) {
      case NotificationPriority.low:
        return 'min';
      case NotificationPriority.normal:
        return 'default';
      case NotificationPriority.high:
        return 'high';
      case NotificationPriority.critical:
        return 'max';
    }
  }

  String _getChannelId() {
    switch (type) {
      case NotificationType.bookingConfirmed:
      case NotificationType.bookingReminder:
      case NotificationType.serviceStarted:
      case NotificationType.serviceCompleted:
        return 'booking_notifications';
      case NotificationType.messageReceived:
        return 'message_notifications';
      case NotificationType.paymentSuccess:
      case NotificationType.paymentFailed:
        return 'payment_notifications';
      case NotificationType.systemMaintenance:
        return 'system_notifications';
      case NotificationType.general:
        return 'general_notifications';
    }
  }
}

@freezed
class NotificationSettings with _$NotificationSettings {
  const NotificationSettings._();
  
  const factory NotificationSettings({
    required String userId,
    @Default(true) bool enabled,
    @Default(true) bool bookingNotifications,
    @Default(true) bool paymentNotifications,
    @Default(true) bool messageNotifications,
    @Default(false) bool marketingNotifications,
    @Default(true) bool soundEnabled,
    @Default(true) bool vibrationEnabled,
    @Default('default') String soundType,
    @Default(NotificationTime()) NotificationTime quietHours,
    List<String>? fcmTokens,
    DateTime? updatedAt,
  }) = _NotificationSettings;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingsFromJson(json);

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'enabled': enabled,
      'bookingNotifications': bookingNotifications,
      'paymentNotifications': paymentNotifications,
      'messageNotifications': messageNotifications,
      'marketingNotifications': marketingNotifications,
      'soundEnabled': soundEnabled,
      'vibrationEnabled': vibrationEnabled,
      'soundType': soundType,
      'quietHours': quietHours.toJson(),
      'fcmTokens': fcmTokens,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory NotificationSettings.fromFirestore(Map<String, dynamic> data) {
    return NotificationSettings(
      userId: data['userId'] ?? '',
      enabled: data['enabled'] ?? true,
      bookingNotifications: data['bookingNotifications'] ?? true,
      paymentNotifications: data['paymentNotifications'] ?? true,
      messageNotifications: data['messageNotifications'] ?? true,
      marketingNotifications: data['marketingNotifications'] ?? false,
      soundEnabled: data['soundEnabled'] ?? true,
      vibrationEnabled: data['vibrationEnabled'] ?? true,
      soundType: data['soundType'] ?? 'default',
      quietHours: data['quietHours'] != null
          ? NotificationTime.fromJson(data['quietHours'])
          : const NotificationTime(),
      fcmTokens: data['fcmTokens'] != null
          ? List<String>.from(data['fcmTokens'])
          : null,
      updatedAt:
          data['updatedAt'] != null ? DateTime.parse(data['updatedAt']) : null,
    );
  }
}

@freezed
class NotificationTime with _$NotificationTime {
  const factory NotificationTime({
    @Default(22) int startHour, // 22:00
    @Default(0) int startMinute,
    @Default(8) int endHour, // 08:00
    @Default(0) int endMinute,
  }) = _NotificationTime;

  factory NotificationTime.fromJson(Map<String, dynamic> json) =>
      _$NotificationTimeFromJson(json);
}

enum NotificationType {
  bookingConfirmed,
  bookingReminder,
  serviceStarted,
  serviceCompleted,
  messageReceived,
  paymentSuccess,
  paymentFailed,
  systemMaintenance,
  general,
}

enum NotificationPriority {
  low,
  normal,
  high,
  critical,
}

extension NotificationTypeExtension on NotificationType {
  String get displayName {
    switch (this) {
      case NotificationType.bookingConfirmed:
        return '予約確定';
      case NotificationType.bookingReminder:
        return '予約リマインダー';
      case NotificationType.serviceStarted:
        return 'サービス開始';
      case NotificationType.serviceCompleted:
        return 'サービス完了';
      case NotificationType.messageReceived:
        return 'メッセージ受信';
      case NotificationType.paymentSuccess:
        return '決済完了';
      case NotificationType.paymentFailed:
        return '決済失敗';
      case NotificationType.systemMaintenance:
        return 'システムメンテナンス';
      case NotificationType.general:
        return '一般';
    }
  }

  String get description {
    switch (this) {
      case NotificationType.bookingConfirmed:
        return '予約が確定された際の通知';
      case NotificationType.bookingReminder:
        return 'サービス開始前のリマインダー';
      case NotificationType.serviceStarted:
        return 'ペットシッターがサービスを開始した際の通知';
      case NotificationType.serviceCompleted:
        return 'サービスが完了した際の通知';
      case NotificationType.messageReceived:
        return 'ペットシッターからのメッセージ受信通知';
      case NotificationType.paymentSuccess:
        return '決済が完了した際の通知';
      case NotificationType.paymentFailed:
        return '決済が失敗した際の通知';
      case NotificationType.systemMaintenance:
        return 'システムメンテナンスの通知';
      case NotificationType.general:
        return '一般的なお知らせ';
    }
  }

  bool get isImportant {
    switch (this) {
      case NotificationType.bookingConfirmed:
      case NotificationType.serviceStarted:
      case NotificationType.serviceCompleted:
      case NotificationType.paymentSuccess:
        return true;
      default:
        return false;
    }
  }
}
