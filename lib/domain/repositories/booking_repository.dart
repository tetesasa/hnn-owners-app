import '../entities/booking.dart';

abstract class BookingRepository {
  // 予約の取得
  Future<List<Booking>> getBookings({
    String? customerId,
    BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  });

  Future<Booking?> getBookingById(String bookingId);

  Future<List<Booking>> getCustomerBookings(
    String customerId, {
    BookingStatus? status,
    int? limit,
  });

  Future<List<Booking>> getUpcomingBookings(String customerId);

  Future<List<Booking>> getPastBookings(String customerId);

  // 予約の作成・更新
  Future<Booking> createBooking(BookingRequest request);

  Future<Booking> updateBooking(Booking booking);

  Future<void> cancelBooking(
    String bookingId, {
    String? reason,
    String? cancelledBy,
  });

  // 予約ステータスの更新
  Future<void> updateBookingStatus(
    String bookingId,
    BookingStatus status, {
    String? notes,
  });

  // コミュニケーション機能
  Future<void> addCommunicationMessage(
    String bookingId,
    CommunicationMessage message,
  );

  Future<List<CommunicationMessage>> getCommunicationMessages(
    String bookingId,
  );

  Future<void> markMessagesAsRead(
    String bookingId,
    List<String> messageIds,
  );

  // 評価機能
  Future<void> addBookingRating(
    String bookingId,
    BookingRating rating,
  );

  Future<void> updateBookingRating(
    String bookingId,
    BookingRating rating,
  );

  // サービスレポート
  Future<List<ServiceReport>> getServiceReports(String bookingId);

  Future<ServiceReport?> getServiceReportById(String reportId);

  // ストリーム監視
  Stream<List<Booking>> watchCustomerBookings(String customerId);

  Stream<Booking?> watchBooking(String bookingId);

  Stream<List<CommunicationMessage>> watchCommunicationMessages(
    String bookingId,
  );

  // 統計・分析
  Future<Map<String, int>> getBookingStatistics(String customerId);

  Future<List<Booking>> searchBookings({
    String? customerId,
    String? query,
    DateTimeRange? dateRange,
    List<BookingStatus>? statuses,
    List<ServiceType>? serviceTypes,
  });
}

class DateTimeRange {
  DateTimeRange({
    required this.start,
    required this.end,
  });

  final DateTime start;
  final DateTime end;
}
