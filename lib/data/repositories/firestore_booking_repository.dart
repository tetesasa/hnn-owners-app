import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/booking.dart';
import '../../domain/repositories/booking_repository.dart';

class FirestoreBookingRepository implements BookingRepository {
  FirestoreBookingRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  static const String _bookingsCollection = 'BOOKINGS';
  static const String _serviceReportsCollection = 'SERVICE_REPORTS';

  @override
  Future<List<Booking>> getBookings({
    String? customerId,
    BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  }) async {
    try {
      Query query = _firestore.collection(_bookingsCollection);

      if (customerId != null) {
        query = query.where('customerId', isEqualTo: customerId);
      }

      if (status != null) {
        query = query.where('status', isEqualTo: status.value);
      }

      if (startDate != null) {
        query =
            query.where('sittingDateStart', isGreaterThanOrEqualTo: startDate);
      }

      if (endDate != null) {
        query = query.where('sittingDateEnd', isLessThanOrEqualTo: endDate);
      }

      query = query.orderBy('sittingDateStart', descending: true);

      if (limit != null) {
        query = query.limit(limit);
      }

      final snapshot = await query.get();

      return snapshot.docs
          .map((doc) =>
              Booking.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('予約の取得に失敗しました: $e');
    }
  }

  @override
  Future<Booking?> getBookingById(String bookingId) async {
    try {
      final doc =
          await _firestore.collection(_bookingsCollection).doc(bookingId).get();

      if (!doc.exists || doc.data() == null) return null;

      return Booking.fromFirestore(doc.data()!);
    } catch (e) {
      throw Exception('予約詳細の取得に失敗しました: $e');
    }
  }

  @override
  Future<List<Booking>> getCustomerBookings(
    String customerId, {
    BookingStatus? status,
    int? limit,
  }) async {
    return getBookings(
      customerId: customerId,
      status: status,
      limit: limit,
    );
  }

  @override
  Future<List<Booking>> getUpcomingBookings(String customerId) async {
    final now = DateTime.now();
    return getBookings(
      customerId: customerId,
      startDate: now,
      limit: 50,
    );
  }

  @override
  Future<List<Booking>> getPastBookings(String customerId) async {
    final now = DateTime.now();
    try {
      final query = _firestore
          .collection(_bookingsCollection)
          .where('customerId', isEqualTo: customerId)
          .where('sittingDateEnd', isLessThan: now)
          .orderBy('sittingDateEnd', descending: true)
          .limit(50);

      final snapshot = await query.get();

      return snapshot.docs
          .map((doc) => Booking.fromFirestore(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('過去の予約取得に失敗しました: $e');
    }
  }

  @override
  Future<Booking> createBooking(BookingRequest request) async {
    try {
      final docRef = _firestore.collection(_bookingsCollection).doc();

      final booking = Booking(
        id: docRef.id,
        customerId: request.customerId,
        sittingDateStart: request.startDate,
        sittingDateEnd: request.endDate,
        serviceType: request.serviceType,
        petIds: request.petIds,
        ownerNotes: request.notes,
        specialInstructions: request.specialInstructions,
        status: BookingStatus.pending,
        createdVia: 'owner_app',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await docRef.set(booking.toFirestore());

      return booking;
    } catch (e) {
      throw Exception('予約の作成に失敗しました: $e');
    }
  }

  @override
  Future<Booking> updateBooking(Booking booking) async {
    try {
      final updatedBooking = booking.copyWith(
        updatedAt: DateTime.now(),
      );

      await _firestore
          .collection(_bookingsCollection)
          .doc(booking.id)
          .update(updatedBooking.toFirestore());

      return updatedBooking;
    } catch (e) {
      throw Exception('予約の更新に失敗しました: $e');
    }
  }

  @override
  Future<void> cancelBooking(
    String bookingId, {
    String? reason,
    String? cancelledBy,
  }) async {
    try {
      await _firestore.collection(_bookingsCollection).doc(bookingId).update({
        'status': BookingStatus.cancelled.value,
        'cancelReason': reason,
        'lastModifiedBy': cancelledBy,
        'updatedAt': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('予約のキャンセルに失敗しました: $e');
    }
  }

  @override
  Future<void> updateBookingStatus(
    String bookingId,
    BookingStatus status, {
    String? notes,
  }) async {
    try {
      final updateData = <String, dynamic>{
        'status': status.value,
        'updatedAt': DateTime.now().toIso8601String(),
      };

      if (notes != null) {
        updateData['staffNotes'] = notes;
      }

      await _firestore
          .collection(_bookingsCollection)
          .doc(bookingId)
          .update(updateData);
    } catch (e) {
      throw Exception('予約ステータスの更新に失敗しました: $e');
    }
  }

  @override
  Future<void> addCommunicationMessage(
    String bookingId,
    CommunicationMessage message,
  ) async {
    try {
      await _firestore.collection(_bookingsCollection).doc(bookingId).update({
        'communicationLog': FieldValue.arrayUnion([message.toJson()]),
        'updatedAt': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('メッセージの送信に失敗しました: $e');
    }
  }

  @override
  Future<List<CommunicationMessage>> getCommunicationMessages(
    String bookingId,
  ) async {
    try {
      final booking = await getBookingById(bookingId);
      return booking?.communicationLog ?? [];
    } catch (e) {
      throw Exception('メッセージの取得に失敗しました: $e');
    }
  }

  @override
  Future<void> markMessagesAsRead(
    String bookingId,
    List<String> messageIds,
  ) async {
    try {
      final booking = await getBookingById(bookingId);
      if (booking == null) return;

      final updatedMessages = booking.communicationLog.map((message) {
        if (messageIds.contains(message.id)) {
          return message.copyWith(isRead: true);
        }
        return message;
      }).toList();

      await _firestore.collection(_bookingsCollection).doc(bookingId).update({
        'communicationLog': updatedMessages.map((e) => e.toJson()).toList(),
        'updatedAt': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('メッセージの既読更新に失敗しました: $e');
    }
  }

  @override
  Future<void> addBookingRating(
    String bookingId,
    BookingRating rating,
  ) async {
    try {
      await _firestore.collection(_bookingsCollection).doc(bookingId).update({
        'ownerRating': rating.toJson(),
        'updatedAt': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('評価の追加に失敗しました: $e');
    }
  }

  @override
  Future<void> updateBookingRating(
    String bookingId,
    BookingRating rating,
  ) async {
    return addBookingRating(bookingId, rating);
  }

  @override
  Future<List<ServiceReport>> getServiceReports(String bookingId) async {
    try {
      final query = _firestore
          .collection(_serviceReportsCollection)
          .where('bookingId', isEqualTo: bookingId)
          .orderBy('reportDate', descending: true);

      final snapshot = await query.get();

      return snapshot.docs
          .map((doc) => ServiceReport.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('サービスレポートの取得に失敗しました: $e');
    }
  }

  @override
  Future<ServiceReport?> getServiceReportById(String reportId) async {
    try {
      final doc = await _firestore
          .collection(_serviceReportsCollection)
          .doc(reportId)
          .get();

      if (!doc.exists || doc.data() == null) return null;

      return ServiceReport.fromJson(doc.data()!);
    } catch (e) {
      throw Exception('サービスレポート詳細の取得に失敗しました: $e');
    }
  }

  @override
  Stream<List<Booking>> watchCustomerBookings(String customerId) {
    return _firestore
        .collection(_bookingsCollection)
        .where('customerId', isEqualTo: customerId)
        .orderBy('sittingDateStart', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Booking.fromFirestore(doc.data()))
            .toList());
  }

  @override
  Stream<Booking?> watchBooking(String bookingId) {
    return _firestore
        .collection(_bookingsCollection)
        .doc(bookingId)
        .snapshots()
        .map((doc) {
      if (!doc.exists || doc.data() == null) return null;
      return Booking.fromFirestore(doc.data()!);
    });
  }

  @override
  Stream<List<CommunicationMessage>> watchCommunicationMessages(
    String bookingId,
  ) {
    return watchBooking(bookingId).map((booking) {
      return booking?.communicationLog ?? [];
    });
  }

  @override
  Future<Map<String, int>> getBookingStatistics(String customerId) async {
    try {
      final allBookings = await getCustomerBookings(customerId);

      final stats = <String, int>{
        'total': allBookings.length,
        'pending': 0,
        'confirmed': 0,
        'completed': 0,
        'cancelled': 0,
      };

      for (final booking in allBookings) {
        stats[booking.status.value] = (stats[booking.status.value] ?? 0) + 1;
      }

      return stats;
    } catch (e) {
      throw Exception('予約統計の取得に失敗しました: $e');
    }
  }

  @override
  Future<List<Booking>> searchBookings({
    String? customerId,
    String? query,
    DateTimeRange? dateRange,
    List<BookingStatus>? statuses,
    List<ServiceType>? serviceTypes,
  }) async {
    try {
      Query firestoreQuery = _firestore.collection(_bookingsCollection);

      if (customerId != null) {
        firestoreQuery =
            firestoreQuery.where('customerId', isEqualTo: customerId);
      }

      if (statuses != null && statuses.isNotEmpty) {
        final statusValues = statuses.map((s) => s.value).toList();
        firestoreQuery = firestoreQuery.where('status', whereIn: statusValues);
      }

      if (serviceTypes != null && serviceTypes.isNotEmpty) {
        final typeValues = serviceTypes.map((t) => t.value).toList();
        firestoreQuery =
            firestoreQuery.where('serviceType', whereIn: typeValues);
      }

      if (dateRange != null) {
        firestoreQuery = firestoreQuery
            .where('sittingDateStart', isGreaterThanOrEqualTo: dateRange.start)
            .where('sittingDateEnd', isLessThanOrEqualTo: dateRange.end);
      }

      firestoreQuery =
          firestoreQuery.orderBy('sittingDateStart', descending: true);

      final snapshot = await firestoreQuery.get();
      var bookings = snapshot.docs
          .map((doc) =>
              Booking.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();

      // クライアントサイドでクエリフィルタリング（Firestoreの制限回避）
      if (query != null && query.isNotEmpty) {
        final lowercaseQuery = query.toLowerCase();
        bookings = bookings.where((booking) {
          return booking.ownerNotes?.toLowerCase().contains(lowercaseQuery) ==
                  true ||
              booking.notes?.toLowerCase().contains(lowercaseQuery) == true ||
              booking.specialInstructions.any((instruction) =>
                  instruction.toLowerCase().contains(lowercaseQuery));
        }).toList();
      }

      return bookings;
    } catch (e) {
      throw Exception('予約検索に失敗しました: $e');
    }
  }
}
