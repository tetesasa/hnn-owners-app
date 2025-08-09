import 'package:flutter/material.dart';
import '../../domain/entities/payment_method.dart';
import '../../../../core/theme/app_colors.dart';

class PaymentMethodSelector extends StatelessWidget {
  final List<PaymentMethod> paymentMethods;
  final String? selectedPaymentMethodId;
  final Function(String?) onPaymentMethodSelected;

  const PaymentMethodSelector({
    super.key,
    required this.paymentMethods,
    required this.selectedPaymentMethodId,
    required this.onPaymentMethodSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (paymentMethods.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Saved Payment Methods',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 12),
        ...paymentMethods.map(
            (paymentMethod) => _buildPaymentMethodTile(context, paymentMethod)),
      ],
    );
  }

  Widget _buildPaymentMethodTile(
      BuildContext context, PaymentMethod paymentMethod) {
    final isSelected = selectedPaymentMethodId == paymentMethod.id;

    return Card(
      elevation: isSelected ? 2 : 1,
      color: isSelected ? AppColors.primaryContainer : null,
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => onPaymentMethodSelected(paymentMethod.id),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Payment method icon
              _buildPaymentMethodIcon(paymentMethod),
              const SizedBox(width: 16),
              // Payment method details
              Expanded(
                child:
                    _buildPaymentMethodInfo(context, paymentMethod, isSelected),
              ),
              // Radio button
              Radio<String>(
                value: paymentMethod.id,
                groupValue: selectedPaymentMethodId,
                onChanged: onPaymentMethodSelected,
                activeColor: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodIcon(PaymentMethod paymentMethod) {
    IconData icon;
    Color backgroundColor;
    Color iconColor;

    switch (paymentMethod.type) {
      case PaymentMethodType.card:
        icon = _getCardIcon(paymentMethod.card?.brand);
        backgroundColor = AppColors.surfaceVariant;
        iconColor = AppColors.onSurfaceVariant;
        break;
      case PaymentMethodType.applePay:
        icon = Icons.apple;
        backgroundColor = Colors.black;
        iconColor = Colors.white;
        break;
      case PaymentMethodType.googlePay:
        icon = Icons.account_balance_wallet;
        backgroundColor = AppColors.primary;
        iconColor = Colors.white;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        size: 24,
        color: iconColor,
      ),
    );
  }

  IconData _getCardIcon(String? brand) {
    if (brand == null) return Icons.credit_card;

    switch (brand.toLowerCase()) {
      case 'visa':
        return Icons.credit_card;
      case 'mastercard':
        return Icons.credit_card;
      case 'amex':
      case 'american_express':
        return Icons.credit_card;
      case 'jcb':
        return Icons.credit_card;
      default:
        return Icons.credit_card;
    }
  }

  Widget _buildPaymentMethodInfo(
    BuildContext context,
    PaymentMethod paymentMethod,
    bool isSelected,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _getPaymentMethodTitle(paymentMethod),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : AppColors.onSurface,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          _getPaymentMethodSubtitle(paymentMethod),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isSelected
                    ? Colors.white.withValues(alpha: 0.8)
                    : AppColors.onSurfaceVariant,
              ),
        ),
        if (paymentMethod.isDefault) ...[
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Default',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ],
    );
  }

  String _getPaymentMethodTitle(PaymentMethod paymentMethod) {
    switch (paymentMethod.type) {
      case PaymentMethodType.card:
        final brand = paymentMethod.card?.brand.toUpperCase() ?? 'CARD';
        final last4 = paymentMethod.card?.last4 ?? '****';
        return '$brand ••••$last4';
      case PaymentMethodType.applePay:
        return 'Apple Pay';
      case PaymentMethodType.googlePay:
        return 'Google Pay';
    }
  }

  String _getPaymentMethodSubtitle(PaymentMethod paymentMethod) {
    switch (paymentMethod.type) {
      case PaymentMethodType.card:
        final expMonth =
            paymentMethod.card?.expMonth.toString().padLeft(2, '0') ?? '**';
        final expYear =
            paymentMethod.card?.expYear.toString().substring(2) ?? '**';
        return 'Expires $expMonth/$expYear';
      case PaymentMethodType.applePay:
        return 'Touch ID or Face ID';
      case PaymentMethodType.googlePay:
        return 'Google account';
    }
  }
}
