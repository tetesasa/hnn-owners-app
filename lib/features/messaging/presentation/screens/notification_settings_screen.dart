import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/notification.dart';
import '../../application/providers/notification_providers.dart';
import '../widgets/notification_time_picker.dart';
import '../widgets/notification_switch_tile.dart';
import '../widgets/sound_selection_tile.dart';

class NotificationSettingsScreen extends ConsumerWidget {
  final String userId;

  const NotificationSettingsScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(notificationSettingsProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('通知設定'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: settingsAsync.when(
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
                '設定の読み込みに失敗しました',
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
                onPressed: () =>
                    ref.refresh(notificationSettingsProvider(userId)),
                child: const Text('再試行'),
              ),
            ],
          ),
        ),
        data: (settings) => _buildSettingsContent(context, ref, settings),
      ),
    );
  }

  Widget _buildSettingsContent(
    BuildContext context,
    WidgetRef ref,
    NotificationSettings settings,
  ) {
    final notifier = ref.read(notificationSettingsProvider(userId).notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 全般設定
          _buildSectionHeader(context, '全般設定'),
          Card(
            child: Column(
              children: [
                NotificationSwitchTile(
                  title: 'プッシュ通知',
                  subtitle: '全ての通知を受け取る',
                  value: settings.enabled,
                  onChanged: (value) => notifier.updateSettings(enabled: value),
                  icon: Icons.notifications,
                ),
                if (settings.enabled) ...[
                  const Divider(height: 1),
                  SoundSelectionTile(
                    title: '通知音',
                    subtitle: settings.soundEnabled ? settings.soundType : 'オフ',
                    soundType: settings.soundType,
                    soundEnabled: settings.soundEnabled,
                    onSoundEnabledChanged: (value) =>
                        notifier.updateSettings(soundEnabled: value),
                    onSoundTypeChanged: (soundType) =>
                        notifier.updateSettings(soundType: soundType),
                  ),
                  const Divider(height: 1),
                  NotificationSwitchTile(
                    title: 'バイブレーション',
                    subtitle: 'デバイスを振動させる',
                    value: settings.vibrationEnabled,
                    onChanged: (value) =>
                        notifier.updateSettings(vibrationEnabled: value),
                    icon: Icons.vibration,
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 24),

          // 通知種別設定
          if (settings.enabled) ...[
            _buildSectionHeader(context, '通知種別'),
            Card(
              child: Column(
                children: [
                  NotificationSwitchTile(
                    title: '予約通知',
                    subtitle: '予約確定・リマインダー・完了通知',
                    value: settings.bookingNotifications,
                    onChanged: (value) =>
                        notifier.updateSettings(bookingNotifications: value),
                    icon: Icons.calendar_today,
                  ),
                  const Divider(height: 1),
                  NotificationSwitchTile(
                    title: '決済通知',
                    subtitle: '決済完了・失敗の通知',
                    value: settings.paymentNotifications,
                    onChanged: (value) =>
                        notifier.updateSettings(paymentNotifications: value),
                    icon: Icons.payment,
                  ),
                  const Divider(height: 1),
                  NotificationSwitchTile(
                    title: 'メッセージ通知',
                    subtitle: 'シッターからのメッセージ受信通知',
                    value: settings.messageNotifications,
                    onChanged: (value) =>
                        notifier.updateSettings(messageNotifications: value),
                    icon: Icons.message,
                  ),
                  const Divider(height: 1),
                  NotificationSwitchTile(
                    title: 'マーケティング通知',
                    subtitle: 'キャンペーン・お知らせ',
                    value: settings.marketingNotifications,
                    onChanged: (value) =>
                        notifier.updateSettings(marketingNotifications: value),
                    icon: Icons.campaign,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 静寂時間設定
            _buildSectionHeader(context, '静寂時間'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.bedtime),
                        const SizedBox(width: 12),
                        Text(
                          '静寂時間',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '指定した時間帯は通知音とバイブレーションをオフにします',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                          ),
                    ),
                    const SizedBox(height: 16),
                    NotificationTimePicker(
                      quietHours: settings.quietHours,
                      onChanged: (quietHours) =>
                          notifier.updateSettings(quietHours: quietHours),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // FCMトークン情報（デバッグ用）
            if (settings.fcmTokens != null &&
                settings.fcmTokens!.isNotEmpty) ...[
              _buildSectionHeader(context, '登録デバイス'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.devices),
                          const SizedBox(width: 12),
                          Text(
                            '登録済みデバイス',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${settings.fcmTokens!.length}台のデバイスが登録されています',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],

          const SizedBox(height: 32),

          // テスト通知送信ボタン
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _sendTestNotification(context, ref),
              icon: const Icon(Icons.send),
              label: const Text('テスト通知を送信'),
            ),
          ),

          const SizedBox(height: 16),

          // 通知許可設定へのリンク
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              onPressed: () => _openSystemNotificationSettings(context, ref),
              icon: const Icon(Icons.settings),
              label: const Text('システムの通知設定を開く'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Future<void> _sendTestNotification(
      BuildContext context, WidgetRef ref) async {
    try {
      final params = SendNotificationParams(
        userId: userId,
        type: NotificationType.general,
        title: 'テスト通知',
        body: '通知設定が正常に動作しています。',
        priority: NotificationPriority.normal,
      );

      await ref.read(sendImmediateNotificationProvider(params).future);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('テスト通知を送信しました'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('テスト通知の送信に失敗しました: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _openSystemNotificationSettings(
      BuildContext context, WidgetRef ref) async {
    try {
      final fcmService = ref.read(fcmServiceProvider);
      await fcmService.openNotificationSettings();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('設定画面を開けませんでした: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
