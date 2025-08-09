import 'package:flutter/material.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/booking.dart';
import '../../screens/booking/booking_list_screen.dart';
import '../common/app_button.dart';

class BookingFilterSheet extends StatefulWidget {
  const BookingFilterSheet({
    super.key,
    required this.initialFilter,
  });

  final BookingFilterState initialFilter;

  @override
  State<BookingFilterSheet> createState() => _BookingFilterSheetState();
}

class _BookingFilterSheetState extends State<BookingFilterSheet> {
  late Set<BookingStatus> _selectedStatuses;
  late Set<ServiceType> _selectedServiceTypes;
  DateTimeRange? _dateRange;

  @override
  void initState() {
    super.initState();
    _selectedStatuses = Set.from(widget.initialFilter.selectedStatuses);
    _selectedServiceTypes = Set.from(widget.initialFilter.selectedServiceTypes);
    _dateRange = widget.initialFilter.dateRange;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              _buildHandle(),
              _buildHeader(),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(AppDimensions.paddingM),
                  children: [
                    _buildStatusFilter(),
                    const SizedBox(height: AppDimensions.paddingL),
                    _buildServiceTypeFilter(),
                    const SizedBox(height: AppDimensions.paddingL),
                    _buildDateFilter(),
                    const SizedBox(height: AppDimensions.paddingXL),
                  ],
                ),
              ),
              _buildActionButtons(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHandle() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppDimensions.paddingS),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingM,
        vertical: AppDimensions.paddingS,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'フィルター',
            style: AppTextStyles.headlineSmall.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: _clearAllFilters,
            child: const Text('すべてクリア'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ステータス',
          style: AppTextStyles.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppDimensions.paddingS),
        Wrap(
          spacing: AppDimensions.paddingS,
          runSpacing: AppDimensions.paddingS,
          children: BookingStatus.values.map((status) {
            final isSelected = _selectedStatuses.contains(status);
            return FilterChip(
              label: Text(_getStatusDisplayName(status)),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedStatuses.add(status);
                  } else {
                    _selectedStatuses.remove(status);
                  }
                });
              },
              selectedColor: _getStatusColor(status).withValues(alpha: 0.2),
              checkmarkColor: _getStatusColor(status),
              labelStyle: TextStyle(
                color: isSelected ? _getStatusColor(status) : Colors.grey[700],
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildServiceTypeFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'サービスタイプ',
          style: AppTextStyles.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppDimensions.paddingS),
        Wrap(
          spacing: AppDimensions.paddingS,
          runSpacing: AppDimensions.paddingS,
          children: ServiceType.values.map((serviceType) {
            final isSelected = _selectedServiceTypes.contains(serviceType);
            return FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getServiceTypeIcon(serviceType),
                    size: 16,
                    color: isSelected
                        ? _getServiceTypeColor(serviceType)
                        : Colors.grey[600],
                  ),
                  const SizedBox(width: AppDimensions.paddingXS),
                  Text(_getServiceTypeDisplayName(serviceType)),
                ],
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedServiceTypes.add(serviceType);
                  } else {
                    _selectedServiceTypes.remove(serviceType);
                  }
                });
              },
              selectedColor:
                  _getServiceTypeColor(serviceType).withValues(alpha: 0.2),
              checkmarkColor: _getServiceTypeColor(serviceType),
              labelStyle: TextStyle(
                color: isSelected
                    ? _getServiceTypeColor(serviceType)
                    : Colors.grey[700],
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDateFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '日付範囲',
          style: AppTextStyles.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppDimensions.paddingS),
        OutlinedButton(
          onPressed: _selectDateRange,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.date_range),
              const SizedBox(width: AppDimensions.paddingS),
              Text(
                _dateRange != null
                    ? '${_formatDate(_dateRange!.start)} 〜 ${_formatDate(_dateRange!.end)}'
                    : '日付範囲を選択',
              ),
            ],
          ),
        ),
        if (_dateRange != null) ...[
          const SizedBox(height: AppDimensions.paddingS),
          TextButton(
            onPressed: () {
              setState(() {
                _dateRange = null;
              });
            },
            child: const Text('日付範囲をクリア'),
          ),
        ],
      ],
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.2),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppSecondaryButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('キャンセル'),
            ),
          ),
          const SizedBox(width: AppDimensions.paddingM),
          Expanded(
            child: AppPrimaryButton(
              onPressed: _applyFilter,
              child: const Text('適用'),
            ),
          ),
        ],
      ),
    );
  }

  String _getStatusDisplayName(BookingStatus status) {
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

  String _getServiceTypeDisplayName(ServiceType serviceType) {
    switch (serviceType) {
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

  Color _getStatusColor(BookingStatus status) {
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

  Color _getServiceTypeColor(ServiceType serviceType) {
    switch (serviceType) {
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

  IconData _getServiceTypeIcon(ServiceType serviceType) {
    switch (serviceType) {
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

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}';
  }

  Future<void> _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
      initialDateRange: _dateRange,
      locale: const Locale('ja'),
    );

    if (picked != null) {
      setState(() {
        _dateRange = picked;
      });
    }
  }

  void _clearAllFilters() {
    setState(() {
      _selectedStatuses.clear();
      _selectedServiceTypes.clear();
      _dateRange = null;
    });
  }

  void _applyFilter() {
    final newFilter = BookingFilterState(
      selectedStatuses: _selectedStatuses,
      selectedServiceTypes: _selectedServiceTypes,
      dateRange: _dateRange,
    );
    Navigator.of(context).pop(newFilter);
  }
}
