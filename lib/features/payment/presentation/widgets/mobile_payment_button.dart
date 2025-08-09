import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/mobile_payment_config.dart';
import '../../application/providers/mobile_payment_providers.dart';

/// モバイル決済ボタン（Apple Pay / Google Pay）
class MobilePaymentButton extends ConsumerWidget {
  final PaymentMethodType paymentType;
  final List<PaymentItem> paymentItems;
  final VoidCallback? onPaymentCompleted;
  final ValueChanged<MobilePaymentError>? onPaymentError;
  final VoidCallback? onPaymentCancelled;
  final double? width;
  final double height;
  final EdgeInsetsGeometry? margin;

  const MobilePaymentButton({
    super.key,
    required this.paymentType,
    required this.paymentItems,
    this.onPaymentCompleted,
    this.onPaymentError,
    this.onPaymentCancelled,
    this.width,
    this.height = 50.0,
    this.margin,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentState = ref.watch(mobilePaymentProvider);
    final isAvailable = _getAvailabilityProvider(ref);

    return isAvailable.when(
      data: (available) {
        if (!available) {
          return _buildUnavailableButton(context);
        }

        return Container(
          width: width,
          height: height,
          margin: margin,
          child: _buildPaymentButton(context, ref, paymentState),
        );
      },
      loading: () => _buildLoadingButton(context),
      error: (_, __) => _buildUnavailableButton(context),
    );
  }

  AsyncValue<bool> _getAvailabilityProvider(WidgetRef ref) {
    switch (paymentType) {
      case PaymentMethodType.applePay:
        return ref.watch(applePayAvailabilityProvider);
      case PaymentMethodType.googlePay:
        return ref.watch(googlePayAvailabilityProvider);
      case PaymentMethodType.creditCard:
        return AsyncValue.data(true);
    }
  }

  Widget _buildPaymentButton(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<MobilePaymentResult?> paymentState,
  ) {
    final isLoading = paymentState.isLoading;

    return ElevatedButton(
      onPressed: isLoading ? null : () => _handlePayment(context, ref),
      style: _getButtonStyle(context),
      child:
          isLoading ? _buildLoadingIndicator() : _buildButtonContent(context),
    );
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    Color backgroundColor;
    Color foregroundColor;

    switch (paymentType) {
      case PaymentMethodType.applePay:
        backgroundColor = Colors.black;
        foregroundColor = Colors.white;
        break;
      case PaymentMethodType.googlePay:
        backgroundColor = const Color(0xFF4285F4);
        foregroundColor = Colors.white;
        break;
      case PaymentMethodType.creditCard:
        backgroundColor = Theme.of(context).primaryColor;
        foregroundColor = Colors.white;
        break;
    }

    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
    );
  }

  Widget _buildButtonContent(BuildContext context) {
    switch (paymentType) {
      case PaymentMethodType.applePay:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.apple,
              size: 20,
            ),
            const SizedBox(width: 8),
            const Text(
              'Pay',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      case PaymentMethodType.googlePay:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'G',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Pay',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      case PaymentMethodType.creditCard:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.credit_card, size: 20),
            const SizedBox(width: 8),
            const Text(
              'クレジットカード決済',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
    }
  }

  Widget _buildLoadingIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          '処理中...',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingButton(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[600]!),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '確認中...',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnavailableButton(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          '${paymentType.displayName}利用不可',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Future<void> _handlePayment(BuildContext context, WidgetRef ref) async {
    try {
      final notifier = ref.read(mobilePaymentProvider.notifier);

      switch (paymentType) {
        case PaymentMethodType.applePay:
          await notifier.processApplePayPayment(paymentItems);
          break;
        case PaymentMethodType.googlePay:
          await notifier.processGooglePayPayment(paymentItems);
          break;
        case PaymentMethodType.creditCard:
          // クレジットカード決済は別途実装
          break;
      }

      // 決済完了を監視
      ref.listen<AsyncValue<MobilePaymentResult?>>(
        mobilePaymentProvider,
        (previous, next) {
          next.when(
            data: (result) {
              if (result != null) {
                onPaymentCompleted?.call();
              }
            },
            loading: () {
              // 処理中表示は自動的に更新される
            },
            error: (error, _) {
              final paymentError = ref.read(paymentErrorHandlerProvider)(error);

              if (paymentError.type == MobilePaymentErrorType.userCancelled) {
                onPaymentCancelled?.call();
              } else {
                onPaymentError?.call(paymentError);
              }
            },
          );
        },
      );
    } catch (e) {
      final paymentError = ref.read(paymentErrorHandlerProvider)(e);
      onPaymentError?.call(paymentError);
    }
  }
}

/// Apple Pay専用ボタン
class ApplePayButton extends StatelessWidget {
  final List<PaymentItem> paymentItems;
  final VoidCallback? onPaymentCompleted;
  final ValueChanged<MobilePaymentError>? onPaymentError;
  final VoidCallback? onPaymentCancelled;
  final double? width;
  final double height;

  const ApplePayButton({
    super.key,
    required this.paymentItems,
    this.onPaymentCompleted,
    this.onPaymentError,
    this.onPaymentCancelled,
    this.width,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return MobilePaymentButton(
      paymentType: PaymentMethodType.applePay,
      paymentItems: paymentItems,
      onPaymentCompleted: onPaymentCompleted,
      onPaymentError: onPaymentError,
      onPaymentCancelled: onPaymentCancelled,
      width: width,
      height: height,
    );
  }
}

/// Google Pay専用ボタン
class GooglePayButton extends StatelessWidget {
  final List<PaymentItem> paymentItems;
  final VoidCallback? onPaymentCompleted;
  final ValueChanged<MobilePaymentError>? onPaymentError;
  final VoidCallback? onPaymentCancelled;
  final double? width;
  final double height;

  const GooglePayButton({
    super.key,
    required this.paymentItems,
    this.onPaymentCompleted,
    this.onPaymentError,
    this.onPaymentCancelled,
    this.width,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return MobilePaymentButton(
      paymentType: PaymentMethodType.googlePay,
      paymentItems: paymentItems,
      onPaymentCompleted: onPaymentCompleted,
      onPaymentError: onPaymentError,
      onPaymentCancelled: onPaymentCancelled,
      width: width,
      height: height,
    );
  }
}
