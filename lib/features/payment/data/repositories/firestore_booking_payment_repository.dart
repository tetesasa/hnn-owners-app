import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'booking_payment_repository.dart';
import '../../../../core/error/result.dart';
import '../../../../domain/entities/booking.dart';

part 'firestore_booking_payment_repository.g.dart';

class FirestoreBookingPaymentRepository implements BookingPaymentRepository {
  final FirebaseFirestore _firestore;

  FirestoreBookingPaymentRepository({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<Booking>> getBooking(String bookingId) async {
    try {
      final doc = await _firestore.collection('BOOKING').doc(bookingId).get();

      if (!doc.exists) {
        return Result.failure(const AppError.validation(
          message: '指定された予約が見つかりません',
          field: 'bookingId',
        ));
      }

      final data = doc.data()!;
      final booking = Booking.fromFirestore({...data, 'ID': doc.id});

      return Result.success(booking);
    } on FirebaseException catch (e) {
      return Result.failure(AppError.network(
        message: 'データベースエラーが発生しました: ${e.message}',
        code: e.code,
        exception: e,
      ));
    } catch (e) {
      return Result.failure(AppError.unknown(
        message: '予約の取得中にエラーが発生しました',
        exception: e is Exception ? e : Exception(e.toString()),
      ));
    }
  }

  @override
  Future<Result<void>> updateBookingStatus({
    required String bookingId,
    required BookingStatus status,
    String? paymentIntentId,
  }) async {
    try {
      final updateData = <String, dynamic>{
        'status': status.name,
        'updatedAt': FieldValue.serverTimestamp(),
      };

      if (paymentIntentId != null) {
        updateData['paymentIntentId'] = paymentIntentId;
        updateData['paidAt'] = FieldValue.serverTimestamp();
      }

      await _firestore.collection('BOOKING').doc(bookingId).update(updateData);

      return const Result.success(null);
    } on FirebaseException catch (e) {
      return Result.failure(AppError.network(
        message: 'データベースエラーが発生しました: ${e.message}',
        code: e.code,
        exception: e,
      ));
    } catch (e) {
      return Result.failure(AppError.unknown(
        message: '予約ステータスの更新中にエラーが発生しました',
        exception: e is Exception ? e : Exception(e.toString()),
      ));
    }
  }
}

@riverpod
BookingPaymentRepository bookingPaymentRepository(
  Ref ref,
) {
  return FirestoreBookingPaymentRepository();
}
