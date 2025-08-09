import '../entities/mobile_payment_config.dart';
import '../../../../core/error/result.dart';

/// モバイル決済リポジトリインターフェース
abstract class MobilePaymentRepository {
  /// Apple Pay利用可能性チェック
  Future<Result<bool>> isApplePaySupported();

  /// Google Pay利用可能性チェック
  Future<Result<bool>> isGooglePaySupported();

  /// Apple Pay決済実行
  Future<Result<MobilePaymentResult>> processApplePayPayment({
    required ApplePayConfig config,
    required List<PaymentItem> paymentItems,
    String? currencyCode,
    String? countryCode,
  });

  /// Google Pay決済実行
  Future<Result<MobilePaymentResult>> processGooglePayPayment({
    required GooglePayConfig config,
    required List<PaymentItem> paymentItems,
    String? currencyCode,
    String? countryCode,
  });

  /// 決済方法の利用可能性確認
  Future<Result<Map<PaymentMethodType, bool>>> checkPaymentMethodAvailability();

  /// デバイスの決済設定確認
  Future<Result<bool>> isPaymentSetupCompleted(PaymentMethodType type);

  /// 決済設定画面への遷移
  Future<Result<void>> openPaymentSetup(PaymentMethodType type);

  /// 決済トークンの検証
  Future<Result<bool>> validatePaymentToken({
    required String token,
    required PaymentMethodType type,
  });

  /// 決済設定の更新
  Future<Result<void>> updatePaymentConfiguration(MobilePaymentConfig config);

  /// 決済履歴の取得
  Future<Result<List<MobilePaymentResult>>> getPaymentHistory({
    DateTime? startDate,
    DateTime? endDate,
    int limit = 50,
  });

  /// 決済の詳細情報取得
  Future<Result<Map<String, dynamic>>> getPaymentDetails(String paymentId);

  /// 決済のキャンセル（可能な場合）
  Future<Result<void>> cancelPayment(String paymentId);

  /// 返金処理（可能な場合）
  Future<Result<void>> refundPayment({
    required String paymentId,
    String? amount,
    String? reason,
  });

  /// 決済状態の監視
  Stream<PaymentStatus> watchPaymentStatus(String paymentId);

  /// エラーハンドリング
  MobilePaymentError handlePaymentError(dynamic error);
}

/// 決済状態
enum PaymentStatus {
  pending,
  processing,
  succeeded,
  failed,
  cancelled,
  refunded,
}

extension PaymentStatusExtension on PaymentStatus {
  String get displayName {
    switch (this) {
      case PaymentStatus.pending:
        return '処理待ち';
      case PaymentStatus.processing:
        return '処理中';
      case PaymentStatus.succeeded:
        return '成功';
      case PaymentStatus.failed:
        return '失敗';
      case PaymentStatus.cancelled:
        return 'キャンセル';
      case PaymentStatus.refunded:
        return '返金済み';
    }
  }

  bool get isCompleted =>
      this == PaymentStatus.succeeded ||
      this == PaymentStatus.failed ||
      this == PaymentStatus.cancelled ||
      this == PaymentStatus.refunded;

  bool get isSuccessful => this == PaymentStatus.succeeded;

  bool get isFailed =>
      this == PaymentStatus.failed || this == PaymentStatus.cancelled;
}
