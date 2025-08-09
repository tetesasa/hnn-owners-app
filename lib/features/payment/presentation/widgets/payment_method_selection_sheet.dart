import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/mobile_payment_config.dart';
import '../../application/providers/mobile_payment_providers.dart';
import 'mobile_payment_button.dart';

/// 決済方法選択ボトムシート
class PaymentMethodSelectionSheet extends ConsumerWidget {
  final List<PaymentItem> paymentItems;
  final String totalAmount;
  final VoidCallback? onPaymentCompleted;
  final ValueChanged<MobilePaymentError>? onPaymentError;

  const PaymentMethodSelectionSheet({
    super.key,
    required this.paymentItems,
    required this.totalAmount,
    this.onPaymentCompleted,
    this.onPaymentError,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availability = ref.watch(paymentMethodAvailabilityProvider);
    final deviceCapabilities = ref.watch(devicePaymentCapabilitiesProvider);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ハンドル
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // タイトル
          Text(
            '決済方法を選択',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),

          // 合計金額
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '合計',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '¥$totalAmount',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 決済方法ボタンリスト
          availability.when(
            data: (methods) =>
                _buildPaymentMethods(context, methods, deviceCapabilities),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => _buildErrorState(context, error),
          ),

          const SizedBox(height: 16),

          // キャンセルボタン
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('キャンセル'),
            ),
          ),

          // 安全な決済に関するフッター
          const SizedBox(height: 8),
          _buildSecurityFooter(context),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods(
    BuildContext context,
    Map<PaymentMethodType, bool> methods,
    AsyncValue<DevicePaymentCapabilities> capabilitiesAsync,
  ) {
    return capabilitiesAsync.when(
      data: (capabilities) {
        final availableMethods = methods.entries
            .where((entry) => entry.value)
            .map((entry) => entry.key)
            .toList();

        if (availableMethods.isEmpty) {
          return _buildNoPaymentMethodsAvailable(context);
        }

        return Column(
          children: availableMethods.map((method) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildPaymentMethodTile(context, method, capabilities),
            );
          }).toList(),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => _buildErrorState(context, error),
    );
  }

  Widget _buildPaymentMethodTile(
    BuildContext context,
    PaymentMethodType method,
    DevicePaymentCapabilities capabilities,
  ) {
    switch (method) {
      case PaymentMethodType.applePay:
        return ApplePayButton(
          paymentItems: paymentItems,
          onPaymentCompleted: () {
            Navigator.of(context).pop();
            onPaymentCompleted?.call();
          },
          onPaymentError: (error) {
            Navigator.of(context).pop();
            onPaymentError?.call(error);
          },
          width: double.infinity,
          height: 56,
        );

      case PaymentMethodType.googlePay:
        return GooglePayButton(
          paymentItems: paymentItems,
          onPaymentCompleted: () {
            Navigator.of(context).pop();
            onPaymentCompleted?.call();
          },
          onPaymentError: (error) {
            Navigator.of(context).pop();
            onPaymentError?.call(error);
          },
          width: double.infinity,
          height: 56,
        );

      case PaymentMethodType.creditCard:
        return SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: () => _handleCreditCardPayment(context),
            icon: const Icon(Icons.credit_card),
            label: const Text('クレジットカード'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
    }
  }

  Widget _buildNoPaymentMethodsAvailable(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange[300]!),
        borderRadius: BorderRadius.circular(8),
        color: Colors.orange[50],
      ),
      child: Column(
        children: [
          Icon(
            Icons.warning,
            color: Colors.orange[600],
            size: 48,
          ),
          const SizedBox(height: 12),
          Text(
            '利用可能な決済方法がありません',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Apple PayやGoogle Payの設定を確認してください',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.orange[700],
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _showPaymentSetupHelp(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange[600],
              foregroundColor: Colors.white,
            ),
            child: const Text('設定方法を確認'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, dynamic error) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red[300]!),
        borderRadius: BorderRadius.circular(8),
        color: Colors.red[50],
      ),
      child: Column(
        children: [
          Icon(
            Icons.error,
            color: Colors.red[600],
            size: 48,
          ),
          const SizedBox(height: 12),
          Text(
            '決済方法の確認中にエラーが発生しました',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.red[800],
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.red[700],
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.green[200]!),
      ),
      child: Row(
        children: [
          Icon(
            Icons.security,
            size: 16,
            color: Colors.green[700],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'SSL暗号化通信により、お支払い情報は安全に保護されます',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.green[700],
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleCreditCardPayment(BuildContext context) {
    Navigator.of(context).pop();

    // クレジットカード決済画面への遷移
    // 実際の実装では、既存の payment_screen.dart に遷移
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('クレジットカード決済画面に移動します'),
      ),
    );
  }

  void _showPaymentSetupHelp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('決済方法の設定'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('以下の手順で決済方法を設定してください：'),
              const SizedBox(height: 16),
              const Text(
                'Apple Payの設定:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('1. 設定 > ウォレットとApple Pay'),
              const Text('2. カードを追加'),
              const Text('3. 画面の指示に従ってカード情報を入力'),
              const SizedBox(height: 12),
              const Text(
                'Google Payの設定:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('1. Google Payアプリを開く'),
              const Text('2. 支払い方法を追加'),
              const Text('3. カード情報を入力'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('閉じる'),
          ),
        ],
      ),
    );
  }

  /// ボトムシートを表示する静的メソッド
  static Future<void> show(
    BuildContext context, {
    required List<PaymentItem> paymentItems,
    required String totalAmount,
    VoidCallback? onPaymentCompleted,
    ValueChanged<MobilePaymentError>? onPaymentError,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PaymentMethodSelectionSheet(
        paymentItems: paymentItems,
        totalAmount: totalAmount,
        onPaymentCompleted: onPaymentCompleted,
        onPaymentError: onPaymentError,
      ),
    );
  }
}
