import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

/// アプリケーション全体のナビゲーション管理サービス
class NavigationService {
  static final Logger _logger = Logger('NavigationService');
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// シングルトン実装
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;
  NavigationService._internal();

  /// 現在のコンテキスト
  BuildContext? get currentContext => navigatorKey.currentContext;

  /// 現在のGoRouterのコンテキスト
  GoRouter? get goRouter =>
      currentContext != null ? GoRouter.of(currentContext!) : null;

  /// 基本的な画面遷移
  Future<void> navigateTo(String route, {Object? extra}) async {
    try {
      if (currentContext == null) {
        _logger
            .warning('Navigation context is null, cannot navigate to: $route');
        return;
      }

      currentContext!.go(route, extra: extra);
      _logger.info('Navigated to: $route');
    } catch (e) {
      _logger.severe('Failed to navigate to $route: $e');
    }
  }

  /// スタックにプッシュ
  Future<void> pushTo(String route, {Object? extra}) async {
    try {
      if (currentContext == null) {
        _logger.warning('Navigation context is null, cannot push to: $route');
        return;
      }

      currentContext!.push(route, extra: extra);
      _logger.info('Pushed to: $route');
    } catch (e) {
      _logger.severe('Failed to push to $route: $e');
    }
  }

  /// 現在の画面を置換
  Future<void> replaceWith(String route, {Object? extra}) async {
    try {
      if (currentContext == null) {
        _logger
            .warning('Navigation context is null, cannot replace with: $route');
        return;
      }

      currentContext!.pushReplacement(route, extra: extra);
      _logger.info('Replaced with: $route');
    } catch (e) {
      _logger.severe('Failed to replace with $route: $e');
    }
  }

  /// 戻る
  void goBack() {
    try {
      if (currentContext == null) {
        _logger.warning('Navigation context is null, cannot go back');
        return;
      }

      if (currentContext!.canPop()) {
        currentContext!.pop();
        _logger.info('Navigated back');
      } else {
        _logger.warning('Cannot go back, no routes in stack');
      }
    } catch (e) {
      _logger.severe('Failed to go back: $e');
    }
  }

  /// 特定の予約詳細画面への遷移
  Future<void> navigateToBooking(String? bookingId) async {
    if (bookingId == null) {
      _logger.warning('Booking ID is null, cannot navigate to booking');
      return;
    }

    await navigateTo('/booking/$bookingId');
  }

  /// チャット画面への遷移
  Future<void> navigateToChat(String? chatRoomId) async {
    if (chatRoomId == null) {
      _logger.warning('Chat room ID is null, cannot navigate to chat');
      return;
    }

    await navigateTo('/chat/$chatRoomId');
  }

  /// 決済履歴画面への遷移
  Future<void> navigateToPaymentHistory() async {
    await navigateTo('/payment-history');
  }

  /// ホーム画面への遷移
  Future<void> navigateToHome() async {
    await navigateTo('/home');
  }

  /// 通知センター画面への遷移
  Future<void> navigateToNotifications() async {
    await navigateTo('/notifications');
  }

  /// 通知設定画面への遷移
  Future<void> navigateToNotificationSettings() async {
    await navigateTo('/notification-settings');
  }

  /// プロフィール画面への遷移
  Future<void> navigateToProfile() async {
    await navigateTo('/profile');
  }

  /// 外部URLを開く（ブラウザまたはアプリ内WebView）
  Future<void> navigateToUrl(String url) async {
    try {
      _logger.info('Navigate to URL: $url');
      // 実際の実装では url_launcher パッケージを使用
      // await launchUrl(Uri.parse(url));
    } catch (e) {
      _logger.severe('Failed to navigate to URL $url: $e');
    }
  }

  /// ルート情報の取得
  String? getCurrentRoute() {
    try {
      if (currentContext == null) return null;

      final goRouter = GoRouter.of(currentContext!);
      final location =
          goRouter.routerDelegate.currentConfiguration.uri.toString();
      return location;
    } catch (e) {
      _logger.warning('Failed to get current route: $e');
      return null;
    }
  }

  /// 認証が必要な画面かチェック
  bool isAuthenticatedRoute(String route) {
    const publicRoutes = ['/', '/login', '/register'];
    return !publicRoutes.contains(route);
  }

  /// ログアウト時のナビゲーション
  Future<void> navigateToLogin({bool clearStack = true}) async {
    if (clearStack) {
      await navigateTo('/login');
    } else {
      await pushTo('/login');
    }
  }

  /// エラー画面への遷移
  Future<void> navigateToError({String? message}) async {
    await pushTo('/error', extra: {'message': message});
  }

  /// デバッグ用：現在のナビゲーションスタックを出力
  void logNavigationStack() {
    try {
      final currentRoute = getCurrentRoute();
      _logger.info('Current route: $currentRoute');

      if (currentContext != null) {
        final router = GoRouter.of(currentContext!);
        _logger.info(
            'GoRouter state: ${router.routerDelegate.currentConfiguration}');
      }
    } catch (e) {
      _logger.warning('Failed to log navigation stack: $e');
    }
  }
}

/// ナビゲーション関連のユーティリティ拡張
extension NavigationExtensions on BuildContext {
  NavigationService get navigation => NavigationService();

  /// 簡易ナビゲーション
  Future<void> goTo(String route) async {
    await navigation.navigateTo(route);
  }

  /// 簡易プッシュ
  Future<void> pushTo(String route) async {
    await navigation.pushTo(route);
  }
}
