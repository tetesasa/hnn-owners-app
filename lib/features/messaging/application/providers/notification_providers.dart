import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

import '../../domain/entities/notification.dart';
import '../../domain/repositories/notification_repository.dart';
import '../../data/repositories/firestore_notification_repository.dart';
import '../../data/services/fcm_service.dart';
import '../../../../core/error/result.dart';

/// NotificationRepositoryプロバイダー
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return FirestoreNotificationRepository();
});

/// FCMサービスプロバイダー
final fcmServiceProvider = Provider<FCMService>((ref) {
  return FCMService();
});

/// 通知リストプロバイダー
final notificationListProvider = StateNotifierProvider.family<
    NotificationListNotifier, AsyncValue<List<AppNotification>>, String>(
  (ref, userId) {
    final repository = ref.watch(notificationRepositoryProvider);
    return NotificationListNotifier(repository, userId);
  },
);

/// 未読通知数プロバイダー
final unreadNotificationCountProvider =
    FutureProvider.family<int, String>((ref, userId) async {
  final repository = ref.watch(notificationRepositoryProvider);
  final result = await repository.getUnreadNotificationCount(userId);

  if (result.isSuccess) {
    return result.data!;
  }

  throw result.error!;
});

/// 通知設定プロバイダー
final notificationSettingsProvider = StateNotifierProvider.family<
    NotificationSettingsNotifier, AsyncValue<NotificationSettings>, String>(
  (ref, userId) {
    final repository = ref.watch(notificationRepositoryProvider);
    return NotificationSettingsNotifier(repository, userId);
  },
);

/// FCM初期化プロバイダー
final fcmInitializationProvider = FutureProvider<bool>((ref) async {
  final fcmService = ref.watch(fcmServiceProvider);
  try {
    await fcmService.initialize();
    return fcmService.isInitialized;
  } catch (e) {
    Logger('FCMInitialization').severe('Failed to initialize FCM: $e');
    return false;
  }
});

/// 通知リスト管理NotificationController
class NotificationListNotifier
    extends StateNotifier<AsyncValue<List<AppNotification>>> {
  final NotificationRepository _repository;
  final String _userId;
  static final Logger _logger = Logger('NotificationListNotifier');

  NotificationListNotifier(this._repository, this._userId)
      : super(const AsyncValue.loading()) {
    loadNotifications();
  }

  /// 通知リストを読み込み
  Future<void> loadNotifications({
    NotificationType? type,
    bool? isRead,
    int limit = 20,
  }) async {
    try {
      state = const AsyncValue.loading();

      final result = await _repository.getUserNotifications(
        userId: _userId,
        type: type,
        isRead: isRead,
        limit: limit,
      );

      if (result.isSuccess) {
        state = AsyncValue.data(result.data!);
      } else {
        state = AsyncValue.error(result.error!, StackTrace.current);
      }
    } catch (e, stackTrace) {
      _logger.severe('Failed to load notifications: $e');
      state = AsyncValue.error(e, stackTrace);
    }
  }

  /// 通知を既読にする
  Future<void> markAsRead(String notificationId) async {
    try {
      final result = await _repository.markAsRead(notificationId);

      if (result.isSuccess) {
        // ローカル状態を更新
        state.whenData((notifications) {
          final updatedNotifications = notifications.map((notification) {
            if (notification.id == notificationId) {
              return notification.copyWith(
                isRead: true,
                readAt: DateTime.now(),
              );
            }
            return notification;
          }).toList();

          state = AsyncValue.data(updatedNotifications);
        });

        _logger.info('Marked notification as read: $notificationId');
      } else {
        _logger.severe('Failed to mark notification as read: ${result.error}');
      }
    } catch (e) {
      _logger.severe('Error marking notification as read: $e');
    }
  }

  /// 全ての通知を既読にする
  Future<void> markAllAsRead() async {
    try {
      final result = await _repository.markAllAsRead(_userId);

      if (result.isSuccess) {
        // ローカル状態を更新
        state.whenData((notifications) {
          final updatedNotifications = notifications.map((notification) {
            return notification.copyWith(
              isRead: true,
              readAt: DateTime.now(),
            );
          }).toList();

          state = AsyncValue.data(updatedNotifications);
        });

        _logger.info('Marked all notifications as read for user: $_userId');
      } else {
        _logger.severe(
            'Failed to mark all notifications as read: ${result.error}');
      }
    } catch (e) {
      _logger.severe('Error marking all notifications as read: $e');
    }
  }

  /// 通知を削除
  Future<void> deleteNotification(String notificationId) async {
    try {
      final result = await _repository.deleteNotification(notificationId);

      if (result.isSuccess) {
        // ローカル状態を更新
        state.whenData((notifications) {
          final updatedNotifications = notifications
              .where((notification) => notification.id != notificationId)
              .toList();

          state = AsyncValue.data(updatedNotifications);
        });

        _logger.info('Deleted notification: $notificationId');
      } else {
        _logger.severe('Failed to delete notification: ${result.error}');
      }
    } catch (e) {
      _logger.severe('Error deleting notification: $e');
    }
  }

  /// 通知フィルター更新
  Future<void> filterNotifications({
    NotificationType? type,
    bool? isRead,
  }) async {
    await loadNotifications(type: type, isRead: isRead);
  }

  /// リフレッシュ
  Future<void> refresh() async {
    await loadNotifications();
  }
}

