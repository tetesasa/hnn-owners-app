import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/booking.dart';
import '../../../application/providers/booking_providers.dart';
import '../../widgets/common/app_scaffold.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/loading_overlay.dart';
import '../../widgets/booking/booking_card.dart';

class BookingDetailScreen extends ConsumerWidget {
  const BookingDetailScreen({
    super.key,
    required this.bookingId,
  });

  final String bookingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingAsync = ref.watch(bookingNotifierProvider(bookingId));

    return AppScaffold(
      appBar: AppBar(
        title: const Text('予約詳細'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref
                .read(bookingNotifierProvider(bookingId).notifier)
                .refreshBooking(),
          ),
        ],
      ),
      body: bookingAsync.when(
        data: (booking) {
          if (booking == null) {
            return _buildNotFoundState(context);
          }
          return _buildBookingDetail(context, booking);
        },
        loading: () => const Center(child: AppLoadingIndicator()),
        error: (error, stackTrace) =>
            _buildErrorState(context, error.toString()),
      ),
    );
  }

  Widget _buildBookingDetail(BuildContext context, Booking booking) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BookingCard(
            booking: booking,
            onCancel: (booking.status == BookingStatus.pending ||
                    booking.status == BookingStatus.confirmed)
                ? () => _showCancelDialog(context, booking)
                : null,
          ),
          const SizedBox(height: AppDimensions.paddingL),
          _buildDetailSection('予約情報', [
            _buildDetailRow('予約ID', booking.id),
            _buildDetailRow('作成日時', _formatDateTime(booking.createdAt)),
            if (booking.updatedAt != booking.createdAt)
              _buildDetailRow('更新日時', _formatDateTime(booking.updatedAt)),
          ]),
          if (booking.specialInstructions.isNotEmpty) ...[
            const SizedBox(height: AppDimensions.paddingL),
            _buildDetailSection(
              '特別な指示',
              booking.specialInstructions
                  .map((instruction) => Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppDimensions.paddingS),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• '),
                            Expanded(child: Text(instruction)),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
          if (booking.communicationLog.isNotEmpty) ...[
            const SizedBox(height: AppDimensions.paddingL),
            _buildCommunicationSection(booking.communicationLog),
          ],
          const SizedBox(height: AppDimensions.paddingXL),
          _buildActionButtons(context, booking),
        ],
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.paddingS),
            const Divider(),
            const SizedBox(height: AppDimensions.paddingS),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.paddingS),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value ?? '未設定',
              style: AppTextStyles.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommunicationSection(List<CommunicationMessage> messages) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'コミュニケーション履歴',
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.paddingS),
            const Divider(),
            ...messages.map((message) => _buildMessageTile(message)),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageTile(CommunicationMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingS),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: message.senderType == 'owner'
                ? AppColors.primary
                : AppColors.secondary,
            child: Icon(
              message.senderType == 'owner'
                  ? Icons.person
                  : Icons.support_agent,
              size: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: AppDimensions.paddingS),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      message.senderType == 'owner' ? '飼い主' : 'スタッフ',
                      style: AppTextStyles.labelMedium.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      _formatDateTime(message.timestamp),
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  message.message,
                  style: AppTextStyles.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, Booking booking) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (booking.status == BookingStatus.pending ||
            booking.status == BookingStatus.confirmed) ...[
          AppSecondaryButton(
            onPressed: () => _navigateToEdit(context, booking),
            child: const Text('予約を変更'),
          ),
          const SizedBox(height: AppDimensions.paddingS),
          AppButton.outlined(
            onPressed: () => _showCancelDialog(context, booking),
            foregroundColor: AppColors.error,
            borderColor: AppColors.error,
            child: const Text('予約をキャンセル'),
          ),
        ],
        if (booking.status == BookingStatus.completed &&
            booking.ownerRating == null) ...[
          AppPrimaryButton(
            onPressed: () => _navigateToRating(context, booking),
            child: const Text('サービスを評価'),
          ),
        ],
      ],
    );
  }

  Widget _buildNotFoundState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: AppDimensions.paddingL),
            Text(
              '予約が見つかりません',
              style: AppTextStyles.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.paddingS),
            Text(
              '指定された予約が存在しないか、削除されています',
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.paddingXL),
            AppSecondaryButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('戻る'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 80,
              color: AppColors.error,
            ),
            const SizedBox(height: AppDimensions.paddingL),
            Text(
              'エラーが発生しました',
              style: AppTextStyles.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.paddingS),
            Text(
              error,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.paddingXL),
            AppSecondaryButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('戻る'),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return '未設定';
    final formatter = DateFormat('yyyy/MM/dd HH:mm');
    return formatter.format(dateTime);
  }

  void _showCancelDialog(BuildContext context, Booking booking) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('予約キャンセル'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('この予約をキャンセルしますか？'),
            SizedBox(height: AppDimensions.paddingS),
            Text(
              'キャンセル料金が発生する場合があります。',
              style: TextStyle(
                color: AppColors.warning,
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('戻る'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _navigateToCancel(context, booking);
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.error,
            ),
            child: const Text('キャンセル'),
          ),
        ],
      ),
    );
  }

  void _navigateToEdit(BuildContext context, Booking booking) {
    Navigator.of(context).pushNamed('/booking/edit', arguments: booking);
  }

  void _navigateToCancel(BuildContext context, Booking booking) {
    Navigator.of(context).pushNamed('/booking/cancel', arguments: booking);
  }

  void _navigateToRating(BuildContext context, Booking booking) {
    Navigator.of(context).pushNamed('/booking/rating', arguments: booking);
  }
}
