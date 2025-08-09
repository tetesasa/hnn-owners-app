import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/booking.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    required this.booking,
    this.onTap,
    this.onCancel,
  });

  final Booking booking;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.cardBorderRadius),
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: AppDimensions.paddingS),
              _buildServiceInfo(),
              const SizedBox(height: AppDimensions.paddingS),
              _buildDateTimeInfo(),
              if (booking.petIds.isNotEmpty) ...[
                const SizedBox(height: AppDimensions.paddingS),
                _buildPetInfo(),
              ],
              if (booking.pricing != null) ...[
                const SizedBox(height: AppDimensions.paddingS),
                _buildPricingInfo(),
              ],
              if (booking.notes?.isNotEmpty == true) ...[
                const SizedBox(height: AppDimensions.paddingS),
                _buildNotesInfo(),
              ],
              const SizedBox(height: AppDimensions.paddingM),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '予約 #${booking.id.substring(0, 8)}',
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                _formatCreatedDate(),
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        BookingStatusChip(status: booking.status),
      ],
    );
  }

  Widget _buildServiceInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingS,
        vertical: AppDimensions.paddingXS,
      ),
      decoration: BoxDecoration(
        color: _getServiceTypeColor().withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppDimensions.chipBorderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getServiceTypeIcon(),
            size: 16,
            color: _getServiceTypeColor(),
          ),
          const SizedBox(width: AppDimensions.paddingXS),
          Text(
            _getServiceTypeName(),
            style: AppTextStyles.labelMedium.copyWith(
              color: _getServiceTypeColor(),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeInfo() {
    final formatter = DateFormat('MM/dd(E) HH:mm', 'ja');
    final duration =
        booking.sittingDateEnd.difference(booking.sittingDateStart);

    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingS),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius:
            BorderRadius.circular(AppDimensions.containerBorderRadius),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.schedule,
            size: 20,
            color: AppColors.primary,
          ),
          const SizedBox(width: AppDimensions.paddingS),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${formatter.format(booking.sittingDateStart)} 〜',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${formatter.format(booking.sittingDateEnd)} (${_formatDuration(duration)})',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetInfo() {
    return Row(
      children: [
        const Icon(
          Icons.pets,
          size: 20,
          color: AppColors.primary,
        ),
        const SizedBox(width: AppDimensions.paddingS),
        Expanded(
          child: Text(
            'ペット${booking.petIds.length}匹',
            style: AppTextStyles.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildPricingInfo() {
    final pricing = booking.pricing!;
    final totalPrice = pricing.basePrice +
        pricing.additionalCharges -
        pricing.discount +
        pricing.tax;

    return Row(
      children: [
        const Icon(
          Icons.payments,
          size: 20,
          color: AppColors.primary,
        ),
        const SizedBox(width: AppDimensions.paddingS),
        Expanded(
          child: Text(
            '¥${NumberFormat('#,###').format(totalPrice)}',
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotesInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingS),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius:
            BorderRadius.circular(AppDimensions.containerBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.note,
                size: 16,
                color: Colors.blue[700],
              ),
              const SizedBox(width: AppDimensions.paddingXS),
              Text(
                '備考',
                style: AppTextStyles.labelSmall.copyWith(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            booking.notes!,
            style: AppTextStyles.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onTap,
            child: const Text('詳細を見る'),
          ),
        ),
        if (onCancel != null) ...[
          const SizedBox(width: AppDimensions.paddingS),
          OutlinedButton(
            onPressed: onCancel,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.error,
              side: const BorderSide(color: AppColors.error),
            ),
            child: const Text('キャンセル'),
          ),
        ],
      ],
    );
  }

  String _formatCreatedDate() {
    final now = DateTime.now();
    final created = booking.createdAt ?? now;
    final diff = now.difference(created);

    if (diff.inDays > 0) {
      return DateFormat('MM/dd作成', 'ja').format(created);
    } else if (diff.inHours > 0) {
      return '${diff.inHours}時間前に作成';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes}分前に作成';
    } else {
      return 'たった今作成';
    }
  }

  String _formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays}日${duration.inHours % 24}時間';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}時間${duration.inMinutes % 60}分';
    } else {
      return '${duration.inMinutes}分';
    }
  }

  Color _getServiceTypeColor() {
    switch (booking.serviceType) {
      case ServiceType.visiting:
        return Colors.blue[700]!;
      case ServiceType.boarding:
        return Colors.purple[700]!;
      case ServiceType.daycare:
        return Colors.green[700]!;
      case ServiceType.grooming:
        return Colors.orange[700]!;
      case ServiceType.walking:
        return Colors.teal[700]!;
      // veterinaryとemergencyは存在しないためコメントアウト
      // case ServiceType.veterinary:
      //   return Colors.red[700]!;
      // case ServiceType.emergency:
      //   return Colors.red[900]!;
    }
  }

  IconData _getServiceTypeIcon() {
    switch (booking.serviceType) {
      case ServiceType.visiting:
        return Icons.home_outlined;
      case ServiceType.boarding:
        return Icons.hotel_outlined;
      case ServiceType.daycare:
        return Icons.wb_sunny_outlined;
      case ServiceType.grooming:
        return Icons.content_cut_outlined;
      case ServiceType.walking:
        return Icons.pets_outlined;
      // veterinaryとemergencyは存在しないためコメントアウト
      // case ServiceType.veterinary:
      //   return Icons.medical_services_outlined;
      // case ServiceType.emergency:
      //   return Icons.emergency_outlined;
    }
  }

  String _getServiceTypeName() {
    switch (booking.serviceType) {
      case ServiceType.visiting:
        return '訪問ケア';
      case ServiceType.boarding:
        return '宿泊ケア';
      case ServiceType.daycare:
        return 'デイケア';
      case ServiceType.grooming:
        return 'グルーミング';
      case ServiceType.walking:
        return 'お散歩';
      // veterinaryとemergencyは存在しないためコメントアウト
      // case ServiceType.veterinary:
      //   return '獣医診療';
      // case ServiceType.emergency:
      //   return '緊急ケア';
    }
  }
}

class BookingStatusChip extends StatelessWidget {
  const BookingStatusChip({
    super.key,
    required this.status,
  });

  final BookingStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingS,
        vertical: AppDimensions.paddingXS,
      ),
      decoration: BoxDecoration(
        color: _getStatusColor(),
        borderRadius: BorderRadius.circular(AppDimensions.chipBorderRadius),
      ),
      child: Text(
        _getStatusText(),
        style: AppTextStyles.labelSmall.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (status) {
      case BookingStatus.pending:
        return Colors.orange;
      case BookingStatus.confirmed:
        return Colors.blue;
      case BookingStatus.inProgress:
        return Colors.green;
      case BookingStatus.completed:
        return Colors.grey;
      case BookingStatus.cancelled:
        return Colors.red;
      case BookingStatus.noShow:
        return Colors.red[800]!;
    }
  }

  String _getStatusText() {
    switch (status) {
      case BookingStatus.pending:
        return '承認待ち';
      case BookingStatus.confirmed:
        return '確定';
      case BookingStatus.inProgress:
        return '進行中';
      case BookingStatus.completed:
        return '完了';
      case BookingStatus.cancelled:
        return 'キャンセル';
      case BookingStatus.noShow:
        return 'ノーショー';
    }
  }
}
