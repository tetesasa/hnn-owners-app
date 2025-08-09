import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class PaymentSecurityBadge extends StatelessWidget {
  const PaymentSecurityBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.outline.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.security,
                size: 20,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Secure Payment',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSecurityFeature(
            context,
            icon: Icons.lock,
            title: '256-bit SSL encryption',
            description: 'Your payment information is fully encrypted',
          ),
          const SizedBox(height: 8),
          _buildSecurityFeature(
            context,
            icon: Icons.verified_user,
            title: 'PCI Level 1 certified',
            description: 'Highest level of payment security standards',
          ),
          const SizedBox(height: 8),
          _buildSecurityFeature(
            context,
            icon: Icons.shield,
            title: 'Fraud protection',
            description: 'Advanced fraud detection and prevention',
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSecurityLogo(
                  'assets/images/stripe_logo.png', 'Powered by Stripe'),
              const SizedBox(width: 24),
              _buildSecurityLogo(
                  'assets/images/pci_logo.png', 'PCI DSS Compliant'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityFeature(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppColors.onSurfaceVariant,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.onSurface,
                    ),
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontSize: 11,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSecurityLogo(String assetPath, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColors.outline.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Placeholder for security logos
            Container(
              width: 20,
              height: 12,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              tooltip.split(' ').first, // 最初の単語のみ表示
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
