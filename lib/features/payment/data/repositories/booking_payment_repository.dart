import '../../../../core/error/result.dart';
import '../../../../domain/entities/booking.dart';

abstract class BookingPaymentRepository {
  Future<Result<Booking>> getBooking(String bookingId);

  Future<Result<void>> updateBookingStatus({
    required String bookingId,
    required BookingStatus status,
    String? paymentIntentId,
  });
}
