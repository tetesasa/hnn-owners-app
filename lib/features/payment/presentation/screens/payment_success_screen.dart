import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/payment_intent.dart';
import '../../../../domain/entities/booking.dart';
import '../../../../presentation/widgets/common/app_button.dart';
import '../../../../core/theme/app_colors.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final PaymentIntent paymentIntent;
  final Booking booking;
  final int amount;

  const PaymentSuccessScreen({
    super.key,
    required this.paymentIntent,
    required this.booking,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Complete'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Success icon
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 60,
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Success message
                    Text(
                      'Payment Successful!',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.onSurface,
                              ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 16),

                    Text(
                      'Your booking has been confirmed and payment processed successfully.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 32),

                    // Payment details card
                    _buildPaymentDetailsCard(context),

                    const SizedBox(height: 24),

                    // Booking details card
                    _buildBookingDetailsCard(context),
                  ],
                ),
              ),

              // Action buttons
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: AppButton.filled(
                      onPressed: () => _viewBookingDetails(context),
                      child: const Text('View Booking Details'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: AppButton.outlined(
                      onPressed: () => _backToHome(context),
                      child: const Text('Back to Home'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentDetailsCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.receipt,
                  color: AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Payment Receipt',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildDetailRow(
              context,
              'Amount',
              paymentIntent.formattedAmount,
              isAmount: true,
            ),
            _buildDetailRow(
              context,
              'Payment ID',
              paymentIntent.id,
            ),
            _buildDetailRow(
              context,
              'Transaction Date',
              DateFormat('MMM dd, yyyy • HH:mm').format(
                paymentIntent.created ?? DateTime.now(),
              ),
            ),
            _buildDetailRow(
              context,
              'Status',
              'Completed',
              statusColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingDetailsCard(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.pets,
                  color: AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Booking Information',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildDetailRow(
              context,
              'Booking ID',
              booking.id.substring(0, 8).toUpperCase(),
            ),
            _buildDetailRow(
              context,
              'Service Type',
              _formatServiceType(booking.serviceType),
            ),
            _buildDetailRow(
              context,
              'Service Date',
              DateFormat('MMM dd, yyyy').format(booking.sittingDateStart),
            ),
            _buildDetailRow(
              context,
              'Duration',
              _formatDuration(booking.sittingDateStart, booking.sittingDateEnd),
            ),
            _buildDetailRow(
              context,
              'Pets',
              '${booking.petIds.length} pet(s)',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value, {
    bool isAmount = false,
    Color? statusColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: isAmount ? FontWeight.bold : FontWeight.w500,
                  color: statusColor ??
                      (isAmount ? AppColors.primary : AppColors.onSurface),
                ),
          ),
        ],
      ),
    );
  }

  String _formatServiceType(ServiceType serviceType) {
    switch (serviceType) {
      case ServiceType.visiting:
        return 'Pet Visiting';
      case ServiceType.boarding:
        return 'Pet Boarding';
      case ServiceType.daycare:
        return 'Pet Daycare';
      case ServiceType.grooming:
        return 'Pet Grooming';
      case ServiceType.walking:
        return 'Pet Walking';
    }
  }

  String _formatDuration(DateTime start, DateTime end) {
    final duration = end.difference(start);

    if (duration.inDays > 0) {
      return '${duration.inDays} day(s)';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hour(s)';
    } else {
      return '${duration.inMinutes} minute(s)';
    }
  }

  void _viewBookingDetails(BuildContext context) {
    context.pushReplacement('/booking-detail/${booking.id}');
  }

  void _backToHome(BuildContext context) {
    context.go('/');
  }
}
