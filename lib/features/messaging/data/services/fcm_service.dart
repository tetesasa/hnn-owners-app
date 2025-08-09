// ignore_for_file: unused_local_variable

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import '../../../../core/navigation/navigation_service.dart';

class FCMService {
  static final Logger _logger = Logger('FCMService');
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // シングルトン実装
  static final FCMService _instance = FCMService._internal();
  factory FCMService() => _instance;
  FCMService._internal();

  bool _initialized = false;

  /// FCMサービスの初期化
  Future<void> initialize() async {
    if (_initialized) return;

    try {
      // 通知権限のリクエスト
      final settings = await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      _logger.info('FCM permission status: ${settings.authorizationStatus}');

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        await _setupNotificationHandlers();
        _initialized = true;
        _logger.info('FCM service initialized successfully');
      } else {
        _logger.warning('FCM permission denied');
      }
    } catch (e) {
      _logger.severe('Failed to initialize FCM service: $e');
      rethrow;
    }
  }

  /// FCMトークンの取得
  Future<String?> getToken() async {
    try {
      final token = await _firebaseMessaging.getToken();
      _logger.info('FCM token obtained: ${token?.substring(0, 20)}...');
      return token;
    } catch (e) {
      _logger.severe('Failed to get FCM token: $e');
      return null;
    }
  }

  /// APNsトークンの取得（iOS用）
  Future<String?> getAPNSToken() async {
    if (!defaultTargetPlatform.toString().contains('ios')) return null;

    try {
      final token = await _firebaseMessaging.getAPNSToken();
      _logger.info('APNS token obtained: ${token?.substring(0, 20)}...');
      return token;
    } catch (e) {
      _logger.severe('Failed to get APNS token: $e');
      return null;
    }
  }

  /// トークンリフレッシュの監視
  Stream<String> onTokenRefresh() {
    return _firebaseMessaging.onTokenRefresh;
  }

  /// 通知チャンネルの設定（Android用）
  Future<void> setupNotificationChannels() async {
    if (!defaultTargetPlatform.toString().contains('android')) return;

    final channels = [
      _createNotificationChannel(
        id: 'booking_notifications',
        name: '予約通知',
        description: '予約の確定・リマインダー・完了通知',
        importance: AndroidNotificationImportance.high,
      ),
      _createNotificationChannel(
        id: 'message_notifications',
        name: 'メッセージ通知',
        description: 'シッターからのメッセージ通知',
        importance: AndroidNotificationImportance.high,
      ),
      _createNotificationChannel(
        id: 'payment_notifications',
        name: '決済通知',
        description: '決済完了・失敗の通知',
        importance: AndroidNotificationImportance.high,
      ),
      _createNotificationChannel(
        id: 'system_notifications',
        name: 'システム通知',
        description: 'メンテナンス・重要なお知らせ',
        importance: AndroidNotificationImportance.defaultImportance,
      ),
      _createNotificationChannel(
        id: 'general_notifications',
        name: '一般通知',
        description: '一般的なお知らせ',
        importance: AndroidNotificationImportance.low,
      ),
    ];

    for (final channel in channels) {
      await _setupAndroidChannel(channel);
    }

    _logger.info('Notification channels setup completed');
  }

  /// フォアグラウンドでの通知表示設定
  Future<void> setForegroundNotificationPresentationOptions({
    bool alert = true,
    bool badge = true,
    bool sound = true,
  }) async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: alert,
      badge: badge,
      sound: sound,
    );
  }

  /// 特定トピックへの購読
  Future<void> subscribeToTopic(String topic) async {
    try {
      await _firebaseMessaging.subscribeToTopic(topic);
      _logger.info('Subscribed to topic: $topic');
    } catch (e) {
      _logger.severe('Failed to subscribe to topic $topic: $e');
      rethrow;
    }
  }

  /// 特定トピックからの購読解除
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _firebaseMessaging.unsubscribeFromTopic(topic);
      _logger.info('Unsubscribed from topic: $topic');
    } catch (e) {
      _logger.severe('Failed to unsubscribe from topic $topic: $e');
      rethrow;
    }
  }

  /// バックグラウンド通知メッセージハンドラーの設定
  static Future<void> backgroundMessageHandler(RemoteMessage message) async {
    _logger.info('Background message received: ${message.messageId}');

    // バックグラウンドでの通知処理
    await _processBackgroundNotification(message);
  }

  /// 通知ハンドラーの設定
  Future<void> _setupNotificationHandlers() async {
    // フォアグラウンドメッセージの処理
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _logger.info('Foreground message received: ${message.messageId}');
      _processForegroundNotification(message);
    });

    // 通知タップによるアプリ起動時の処理
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _logger.info('App opened via notification: ${message.messageId}');
      _processNotificationTap(message);
    });

    // アプリ終了状態からの通知タップによる起動処理
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      _logger
          .info('App launched via notification: ${initialMessage.messageId}');
      _processNotificationTap(initialMessage);
    }

    // バックグラウンドメッセージハンドラーの設定
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

    await setupNotificationChannels();
    await setForegroundNotificationPresentationOptions();
  }

  /// フォアグラウンド通知の処理
  void _processForegroundNotification(RemoteMessage message) {
    final notification = message.notification;
    final data = message.data;

    _logger.info('Processing foreground notification: ${notification?.title}');

    // カスタム通知表示ロジック
    // 実際の実装では、アプリ内通知バナーまたはダイアログを表示
  }

  /// バックグラウンド通知の処理
  static Future<void> _processBackgroundNotification(
      RemoteMessage message) async {
    final notification = message.notification;
    final data = message.data;

    _logger.info('Processing background notification: ${notification?.title}');

    // バックグラウンドでのデータ処理
    // 例：ローカルデータベースの更新、キャッシュの無効化など
  }

  /// 通知タップの処理
  void _processNotificationTap(RemoteMessage message) {
    final data = message.data;

    _logger.info('Processing notification tap with data: $data');

    // 通知タイプに基づく画面遷移
    final notificationType = data['type'];
    final actionUrl = data['actionUrl'];

    switch (notificationType) {
      case 'booking_confirmed':
      case 'booking_reminder':
      case 'service_started':
      case 'service_completed':
        _navigateToBooking(data['booking_id']);
        break;
      case 'message_received':
        _navigateToChat(data['chat_room_id']);
        break;
      case 'payment_success':
      case 'payment_failed':
        _navigateToPaymentHistory();
        break;
      default:
        if (actionUrl != null) {
          _navigateToUrl(actionUrl);
        } else {
          _navigateToHome();
        }
    }
  }

  /// 通知チャンネルの作成（Android用）
  Map<String, dynamic> _createNotificationChannel({
    required String id,
    required String name,
    required String description,
    required AndroidNotificationImportance importance,
  }) {
    return {
      'id': id,
      'name': name,
      'description': description,
      'importance': importance,
      'enableVibration': true,
      'enableLights': true,
      'sound': 'default',
    };
  }

  /// Androidチャンネルのセットアップ
  Future<void> _setupAndroidChannel(Map<String, dynamic> channel) async {
    // 実際の実装では、android_notification_channel プラグインなどを使用
    _logger.info('Setting up Android channel: ${channel['id']}');
  }

  /// 画面遷移メソッド（NavigationServiceと連携）
  void _navigateToBooking(String? bookingId) {
    if (bookingId != null) {
      NavigationService().navigateToBooking(bookingId);
      _logger.info('Navigate to booking: $bookingId');
    }
  }

  void _navigateToChat(String? chatRoomId) {
    if (chatRoomId != null) {
      NavigationService().navigateToChat(chatRoomId);
      _logger.info('Navigate to chat: $chatRoomId');
    }
  }

  void _navigateToPaymentHistory() {
    NavigationService().navigateToPaymentHistory();
    _logger.info('Navigate to payment history');
  }

  void _navigateToUrl(String url) {
    NavigationService().navigateToUrl(url);
    _logger.info('Navigate to URL: $url');
  }

  void _navigateToHome() {
    NavigationService().navigateToHome();
    _logger.info('Navigate to home');
  }

  /// FCMサービスの状態確認
  bool get isInitialized => _initialized;

  /// 通知権限の確認
  Future<bool> hasPermission() async {
    final settings = await _firebaseMessaging.getNotificationSettings();
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  /// 通知設定画面への遷移（iOS用）
  Future<void> openNotificationSettings() async {
    await _firebaseMessaging.requestPermission();
  }

  /// 通知送信（実際にはサーバーサイドで実装される）
  Future<void> sendNotification({
    required String token,
    required String title,
    required String body,
    Map<String, String>? data,
  }) async {
    // このメソッドは実際にはサーバーサイドのAPI経由で実装される
    // クライアントサイドでは送信ログのみ出力
    _logger.info(
        'Notification send requested: $title to token: ${token.substring(0, 20)}...');
  }
}

/// Androidの通知重要度
enum AndroidNotificationImportance {
  none,
  min,
  low,
  defaultImportance,
  high,
  max,
}

/// FCM初期化用のヘルパークラス
class FCMInitializer {
  static bool _initialized = false;

  /// アプリ起動時のFCM初期化
  static Future<void> initialize() async {
    if (_initialized) return;

    try {
      final fcmService = FCMService();
      await fcmService.initialize();

      // 基本トピックへの購読
      await fcmService.subscribeToTopic('all_users');
      await fcmService.subscribeToTopic('owner_users');

      _initialized = true;
      Logger('FCMInitializer').info('FCM initialization completed');
    } catch (e) {
      Logger('FCMInitializer').severe('FCM initialization failed: $e');
      rethrow;
    }
  }

  static bool get isInitialized => _initialized;
}
