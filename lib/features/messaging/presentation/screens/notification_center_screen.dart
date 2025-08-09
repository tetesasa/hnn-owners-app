import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/notification.dart';
import '../../application/providers/notification_providers.dart';
import '../widgets/notification_list_tile.dart';
import '../widgets/notification_filter_chips.dart';

class NotificationCenterScreen extends ConsumerStatefulWidget {
  final String userId;

  const NotificationCenterScreen({
    super.key,
    required this.userId,
  });

  @override
  ConsumerState<NotificationCenterScreen> createState() =>
      _NotificationCenterScreenState();
}

class _NotificationCenterScreenState
    extends ConsumerState<NotificationCenterScreen> {
  NotificationType? _selectedType;
  bool? _selectedReadStatus;

  @override
  Widget build(BuildContext context) {
    final notificationsAsync =
        ref.watch(notificationListProvider(widget.userId));
    final unreadCountAsync =
        ref.watch(unreadNotificationCountProvider(widget.userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('通知センター'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          // 全て既読にする
          IconButton(
            icon: const Icon(Icons.done_all),
            onPressed: () => _markAllAsRead(),
            tooltip: '全て既読にする',
          ),
          // 通知設定
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () =>
                context.push('/notification-settings?userId=${widget.userId}'),
            tooltip: '通知設定',
          ),
        ],
      ),
      body: Column(
        children: [
          // 未読数表示
          unreadCountAsync.when(
            data: (count) => count > 0
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                    child: Text(
                      '$count件の未読通知があります',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),

          // フィルター
          Padding(
            padding: const EdgeInsets.all(16),
            child: NotificationFilterChips(
              selectedType: _selectedType,
              selectedReadStatus: _selectedReadStatus,
              onTypeChanged: (type) {
                setState(() {
                  _selectedType = type;
                });
                _applyFilter();
              },
              onReadStatusChanged: (isRead) {
                setState(() {
                  _selectedReadStatus = isRead;
                });
                _applyFilter();
              },
            ),
          ),

          // 通知リスト
          Expanded(
            child: notificationsAsync.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '通知の読み込みに失敗しました',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      error.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _refreshNotifications(),
                      child: const Text('再試行'),
                    ),
                  ],
                ),
              ),
              data: (notifications) => notifications.isEmpty
                  ? _buildEmptyState(context)
                  : RefreshIndicator(
                      onRefresh: () => _refreshNotifications(),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 16),
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          final notification = notifications[index];
                          return Column(
                            children: [
                              NotificationListTile(
                                notification: notification,
                                onTap: () =>
                                    _handleNotificationTap(notification),
                                onMarkAsRead: () =>
                                    _markAsRead(notification.id),
                                onDelete: () =>
                                    _deleteNotification(notification.id),
                              ),
                              if (index < notifications.length - 1)
                                const Divider(height: 1, indent: 72),
                            ],
                          );
                        },
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    String message;
    IconData icon;

    if (_selectedType != null || _selectedReadStatus != null) {
      message = 'フィルター条件に一致する通知がありません';
      icon = Icons.filter_list_off;
    } else {
      message = 'まだ通知がありません';
      icon = Icons.notifications_none;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
          if (_selectedType != null || _selectedReadStatus != null) ...[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedType = null;
                  _selectedReadStatus = null;
                });
                _applyFilter();
              },
              child: const Text('フィルターをクリア'),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _refreshNotifications() async {
    final notifier = ref.read(notificationListProvider(widget.userId).notifier);
    await notifier.refresh();
    ref.invalidate(unreadNotificationCountProvider(widget.userId));
  }

  void _applyFilter() {
    final notifier = ref.read(notificationListProvider(widget.userId).notifier);
    notifier.filterNotifications(
      type: _selectedType,
      isRead: _selectedReadStatus,
    );
  }

  Future<void> _markAsRead(String notificationId) async {
    final notifier = ref.read(notificationListProvider(widget.userId).notifier);
    await notifier.markAsRead(notificationId);
    ref.invalidate(unreadNotificationCountProvider(widget.userId));
  }

  Future<void> _markAllAsRead() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('確認'),
        content: const Text('全ての通知を既読にしますか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('キャンセル'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('既読にする'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final notifier =
          ref.read(notificationListProvider(widget.userId).notifier);
      await notifier.markAllAsRead();
      ref.invalidate(unreadNotificationCountProvider(widget.userId));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('全ての通知を既読にしました'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  Future<void> _deleteNotification(String notificationId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('確認'),
        content: const Text('この通知を削除しますか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('キャンセル'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('削除'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final notifier =
          ref.read(notificationListProvider(widget.userId).notifier);
      await notifier.deleteNotification(notificationId);
      ref.invalidate(unreadNotificationCountProvider(widget.userId));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('通知を削除しました'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  void _handleNotificationTap(AppNotification notification) {
    // 通知を既読にする
    if (!notification.isRead) {
      _markAsRead(notification.id);
    }

    // アクションURLがある場合は遷移
    if (notification.actionUrl != null) {
      context.push(notification.actionUrl!);
      return;
    }

    // 通知種別に応じた画面遷移
    switch (notification.type) {
      case NotificationType.bookingConfirmed:
      case NotificationType.bookingReminder:
      case NotificationType.serviceStarted:
      case NotificationType.serviceCompleted:
        if (notification.data != null &&
            notification.data!['booking_id'] != null) {
          context.push('/booking/${notification.data!['booking_id']}');
        }
        break;
      case NotificationType.messageReceived:
        if (notification.data != null &&
            notification.data!['chat_room_id'] != null) {
          context.push('/chat/${notification.data!['chat_room_id']}');
        }
        break;
      case NotificationType.paymentSuccess:
      case NotificationType.paymentFailed:
        context.push('/payment-history');
        break;
      default:
        // 詳細表示画面を作成する場合はここに追加
        break;
    }
  }
}
