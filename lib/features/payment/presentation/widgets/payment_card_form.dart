import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/entities/payment_method.dart';
import '../../../../core/theme/app_colors.dart';

class PaymentCardForm extends StatefulWidget {
  final Function(PaymentMethodType)? onPaymentMethodTypeChanged;
  final VoidCallback? onCardChanged;

  const PaymentCardForm({
    super.key,
    this.onPaymentMethodTypeChanged,
    this.onCardChanged,
  });

  @override
  State<PaymentCardForm> createState() => _PaymentCardFormState();
}

class _PaymentCardFormState extends State<PaymentCardForm> {
  // Simplified card form implementation without Stripe SDK
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvcController = TextEditingController();
  PaymentMethodType _selectedType = PaymentMethodType.card;

  @override
  void initState() {
    super.initState();
    widget.onPaymentMethodTypeChanged?.call(_selectedType);
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  void _onPaymentMethodTypeChanged(PaymentMethodType type) {
    setState(() {
      _selectedType = type;
    });
    widget.onPaymentMethodTypeChanged?.call(type);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 16),

        // Payment method selector
        _buildPaymentMethodSelector(),

        const SizedBox(height: 16),

        // Card form (only shown when card is selected)
        if (_selectedType == PaymentMethodType.card) _buildCardForm(),
      ],
    );
  }

  Widget _buildPaymentMethodSelector() {
    return Column(
      children: [
        // Card payment option
        _buildPaymentMethodTile(
          type: PaymentMethodType.card,
          icon: Icons.credit_card,
          title: 'Credit or Debit Card',
          subtitle: 'Visa, Mastercard, American Express',
        ),

        // Apple Pay option (iOS only)
        if (Theme.of(context).platform == TargetPlatform.iOS)
          _buildPaymentMethodTile(
            type: PaymentMethodType.applePay,
            icon: Icons.apple,
            title: 'Apple Pay',
            subtitle: 'Pay with Touch ID or Face ID',
          ),

        // Google Pay option (Android only)
        if (Theme.of(context).platform == TargetPlatform.android)
          _buildPaymentMethodTile(
            type: PaymentMethodType.googlePay,
            icon: Icons.account_balance_wallet,
            title: 'Google Pay',
            subtitle: 'Pay with your Google account',
          ),
      ],
    );
  }

  Widget _buildPaymentMethodTile({
    required PaymentMethodType type,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final isSelected = _selectedType == type;

    return Card(
      elevation: isSelected ? 2 : 1,
      color: isSelected ? AppColors.primaryContainer : null,
      child: InkWell(
        onTap: () => _onPaymentMethodTypeChanged(type),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:
                      isSelected ? AppColors.primary : AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : AppColors.onSurfaceVariant,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? AppColors.onPrimaryContainer
                                : AppColors.onSurface,
                          ),
                    ),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isSelected
                                ? AppColors.onPrimaryContainer
                                    .withValues(alpha: 0.8)
                                : AppColors.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              Radio<PaymentMethodType>(
                value: type,
                groupValue: _selectedType,
                onChanged: (value) {
                  if (value != null) {
                    _onPaymentMethodTypeChanged(value);
                  }
                },
                activeColor: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardForm() {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Card Information',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            // Card Number Field
            TextFormField(
              controller: _cardNumberController,
              decoration: InputDecoration(
                labelText: 'Card Number',
                hintText: '1234 5678 9012 3456',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.outline),
                ),
                prefixIcon: const Icon(Icons.credit_card),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                _CardNumberInputFormatter(),
              ],
              onChanged: (value) {
                widget.onCardChanged?.call();
              },
            ),
            const SizedBox(height: 16),

            // Expiry and CVC Row
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _expiryController,
                    decoration: InputDecoration(
                      labelText: 'MM/YY',
                      hintText: '12/24',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.outline),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      _ExpiryDateInputFormatter(),
                    ],
                    onChanged: (value) {
                      widget.onCardChanged?.call();
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _cvcController,
                    decoration: InputDecoration(
                      labelText: 'CVC',
                      hintText: '123',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.outline),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    onChanged: (value) {
                      widget.onCardChanged?.call();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(
                  Icons.lock,
                  size: 16,
                  color: AppColors.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Your card information is encrypted and secure',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom input formatters
class _CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.length <= 4) return newValue;

    final formatted = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i % 4 == 0 && i != 0) {
        formatted.write(' ');
      }
      formatted.write(text[i]);
    }

    return newValue.copyWith(
      text: formatted.toString(),
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class _ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.length <= 2) return newValue;

    final formatted = '${text.substring(0, 2)}/${text.substring(2)}';

    return newValue.copyWith(
      text: formatted.length <= 5 ? formatted : formatted.substring(0, 5),
      selection: TextSelection.collapsed(
        offset: formatted.length <= 5 ? formatted.length : 5,
      ),
    );
  }
}
