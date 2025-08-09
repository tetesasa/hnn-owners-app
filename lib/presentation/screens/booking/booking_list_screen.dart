import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/booking.dart';
import '../../../application/providers/booking_providers.dart';
import '../../widgets/common/app_scaffold.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/loading_overlay.dart';
import '../../widgets/booking/booking_card.dart';
import '../../widgets/booking/booking_filter_sheet.dart';

class BookingListScreen extends ConsumerStatefulWidget {
  const BookingListScreen({super.key});

  @override
  ConsumerState<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends ConsumerState<BookingListScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  BookingFilterState _filterState = const BookingFilterState();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('予約管理'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterSheet(context),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _refreshBookings(),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '今後の予約'),
            Tab(text: '過去の予約'),
            Tab(text: 'すべて'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildUpcomingBookingsTab(),
          _buildPastBookingsTab(),
          _buildAllBookingsTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToCreateBooking(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildUpcomingBookingsTab() {
    final upcomingBookingsAsync = ref.watch(upcomingBookingsProvider);

    return upcomingBookingsAsync.when(
      data: (bookings) => _buildBookingList(
        bookings: bookings,
        emptyMessage: '今後の予約はありません',
        emptySubtitle: '新しい予約を作成してください',
      ),
      loading: () => const Center(child: AppLoadingIndicator()),
      error: (error, stackTrace) => _buildErrorState(error.toString()),
    );
  }

  Widget _buildPastBookingsTab() {
    final pastBookingsAsync = ref.watch(pastBookingsProvider);

    return pastBookingsAsync.when(
      data: (bookings) => _buildBookingList(
        bookings: bookings,
        emptyMessage: '過去の予約はありません',
        emptySubtitle: 'サービスをご利用いただくと表示されます',
      ),
      loading: () => const Center(child: AppLoadingIndicator()),
      error: (error, stackTrace) => _buildErrorState(error.toString()),
    );
  }

  Widget _buildAllBookingsTab() {
    final allBookingsAsync = ref.watch(currentUserBookingsProvider);

    return allBookingsAsync.when(
      data: (bookings) => _buildBookingList(
        bookings: _applyFilter(bookings),
        emptyMessage: '予約がありません',
        emptySubtitle: '新しい予約を作成してください',
      ),
      loading: () => const Center(child: AppLoadingIndicator()),
      error: (error, stackTrace) => _buildErrorState(error.toString()),
    );
  }

  Widget _buildBookingList({
    required List<Booking> bookings,
    required String emptyMessage,
    required String emptySubtitle,
  }) {
    if (bookings.isEmpty) {
      return _buildEmptyState(emptyMessage, emptySubtitle);
    }

    return RefreshIndicator(
      onRefresh: _refreshBookings,
      child: ListView.builder(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.paddingM),
            child: BookingCard(
              booking: booking,
              onTap: () => _navigateToBookingDetail(booking.id),
              onCancel: booking.status == BookingStatus.pending ||
                      booking.status == BookingStatus.confirmed
                  ? () => _showCancelDialog(booking)
                  : null,
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(String message, String subtitle) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_note,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: AppDimensions.paddingL),
            Text(
              message,
              style: AppTextStyles.headlineSmall.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.paddingS),
            Text(
              subtitle,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.paddingXL),
            AppPrimaryButton(
              onPressed: _navigateToCreateBooking,
              child: const Text('新しい予約を作成'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String error) {
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
              onPressed: _refreshBookings,
              child: const Text('再試行'),
            ),
          ],
        ),
      ),
    );
  }

  List<Booking> _applyFilter(List<Booking> bookings) {
    var filteredBookings = bookings;

    // ステータスフィルタ
    if (_filterState.selectedStatuses.isNotEmpty) {
      filteredBookings = filteredBookings
          .where((booking) =>
              _filterState.selectedStatuses.contains(booking.status))
          .toList();
    }

    // サービスタイプフィルタ
    if (_filterState.selectedServiceTypes.isNotEmpty) {
      filteredBookings = filteredBookings
          .where((booking) =>
              _filterState.selectedServiceTypes.contains(booking.serviceType))
          .toList();
    }

    // 日付範囲フィルタ
    if (_filterState.dateRange != null) {
      filteredBookings = filteredBookings.where((booking) {
        final bookingDate = booking.sittingDateStart;
        return bookingDate.isAfter(_filterState.dateRange!.start) &&
            bookingDate.isBefore(_filterState.dateRange!.end);
      }).toList();
    }

    return filteredBookings;
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet<BookingFilterState>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => BookingFilterSheet(
        initialFilter: _filterState,
      ),
    ).then((newFilter) {
      if (newFilter != null) {
        setState(() {
          _filterState = newFilter;
        });
      }
    });
  }

  void _showCancelDialog(Booking booking) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('予約キャンセル'),
        content: Text('${booking.serviceType.displayName}の予約をキャンセルしますか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('戻る'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _navigateToCancelBooking(booking);
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

  Future<void> _refreshBookings() async {
    ref.invalidate(currentUserBookingsProvider);
    ref.invalidate(upcomingBookingsProvider);
    ref.invalidate(pastBookingsProvider);
  }

  void _navigateToCreateBooking() {
    Navigator.of(context).pushNamed('/booking/create');
  }

  void _navigateToBookingDetail(String bookingId) {
    Navigator.of(context).pushNamed('/booking/detail', arguments: bookingId);
  }

  void _navigateToCancelBooking(Booking booking) {
    Navigator.of(context).pushNamed('/booking/cancel', arguments: booking);
  }
}

class BookingFilterState {
  const BookingFilterState({
    this.selectedStatuses = const {},
    this.selectedServiceTypes = const {},
    this.dateRange,
  });

  final Set<BookingStatus> selectedStatuses;
  final Set<ServiceType> selectedServiceTypes;
  final DateTimeRange? dateRange;

  BookingFilterState copyWith({
    Set<BookingStatus>? selectedStatuses,
    Set<ServiceType>? selectedServiceTypes,
    DateTimeRange? dateRange,
  }) {
    return BookingFilterState(
      selectedStatuses: selectedStatuses ?? this.selectedStatuses,
      selectedServiceTypes: selectedServiceTypes ?? this.selectedServiceTypes,
      dateRange: dateRange ?? this.dateRange,
    );
  }
}

// サービスタイプ表示名拡張
extension ServiceTypeExtension on ServiceType {
  String get displayName {
    switch (this) {
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
      // emergencyは緊急ケアを意味していましたが、現在はvisitingで代用
      // case ServiceType.emergency:
      //   return '緊急ケア';
    }
  }
}