/// 通知設定管理NotificationController
class NotificationSettingsNotifier
    extends StateNotifier<AsyncValue<NotificationSettings>> {
  final NotificationRepository _repository;
  final String _userId;
  static final Logger _logger = Logger('NotificationSettingsNotifier');

  NotificationSettingsNotifier(this._repository, this._userId)
      : super(const AsyncValue.loading()) {
    loadSettings();
  }

  /// 設定を読み込み
  Future<void> loadSettings() async {
    try {
      state = const AsyncValue.loading();

      final result = await _repository.getNotificationSettings(_userId);

      if (result.isSuccess) {
        state = AsyncValue.data(result.data!);
      } else {
        state = AsyncValue.error(result.error!, StackTrace.current);
      }
    } catch (e, stackTrace) {
      _logger.severe('Failed to load notification settings: $e');
      state = AsyncValue.error(e, stackTrace);
    }
  }

  /// 通知設定を更新
  Future<void> updateSettings({
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
      final result = await _repository.updateNotificationSettings(
        userId: _userId,
        enabled: enabled,
        bookingNotifications: bookingNotifications,
        paymentNotifications: paymentNotifications,
        messageNotifications: messageNotifications,
        marketingNotifications: marketingNotifications,
        soundEnabled: soundEnabled,
        vibrationEnabled: vibrationEnabled,
        soundType: soundType,
        quietHours: quietHours,
      );

      if (result.isSuccess) {
        state = AsyncValue.data(result.data!);
        _logger.info('Updated notification settings for user: $_userId');
      } else {
        _logger
            .severe('Failed to update notification settings: ${result.error}');
        throw result.error!;
      }
    } catch (e) {
      _logger.severe('Error updating notification settings: $e');
      rethrow;
    }
  }

  /// FCMトークンを登録
  Future<void> registerFCMToken(String token, {String? deviceType}) async {
    try {
      final result = await _repository.registerFCMToken(
        userId: _userId,
        token: token,
        deviceType: deviceType,
      );

      if (result.isSuccess) {
        _logger.info('Registered FCM token for user: $_userId');
        // 設定を再読み込み
        await loadSettings();
      } else {
        _logger.severe('Failed to register FCM token: ${result.error}');
      }
    } catch (e) {
      _logger.severe('Error registering FCM token: $e');
    }
  }

  /// FCMトークンを解除
  Future<void> unregisterFCMToken(String token) async {
    try {
      final result = await _repository.unregisterFCMToken(
        userId: _userId,
        token: token,
      );

      if (result.isSuccess) {
        _logger.info('Unregistered FCM token for user: $_userId');
        // 設定を再読み込み
        await loadSettings();
      } else {
        _logger.severe('Failed to unregister FCM token: ${result.error}');
      }
    } catch (e) {
      _logger.severe('Error unregistering FCM token: $e');
    }
  }
}

/// 即座に通知を送信するプロバイダー
final sendImmediateNotificationProvider =
    FutureProvider.family<void, SendNotificationParams>((ref, params) async {
  final repository = ref.watch(notificationRepositoryProvider);

  final result = await repository.sendImmediateNotification(
    userId: params.userId,
    type: params.type,
    title: params.title,
    body: params.body,
    data: params.data,
    imageUrl: params.imageUrl,
    priority: params.priority,
  );

  if (result.isFailure) {
    throw result.error!;
  }
});

/// 通知送信パラメータ
class SendNotificationParams {
  final String userId;
  final NotificationType type;
  final String title;
  final String body;
  final Map<String, dynamic>? data;
  final String? imageUrl;
  final NotificationPriority priority;

  const SendNotificationParams({
    required this.userId,
    required this.type,
    required this.title,
    required this.body,
    this.data,
    this.imageUrl,
    this.priority = NotificationPriority.normal,
  });
}
