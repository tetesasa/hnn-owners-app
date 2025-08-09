import '../entities/notification.dart';
import '../../../../core/error/result.dart';

abstract class NotificationRepository {
  // 通知作成・送信
  Future<Result<AppNotification>> createNotification({
    required String userId,
    required NotificationType type,
    required String title,
    required String body,
    Map<String, dynamic>? data,
    String? imageUrl,
    String? actionUrl,
    NotificationPriority priority = NotificationPriority.normal,
    DateTime? scheduledAt,
    Map<String, String>? metadata,
  });

  Future<Result<void>> sendNotification(String notificationId);

  Future<Result<void>> sendImmediateNotification({
    required String userId,
    required NotificationType type,
    required String title,
    required String body,
    Map<String, dynamic>? data,
    String? imageUrl,
    NotificationPriority priority = NotificationPriority.normal,
  });

  // 通知取得
  Future<Result<AppNotification>> getNotification(String notificationId);

  Future<Result<List<AppNotification>>> getUserNotifications({
    required String userId,
    NotificationType? type,
    bool? isRead,
    int limit = 20,
    String? startAfter,
  });

  Future<Result<int>> getUnreadNotificationCount(String userId);

  // 通知更新
  Future<Result<AppNotification>> markAsRead(String notificationId);

  Future<Result<void>> markAllAsRead(String userId);

  Future<Result<AppNotification>> updateNotification({
    required String notificationId,
    String? title,
    String? body,
    Map<String, dynamic>? data,
    NotificationPriority? priority,
  });

  // 通知削除
  Future<Result<void>> deleteNotification(String notificationId);

  Future<Result<void>> deleteExpiredNotifications();

  // スケジュール通知
  Future<Result<List<AppNotification>>> getScheduledNotifications({
    DateTime? before,
    DateTime? after,
  });

  Future<Result<void>> processScheduledNotifications();

  // 通知設定
  Future<Result<NotificationSettings>> getNotificationSettings(String userId);

  Future<Result<NotificationSettings>> updateNotificationSettings({
    required String userId,
    bool? enabled,
    bool? bookingNotifications,
    bool? paymentNotifications,
    bool? messageNotifications,
    bool? marketingNotifications,
    bool? soundEnabled,
    bool? vibrationEnabled,
    String? soundType,
    NotificationTime? quietHours,
  });

  // FCMトークン管理
  Future<Result<void>> registerFCMToken({
    required String userId,
    required String token,
    String? deviceType,
  });

  Future<Result<void>> unregisterFCMToken({
    required String userId,
    required String token,
  });

  Future<Result<List<String>>> getUserFCMTokens(String userId);

  // 一括送信
  Future<Result<void>> sendBulkNotifications({
    required List<String> userIds,
    required NotificationType type,
    required String title,
    required String body,
    Map<String, dynamic>? data,
    NotificationPriority priority = NotificationPriority.normal,
  });

  // 統計・分析
  Future<Result<Map<String, dynamic>>> getNotificationStats({
    String? userId,
    DateTime? startDate,
    DateTime? endDate,
    NotificationType? type,
  });

  // テンプレート系
  Future<Result<AppNotification>> createFromTemplate({
    required String templateId,
    required String userId,
    Map<String, String>? variables,
    DateTime? scheduledAt,
  });
}
