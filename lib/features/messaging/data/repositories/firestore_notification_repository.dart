import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';

import '../../domain/entities/notification.dart';
import '../../domain/repositories/notification_repository.dart';
import '../../../../core/error/result.dart';
import '../services/fcm_service.dart';

class FirestoreNotificationRepository implements NotificationRepository {
  static final Logger _logger = Logger('FirestoreNotificationRepository');

  final FirebaseFirestore _firestore;
  final FCMService _fcmService;

  FirestoreNotificationRepository({
    FirebaseFirestore? firestore,
    FCMService? fcmService,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _fcmService = fcmService ?? FCMService();

  CollectionReference get _notificationsCollection =>
      _firestore.collection('notifications');

  CollectionReference get _notificationSettingsCollection =>
      _firestore.collection('notification_settings');

  @override
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
  }) async {
    try {
      final notificationId = _notificationsCollection.doc().id;
      final now = DateTime.now();

      final notification = AppNotification(
        id: notificationId,
        userId: userId,
        type: type,
        title: title,
        body: body,
        data: data,
        imageUrl: imageUrl,
        actionUrl: actionUrl,
        priority: priority,
        scheduledAt: scheduledAt,
        createdAt: now,
        metadata: metadata,
      );

      await _notificationsCollection
          .doc(notificationId)
          .set(notification.toFirestore());

      _logger.info('Created notification: $notificationId for user: $userId');
      return Result.success(notification);
    } catch (e) {
      _logger.severe('Failed to create notification: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to create notification: $e'));
    }
  }

  @override
  Future<Result<void>> sendNotification(String notificationId) async {
    try {
      final doc = await _notificationsCollection.doc(notificationId).get();
      if (!doc.exists) {
        return Result.failure(AppError.validation(
            message: 'Notification not found: $notificationId'));
      }

      final notification =
          AppNotification.fromFirestore(doc.data() as Map<String, dynamic>);

      // FCMトークンを取得
      final tokensResult = await getUserFCMTokens(notification.userId);
      if (tokensResult.isFailure) {
        return Result.failure(tokensResult.error!);
      }

      final tokens = tokensResult.data!;
      if (tokens.isEmpty) {
        _logger.warning('No FCM tokens found for user: ${notification.userId}');
        return Result.success(null);
      }

      // FCMメッセージを送信
      for (final token in tokens) {
        try {
          await _sendFCMMessage(notification, token);
        } catch (e) {
          _logger.warning('Failed to send FCM message to token $token: $e');
        }
      }

      // 送信済みとしてマーク
      await _notificationsCollection.doc(notificationId).update({
        'sentAt': DateTime.now().toIso8601String(),
      });

      _logger.info('Sent notification: $notificationId');
      return Result.success(null);
    } catch (e) {
      _logger.severe('Failed to send notification $notificationId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to send notification: $e'));
    }
  }

  @override
  Future<Result<void>> sendImmediateNotification({
    required String userId,
    required NotificationType type,
    required String title,
    required String body,
    Map<String, dynamic>? data,
    String? imageUrl,
    NotificationPriority priority = NotificationPriority.normal,
  }) async {
    try {
      // 通知を作成
      final createResult = await createNotification(
        userId: userId,
        type: type,
        title: title,
        body: body,
        data: data,
        imageUrl: imageUrl,
        priority: priority,
      );

      if (createResult.isFailure) {
        return Result.failure(createResult.error!);
      }

      // 即座に送信
      return await sendNotification(createResult.data!.id);
    } catch (e) {
      _logger.severe('Failed to send immediate notification: $e');
      return Result.failure(AppError.unknown(
          message: 'Failed to send immediate notification: $e'));
    }
  }

  @override
  Future<Result<AppNotification>> getNotification(String notificationId) async {
    try {
      final doc = await _notificationsCollection.doc(notificationId).get();

      if (!doc.exists) {
        return Result.failure(AppError.validation(
            message: 'Notification not found: $notificationId'));
      }

      final notification =
          AppNotification.fromFirestore(doc.data() as Map<String, dynamic>);
      return Result.success(notification);
    } catch (e) {
      _logger.severe('Failed to get notification $notificationId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to get notification: $e'));
    }
  }

  @override
  Future<Result<List<AppNotification>>> getUserNotifications({
    required String userId,
    NotificationType? type,
    bool? isRead,
    int limit = 20,
    String? startAfter,
  }) async {
    try {
      Query query = _notificationsCollection
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .limit(limit);

      if (type != null) {
        query = query.where('type', isEqualTo: type.name);
      }

      if (isRead != null) {
        query = query.where('isRead', isEqualTo: isRead);
      }

      if (startAfter != null) {
        final startDoc = await _notificationsCollection.doc(startAfter).get();
        query = query.startAfterDocument(startDoc);
      }

      final querySnapshot = await query.get();

      final notifications = querySnapshot.docs
          .map((doc) =>
              AppNotification.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();

      return Result.success(notifications);
    } catch (e) {
      _logger.severe('Failed to get user notifications for $userId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to get notifications: $e'));
    }
  }

  @override
  Future<Result<int>> getUnreadNotificationCount(String userId) async {
    try {
      final querySnapshot = await _notificationsCollection
          .where('userId', isEqualTo: userId)
          .where('isRead', isEqualTo: false)
          .count()
          .get();

      return Result.success(querySnapshot.count ?? 0);
    } catch (e) {
      _logger.severe('Failed to get unread notification count for $userId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to get unread count: $e'));
    }
  }

  @override
  Future<Result<AppNotification>> markAsRead(String notificationId) async {
    try {
      final now = DateTime.now();
      await _notificationsCollection.doc(notificationId).update({
        'isRead': true,
        'readAt': now.toIso8601String(),
      });

      final result = await getNotification(notificationId);
      if (result.isSuccess) {
        _logger.info('Marked notification as read: $notificationId');
      }

      return result;
    } catch (e) {
      _logger.severe('Failed to mark notification as read $notificationId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to mark as read: $e'));
    }
  }

  @override
  Future<Result<void>> markAllAsRead(String userId) async {
    try {
      final batch = _firestore.batch();
      final now = DateTime.now();

      final querySnapshot = await _notificationsCollection
          .where('userId', isEqualTo: userId)
          .where('isRead', isEqualTo: false)
          .get();

      for (final doc in querySnapshot.docs) {
        batch.update(doc.reference, {
          'isRead': true,
          'readAt': now.toIso8601String(),
        });
      }

      await batch.commit();
      _logger.info('Marked all notifications as read for user: $userId');
      return Result.success(null);
    } catch (e) {
      _logger
          .severe('Failed to mark all notifications as read for $userId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to mark all as read: $e'));
    }
  }

  @override
  Future<Result<AppNotification>> updateNotification({
    required String notificationId,
    String? title,
    String? body,
    Map<String, dynamic>? data,
    NotificationPriority? priority,
  }) async {
    try {
      final updateData = <String, dynamic>{};

      if (title != null) updateData['title'] = title;
      if (body != null) updateData['body'] = body;
      if (data != null) updateData['data'] = data;
      if (priority != null) updateData['priority'] = priority.name;

      updateData['updatedAt'] = DateTime.now().toIso8601String();

      await _notificationsCollection.doc(notificationId).update(updateData);
      return await getNotification(notificationId);
    } catch (e) {
      _logger.severe('Failed to update notification $notificationId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to update notification: $e'));
    }
  }

  @override
  Future<Result<void>> deleteNotification(String notificationId) async {
    try {
      await _notificationsCollection.doc(notificationId).delete();
      _logger.info('Deleted notification: $notificationId');
      return Result.success(null);
    } catch (e) {
      _logger.severe('Failed to delete notification $notificationId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to delete notification: $e'));
    }
  }

  @override
  Future<Result<void>> deleteExpiredNotifications() async {
    try {
      final now = DateTime.now();
      final batch = _firestore.batch();

      final querySnapshot = await _notificationsCollection
          .where('expiresAt', isLessThan: now.toIso8601String())
          .get();

      for (final doc in querySnapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
      _logger
          .info('Deleted ${querySnapshot.docs.length} expired notifications');
      return Result.success(null);
    } catch (e) {
      _logger.severe('Failed to delete expired notifications: $e');
      return Result.failure(AppError.unknown(
          message: 'Failed to delete expired notifications: $e'));
    }
  }

  @override
  Future<Result<List<AppNotification>>> getScheduledNotifications({
    DateTime? before,
    DateTime? after,
  }) async {
    try {
      Query query = _notificationsCollection
          .where('scheduledAt', isNotEqualTo: null)
          .where('sentAt', isEqualTo: null)
          .orderBy('scheduledAt');

      if (before != null) {
        query = query.where('scheduledAt',
            isLessThanOrEqualTo: before.toIso8601String());
      }

      if (after != null) {
        query = query.where('scheduledAt',
            isGreaterThanOrEqualTo: after.toIso8601String());
      }

      final querySnapshot = await query.get();

      final notifications = querySnapshot.docs
          .map((doc) =>
              AppNotification.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();

      return Result.success(notifications);
    } catch (e) {
      _logger.severe('Failed to get scheduled notifications: $e');
      return Result.failure(AppError.unknown(
          message: 'Failed to get scheduled notifications: $e'));
    }
  }

  @override
  Future<Result<void>> processScheduledNotifications() async {
    try {
      final now = DateTime.now();
      final result = await getScheduledNotifications(before: now);

      if (result.isFailure) {
        return Result.failure(result.error!);
      }

      final notifications = result.data!;
      int processedCount = 0;

      for (final notification in notifications) {
        try {
          await sendNotification(notification.id);
          processedCount++;
        } catch (e) {
          _logger.warning(
              'Failed to process scheduled notification ${notification.id}: $e');
        }
      }

      _logger.info('Processed $processedCount scheduled notifications');
      return Result.success(null);
    } catch (e) {
      _logger.severe('Failed to process scheduled notifications: $e');
      return Result.failure(AppError.unknown(
          message: 'Failed to process scheduled notifications: $e'));
    }
  }

  @override
  Future<Result<NotificationSettings>> getNotificationSettings(
      String userId) async {
    try {
      final doc = await _notificationSettingsCollection.doc(userId).get();

      NotificationSettings settings;
      if (doc.exists) {
        settings = NotificationSettings.fromFirestore(
            doc.data() as Map<String, dynamic>);
      } else {
        settings = NotificationSettings(userId: userId);
        // デフォルト設定を保存
        await _notificationSettingsCollection
            .doc(userId)
            .set(settings.toFirestore());
      }

      return Result.success(settings);
    } catch (e) {
      _logger.severe('Failed to get notification settings for $userId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to get notification settings: $e'));
    }
  }

  @override
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
  }) async {
    try {
      final updateData = <String, dynamic>{};

      if (enabled != null) updateData['enabled'] = enabled;
      if (bookingNotifications != null) {
        updateData['bookingNotifications'] = bookingNotifications;
      }
      if (paymentNotifications != null) {
        updateData['paymentNotifications'] = paymentNotifications;
      }
      if (messageNotifications != null) {
        updateData['messageNotifications'] = messageNotifications;
      }
      if (marketingNotifications != null) {
        updateData['marketingNotifications'] = marketingNotifications;
      }
      if (soundEnabled != null) updateData['soundEnabled'] = soundEnabled;
      if (vibrationEnabled != null) {
        updateData['vibrationEnabled'] = vibrationEnabled;
      }
      if (soundType != null) updateData['soundType'] = soundType;
      if (quietHours != null) updateData['quietHours'] = quietHours.toJson();

      updateData['updatedAt'] = DateTime.now().toIso8601String();

      await _notificationSettingsCollection.doc(userId).update(updateData);
      return await getNotificationSettings(userId);
    } catch (e) {
      _logger.severe('Failed to update notification settings for $userId: $e');
      return Result.failure(AppError.unknown(
          message: 'Failed to update notification settings: $e'));
    }
  }

  @override
  Future<Result<void>> registerFCMToken({
    required String userId,
    required String token,
    String? deviceType,
  }) async {
    try {
      final settingsResult = await getNotificationSettings(userId);
      if (settingsResult.isFailure) {
        return Result.failure(settingsResult.error!);
      }

      final settings = settingsResult.data!;
      final tokens = List<String>.from(settings.fcmTokens ?? []);

      if (!tokens.contains(token)) {
        tokens.add(token);

        await _notificationSettingsCollection.doc(userId).update({
          'fcmTokens': tokens,
          'updatedAt': DateTime.now().toIso8601String(),
        });

        _logger.info('Registered FCM token for user: $userId');
      }

      return Result.success(null);
    } catch (e) {
      _logger.severe('Failed to register FCM token for $userId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to register FCM token: $e'));
    }
  }

  @override
  Future<Result<void>> unregisterFCMToken({
    required String userId,
    required String token,
  }) async {
    try {
      final settingsResult = await getNotificationSettings(userId);
      if (settingsResult.isFailure) {
        return Result.failure(settingsResult.error!);
      }

      final settings = settingsResult.data!;
      final tokens = List<String>.from(settings.fcmTokens ?? []);

      tokens.remove(token);

      await _notificationSettingsCollection.doc(userId).update({
        'fcmTokens': tokens,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      _logger.info('Unregistered FCM token for user: $userId');
      return Result.success(null);
    } catch (e) {
      _logger.severe('Failed to unregister FCM token for $userId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to unregister FCM token: $e'));
    }
  }

  @override
  Future<Result<List<String>>> getUserFCMTokens(String userId) async {
    try {
      final settingsResult = await getNotificationSettings(userId);
      if (settingsResult.isFailure) {
        return Result.failure(settingsResult.error!);
      }

      final tokens = settingsResult.data!.fcmTokens ?? [];
      return Result.success(tokens);
    } catch (e) {
      _logger.severe('Failed to get FCM tokens for $userId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to get FCM tokens: $e'));
    }
  }

  @override
  Future<Result<void>> sendBulkNotifications({
    required List<String> userIds,
    required NotificationType type,
    required String title,
    required String body,
    Map<String, dynamic>? data,
    NotificationPriority priority = NotificationPriority.normal,
  }) async {
    try {
      final batch = _firestore.batch();
      final now = DateTime.now();
      int successCount = 0;

      for (final userId in userIds) {
        try {
          final notificationId = _notificationsCollection.doc().id;
          final notification = AppNotification(
            id: notificationId,
            userId: userId,
            type: type,
            title: title,
            body: body,
            data: data,
            priority: priority,
            createdAt: now,
          );

          batch.set(_notificationsCollection.doc(notificationId),
              notification.toFirestore());
          successCount++;
        } catch (e) {
          _logger.warning(
              'Failed to prepare bulk notification for user $userId: $e');
        }
      }

      await batch.commit();

      // 送信処理は別途実装
      _logger.info('Created $successCount bulk notifications');
      return Result.success(null);
    } catch (e) {
      _logger.severe('Failed to send bulk notifications: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to send bulk notifications: $e'));
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> getNotificationStats({
    String? userId,
    DateTime? startDate,
    DateTime? endDate,
    NotificationType? type,
  }) async {
    try {
      Query query = _notificationsCollection;

      if (userId != null) {
        query = query.where('userId', isEqualTo: userId);
      }

      if (type != null) {
        query = query.where('type', isEqualTo: type.name);
      }

      if (startDate != null) {
        query = query.where('createdAt',
            isGreaterThanOrEqualTo: startDate.toIso8601String());
      }

      if (endDate != null) {
        query = query.where('createdAt',
            isLessThanOrEqualTo: endDate.toIso8601String());
      }

      final querySnapshot = await query.get();
      final notifications = querySnapshot.docs
          .map((doc) =>
              AppNotification.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();

      final stats = {
        'total': notifications.length,
        'read': notifications.where((n) => n.isRead).length,
        'unread': notifications.where((n) => !n.isRead).length,
        'sent': notifications.where((n) => n.isSent).length,
        'scheduled': notifications.where((n) => n.isScheduled).length,
        'byType': <String, int>{},
        'byPriority': <String, int>{},
      };

      // 種別ごとの統計
      for (final notification in notifications) {
        final typeStats = stats['byType'] as Map<String, dynamic>? ?? {};
        final priorityStats =
            stats['byPriority'] as Map<String, dynamic>? ?? {};

        typeStats[notification.type.name] =
            (typeStats[notification.type.name] as int? ?? 0) + 1;
        priorityStats[notification.priority.name] =
            (priorityStats[notification.priority.name] as int? ?? 0) + 1;

        stats['byType'] = typeStats;
        stats['byPriority'] = priorityStats;
      }

      return Result.success(stats);
    } catch (e) {
      _logger.severe('Failed to get notification stats: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to get notification stats: $e'));
    }
  }

  @override
  Future<Result<AppNotification>> createFromTemplate({
    required String templateId,
    required String userId,
    Map<String, String>? variables,
    DateTime? scheduledAt,
  }) async {
    try {
      // テンプレート機能は今回は簡易実装
      // 実際の実装では、別途テンプレートコレクションから取得
      return Result.failure(AppError.unknown(
          message: 'Template notifications not implemented yet'));
    } catch (e) {
      _logger.severe('Failed to create notification from template: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to create from template: $e'));
    }
  }

  /// FCMメッセージを送信
  Future<void> _sendFCMMessage(
      AppNotification notification, String token) async {
    try {
      // FCMメッセージの送信はFCMサービス側で実装
      await _fcmService.sendNotification(
        token: token,
        title: notification.title,
        body: notification.body,
        data: notification.data?.map((k, v) => MapEntry(k, v.toString())) ?? {},
      );

      // 実際のFCM送信は Firebase Admin SDK または REST API を使用
      _logger
          .info('FCM message prepared for token: ${token.substring(0, 20)}...');
    } catch (e) {
      _logger.severe('Failed to send FCM message: $e');
      rethrow;
    }
  }
}
