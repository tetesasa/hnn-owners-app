import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../application/providers/payment_providers.dart';
import '../../application/providers/mobile_payment_providers.dart';
import '../../domain/entities/payment_intent.dart' as domain;
import '../../domain/entities/payment_method.dart' as domain;
import '../../domain/entities/mobile_payment_config.dart';
import '../../domain/usecases/process_payment_usecase.dart';
import '../widgets/payment_card_form.dart';
import '../widgets/payment_method_selector.dart';
import '../widgets/payment_amount_display.dart';
import '../widgets/payment_security_badge.dart';
import '../widgets/payment_method_selection_sheet.dart';
import '../../../../presentation/widgets/common/app_button.dart';
import '../../../../presentation/widgets/common/loading_overlay.dart';
import '../../../../core/theme/app_colors.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  final String bookingId;
  final int amount;
  final String currency;
  final String? customerId;

  const PaymentScreen({
    super.key,
    required this.bookingId,
    required this.amount,
    required this.currency,
    this.customerId,
  });

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  bool _isProcessing = false;
  String? _selectedPaymentMethodId;
  domain.PaymentMethodType _selectedPaymentType = domain.PaymentMethodType.card;

  @override
  void initState() {
    super.initState();
    _initializePayment();
  }

  Future<void> _initializePayment() async {
    if (widget.customerId != null) {
      // 顧客の既存PaymentMethodを読み込み
      ref
          .read(paymentMethodsStateProvider.notifier)
          .loadCustomerPaymentMethods(widget.customerId!);

      // StripeCustomerIDを設定
      ref
          .read(customerStripeIdStateProvider.notifier)
          .setStripeCustomerId(widget.customerId!);
    }

    // PaymentIntent作成
    await ref.read(paymentStateProvider.notifier).createPaymentIntent(
          bookingId: widget.bookingId,
          customerId: widget.customerId ?? '',
          amount: widget.amount,
          currency: widget.currency,
          description: _generatePaymentDescription(),
        );
  }

  String _generatePaymentDescription() {
    return 'Pet care service - Booking ${widget.bookingId.substring(0, 8)}';
  }

  Future<void> _processPayment() async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      final paymentIntent = ref.read(paymentStateProvider).value;
      if (paymentIntent == null) {
        throw Exception('PaymentIntent not found');
      }

      domain.PaymentMethod? paymentMethod;

      if (_selectedPaymentMethodId != null) {
        // 既存のPaymentMethodを使用
        final paymentMethods =
            ref.read(paymentMethodsStateProvider).value ?? [];
        paymentMethod = paymentMethods
            .where((pm) => pm.id == _selectedPaymentMethodId)
            .firstOrNull;
      } else {
        // 新しいPaymentMethodを作成
        switch (_selectedPaymentType) {
          case domain.PaymentMethodType.card:
            paymentMethod = await _createCardPaymentMethod();
            break;
          case domain.PaymentMethodType.applePay:
            await _processApplePay();
            return;
          case domain.PaymentMethodType.googlePay:
            await _processGooglePay();
            return;
        }
      }

      if (paymentMethod == null) {
        throw Exception('PaymentMethod creation failed');
      }

      // 決済処理実行
      await ref.read(paymentProcessStateProvider.notifier).processPayment(
            PaymentProcessRequest(
              bookingId: widget.bookingId,
              customerId: widget.customerId ?? '',
              amount: widget.amount,
              currency: widget.currency,
              paymentMethodId: paymentMethod.id,
            ),
          );

      final processResult = ref.read(paymentProcessStateProvider).value;
      if (processResult != null) {
        await _handlePaymentResult(processResult);
      }
    } catch (e) {
      _showErrorDialog(e.toString());
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  Future<domain.PaymentMethod?> _createCardPaymentMethod() async {
    try {
      // Repository経由でPaymentMethodを保存
      return await ref
          .read(paymentMethodsStateProvider.notifier)
          .createPaymentMethod(
            type: domain.PaymentMethodType.card,
            customerId: widget.customerId ?? '',
          );
    } catch (e) {
      throw Exception('Card payment method creation failed: $e');
    }
  }

  Future<void> _processApplePay() async {
    try {
      // Apple Pay処理 - 簡易実装
      final paymentMethod = await ref
          .read(paymentMethodsStateProvider.notifier)
          .createPaymentMethod(
            type: domain.PaymentMethodType.applePay,
            customerId: widget.customerId ?? '',
          );

      if (paymentMethod != null) {
        await _confirmPayment(paymentMethod.id);
      }
    } catch (e) {
      throw Exception('Apple Pay payment failed: $e');
    }
  }

  Future<void> _processGooglePay() async {
    try {
      // Google Pay処理 - 簡易実装
      final paymentMethod = await ref
          .read(paymentMethodsStateProvider.notifier)
          .createPaymentMethod(
            type: domain.PaymentMethodType.googlePay,
            customerId: widget.customerId ?? '',
          );

      if (paymentMethod != null) {
        await _confirmPayment(paymentMethod.id);
      }
    } catch (e) {
      throw Exception('Google Pay payment failed: $e');
    }
  }

  Future<void> _confirmPayment(String paymentMethodId) async {
    final paymentIntent = ref.read(paymentStateProvider).value;
    if (paymentIntent == null) return;

    await ref.read(paymentStateProvider.notifier).confirmPaymentIntent(
          paymentIntentId: paymentIntent.id,
          paymentMethodId: paymentMethodId,
        );
  }

  Future<void> _handlePaymentResult(PaymentProcessResult result) async {
    switch (result.status) {
      case PaymentProcessStatus.succeeded:
        _navigateToSuccess(result);
        break;

      case PaymentProcessStatus.requiresAction:
        await _handle3DSecure(result.paymentIntent);
        break;

      case PaymentProcessStatus.processing:
        _navigateToProcessing(result);
        break;

      case PaymentProcessStatus.failed:
        _showErrorDialog('Payment failed. Please try again.');
        break;
    }
  }

  Future<void> _handle3DSecure(domain.PaymentIntent paymentIntent) async {
    try {
      // 3D Secure処理 - 簡易実装
      // 実際の実装では適切な3D Secure処理が必要
      await Future.delayed(Duration(seconds: 2));

      _navigateToSuccess(PaymentProcessResult(
        paymentIntent: paymentIntent,
        status: PaymentProcessStatus.succeeded,
        booking: ref.read(paymentProcessStateProvider).value!.booking,
      ));
    } catch (e) {
      _showErrorDialog('3D Secure error: $e');
    }
  }

  void _navigateToSuccess(PaymentProcessResult result) {
    context.pushReplacement(
      '/payment-success',
      extra: {
        'paymentIntent': result.paymentIntent,
        'booking': result.booking,
        'amount': widget.amount,
      },
    );
  }

  void _navigateToProcessing(PaymentProcessResult result) {
    context.pushReplacement(
      '/payment-processing',
      extra: {
        'paymentIntent': result.paymentIntent,
        'booking': result.booking,
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Payment Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final paymentState = ref.watch(paymentStateProvider);
    final paymentMethodsState = ref.watch(paymentMethodsStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close),
        ),
      ),
      body: Stack(
        children: [
          paymentState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => _buildErrorState(error.toString()),
            data: (paymentIntent) => paymentIntent != null
                ? _buildPaymentForm(paymentIntent, paymentMethodsState)
                : const Center(child: CircularProgressIndicator()),
          ),
          if (_isProcessing) const LoadingOverlay(isLoading: true),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Payment initialization failed',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          AppButton.filled(
            onPressed: _initializePayment,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentForm(
    domain.PaymentIntent paymentIntent,
    AsyncValue<List<domain.PaymentMethod>> paymentMethodsState,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 金額表示
          PaymentAmountDisplay(
            amount: widget.amount,
            currency: widget.currency,
            description: paymentIntent.description ?? '',
          ),

          const SizedBox(height: 24),

          // 既存PaymentMethod選択
          if (paymentMethodsState.hasValue &&
              paymentMethodsState.value!.isNotEmpty)
            PaymentMethodSelector(
              paymentMethods: paymentMethodsState.value!,
              selectedPaymentMethodId: _selectedPaymentMethodId,
              onPaymentMethodSelected: (paymentMethodId) {
                setState(() {
                  _selectedPaymentMethodId = paymentMethodId;
                });
              },
            ),

          if (paymentMethodsState.hasValue &&
              paymentMethodsState.value!.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('OR'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 16),
          ],

          // 新しいPaymentMethod作成
          PaymentCardForm(
            onPaymentMethodTypeChanged: (type) {
              setState(() {
                _selectedPaymentType = type;
                _selectedPaymentMethodId = null; // 新規作成を選択
              });
            },
          ),

          const SizedBox(height: 24),

          // モバイル決済オプション
          _buildMobilePaymentSection(),

          const SizedBox(height: 16),

          // 区切り線
          const Row(
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('または'),
              ),
              Expanded(child: Divider()),
            ],
          ),

          const SizedBox(height: 16),

          // 決済ボタン
          SizedBox(
            width: double.infinity,
            child: AppButton.filled(
              onPressed: _isProcessing ? null : _processPayment,
              child: Text(_isProcessing ? 'Processing...' : 'Pay Now'),
            ),
          ),

          const SizedBox(height: 16),

          // セキュリティバッジ
          const PaymentSecurityBadge(),
        ],
      ),
    );
  }

  Widget _buildMobilePaymentSection() {
    final deviceCapabilities = ref.watch(devicePaymentCapabilitiesProvider);
    final paymentItems = [
      PaymentItem(
        label: _generatePaymentDescription(),
        amount: widget.amount.toString(),
        type: PaymentItemType.finalItem,
      ),
    ];

    return deviceCapabilities.when(
      data: (capabilities) {
        if (!capabilities.hasAnyMobilePaymentSupport) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'クイック決済',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),

            // モバイル決済選択ボタン
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _showMobilePaymentOptions(paymentItems),
                icon: const Icon(Icons.phone_android),
                label: const Text('Apple Pay / Google Pay で支払う'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // 利用可能な決済方法の表示
            _buildAvailablePaymentMethods(capabilities),
          ],
        );
      },
      loading: () => const SizedBox(
        height: 40,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildAvailablePaymentMethods(DevicePaymentCapabilities capabilities) {
    final availableMethods = <String>[];

    if (capabilities.applePaySupported) {
      availableMethods.add('Apple Pay');
    }
    if (capabilities.googlePaySupported) {
      availableMethods.add('Google Pay');
    }

    if (availableMethods.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            size: 16,
            color: Colors.green[600],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '利用可能: ${availableMethods.join(', ')}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.green[700],
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMobilePaymentOptions(List<PaymentItem> paymentItems) async {
    await PaymentMethodSelectionSheet.show(
      context,
      paymentItems: paymentItems,
      totalAmount: widget.amount.toString(),
      onPaymentCompleted: () {
        _handleMobilePaymentSuccess();
      },
      onPaymentError: (error) {
        _showErrorDialog(error.message);
      },
    );
  }

  void _handleMobilePaymentSuccess() {
    // モバイル決済成功時の処理
    context.pushReplacement('/payment-success');
  }
}
