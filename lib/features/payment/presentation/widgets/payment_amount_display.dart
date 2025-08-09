import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class PaymentAmountDisplay extends StatelessWidget {
  final int amount;
  final String currency;
  final String description;

  const PaymentAmountDisplay({
    super.key,
    required this.amount,
    required this.currency,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Amount',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              _formatAmount(),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
            ),
            if (description.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
              ),
            ],
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.security,
                    size: 16,
                    color: AppColors.onPrimaryContainer,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Secure Payment',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.onPrimaryContainer,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatAmount() {
    if (currency.toLowerCase() == 'jpy') {
      final formattedAmount = amount.toString().replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},',
          );
      return '¥$formattedAmount';
    }

    // 他の通貨の場合の処理
    final formattedAmount = (amount / 100).toStringAsFixed(2);
    return '${currency.toUpperCase()} $formattedAmount';
  }
}
