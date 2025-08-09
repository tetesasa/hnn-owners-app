// ignore_for_file: subtype_of_sealed_class

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hnn_owners/data/repositories/firestore_booking_repository.dart';
import 'package:hnn_owners/domain/entities/booking.dart';

// Mock classes
class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

class MockDocumentReference extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

class MockDocumentSnapshot extends Mock
    implements DocumentSnapshot<Map<String, dynamic>> {}

class MockQuerySnapshot extends Mock
    implements QuerySnapshot<Map<String, dynamic>> {}

class MockQueryDocumentSnapshot extends Mock
    implements QueryDocumentSnapshot<Map<String, dynamic>> {}

class MockQuery extends Mock implements Query<Map<String, dynamic>> {}

// Fake classes for registerFallbackValue
class FakeBookingRequest extends Fake implements BookingRequest {}

class FakeBooking extends Fake implements Booking {}

void main() {
  late FirestoreBookingRepository repository;
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference mockCollection;
  late MockDocumentReference mockDocument;

  setUpAll(() {
    registerFallbackValue(FakeBookingRequest());
    registerFallbackValue(FakeBooking());
    registerFallbackValue(<String, dynamic>{});
  });

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockCollection = MockCollectionReference();
    mockDocument = MockDocumentReference();

    repository = FirestoreBookingRepository(firestore: mockFirestore);

    // Default setup for collection and document references
    when(() => mockFirestore.collection('bookings')).thenReturn(mockCollection);
    when(() => mockCollection.doc()).thenReturn(mockDocument);
    when(() => mockCollection.doc(any())).thenReturn(mockDocument);
    when(() => mockDocument.id).thenReturn('test-booking-id');
  });

  group('FirestoreBookingRepository Tests', () {
    group('createBooking', () {
      test('should create booking successfully', () async {
        // Arrange
        final request = BookingRequest(
          customerId: 'customer-123',
          startDate: DateTime(2024, 8, 15, 10, 0),
          endDate: DateTime(2024, 8, 15, 18, 0),
          serviceType: ServiceType.visiting,
          petIds: ['pet-1', 'pet-2'],
          notes: 'Test booking',
        );

        when(() => mockDocument.set(any())).thenAnswer((_) async {});

        // Act
        final result = await repository.createBooking(request);

        // Assert
        expect(result.id, equals('test-booking-id'));
        expect(result.customerId, equals('customer-123'));
        expect(result.serviceType, equals(ServiceType.visiting));
        expect(result.petIds, equals(['pet-1', 'pet-2']));
        expect(result.status, equals(BookingStatus.pending));

        verify(() => mockFirestore.collection('bookings')).called(1);
        verify(() => mockCollection.doc()).called(1);
        verify(() => mockDocument.set(any())).called(1);
      });

      test('should throw exception when creation fails', () async {
        // Arrange
        final request = BookingRequest(
          customerId: 'customer-123',
          startDate: DateTime(2024, 8, 15, 10, 0),
          endDate: DateTime(2024, 8, 15, 18, 0),
          serviceType: ServiceType.visiting,
          petIds: ['pet-1'],
        );

        when(() => mockDocument.set(any())).thenThrow(FirebaseException(
          plugin: 'cloud_firestore',
          code: 'permission-denied',
          message: 'Permission denied',
        ));

        // Act & Assert
        await expectLater(
          () => repository.createBooking(request),
          throwsA(predicate(
              (e) => e is Exception && e.toString().contains('予約作成に失敗しました'))),
        );
      });
    });

    group('getBookingById', () {
      test('should return booking when document exists', () async {
        // Arrange
        const bookingId = 'booking-123';
        final mockSnapshot = MockDocumentSnapshot();

        final bookingData = {
          'ID': bookingId,
          'customerId': 'customer-123',
          'sittingDateStart': DateTime(2024, 8, 15, 10, 0).toIso8601String(),
          'sittingDateEnd': DateTime(2024, 8, 15, 18, 0).toIso8601String(),
          'serviceType': 'visiting',
          'petIds': ['pet-1'],
          'status': 'pending',
          'createdAt': DateTime.now().toIso8601String(),
        };

        when(() => mockDocument.get()).thenAnswer((_) async => mockSnapshot);
        when(() => mockSnapshot.exists).thenReturn(true);
        when(() => mockSnapshot.data()).thenReturn(bookingData);

        // Act
        final result = await repository.getBookingById(bookingId);

        // Assert
        expect(result, isNotNull);
        expect(result!.id, equals(bookingId));
        expect(result.customerId, equals('customer-123'));
        expect(result.serviceType, equals(ServiceType.visiting));

        verify(() => mockCollection.doc(bookingId)).called(1);
        verify(() => mockDocument.get()).called(1);
      });

      test('should return null when document does not exist', () async {
        // Arrange
        const bookingId = 'nonexistent-booking';
        final mockSnapshot = MockDocumentSnapshot();

        when(() => mockDocument.get()).thenAnswer((_) async => mockSnapshot);
        when(() => mockSnapshot.exists).thenReturn(false);

        // Act
        final result = await repository.getBookingById(bookingId);

        // Assert
        expect(result, isNull);
        verify(() => mockCollection.doc(bookingId)).called(1);
        verify(() => mockDocument.get()).called(1);
      });

      test('should throw exception when get fails', () async {
        // Arrange
        const bookingId = 'error-booking';

        when(() => mockDocument.get()).thenThrow(FirebaseException(
          plugin: 'cloud_firestore',
          code: 'unavailable',
          message: 'Service unavailable',
        ));

        // Act & Assert
        await expectLater(
          () => repository.getBookingById(bookingId),
          throwsA(predicate(
              (e) => e is Exception && e.toString().contains('予約取得に失敗しました'))),
        );
      });
    });

    group('updateBooking', () {
      test('should update booking successfully', () async {
        // Arrange
        final booking = Booking(
          id: 'booking-123',
          customerId: 'customer-123',
          sittingDateStart: DateTime(2024, 8, 15, 10, 0),
          sittingDateEnd: DateTime(2024, 8, 15, 18, 0),
          status: BookingStatus.confirmed,
          serviceType: ServiceType.visiting,
          petIds: ['pet-1'],
          notes: 'Updated notes',
        );

        when(() => mockDocument.update(any())).thenAnswer((_) async {});

        // Act
        final result = await repository.updateBooking(booking);

        // Assert
        expect(result, equals(booking));
        verify(() => mockCollection.doc('booking-123')).called(1);
        verify(() => mockDocument.update(any())).called(1);
      });

      test('should throw exception when update fails', () async {
        // Arrange
        final booking = Booking(
          id: 'booking-123',
          customerId: 'customer-123',
          sittingDateStart: DateTime(2024, 8, 15, 10, 0),
          sittingDateEnd: DateTime(2024, 8, 15, 18, 0),
        );

        when(() => mockDocument.update(any())).thenThrow(FirebaseException(
          plugin: 'cloud_firestore',
          code: 'not-found',
          message: 'Document not found',
        ));

        // Act & Assert
        await expectLater(
          () => repository.updateBooking(booking),
          throwsA(predicate(
              (e) => e is Exception && e.toString().contains('予約更新に失敗しました'))),
        );
      });
    });

    group('getBookings', () {
      test('should return customer bookings successfully', () async {
        // Arrange
        const customerId = 'customer-123';
        final mockQuery = MockQuery();
        final mockQuerySnapshot = MockQuerySnapshot();
        final mockQueryDoc = MockQueryDocumentSnapshot();

        final bookingData = {
          'ID': 'booking-1',
          'customerId': customerId,
          'sittingDateStart': DateTime(2024, 8, 15, 10, 0).toIso8601String(),
          'sittingDateEnd': DateTime(2024, 8, 15, 18, 0).toIso8601String(),
          'serviceType': 'visiting',
          'status': 'pending',
          'petIds': ['pet-1'],
        };

        when(() => mockCollection.where('customerId', isEqualTo: customerId))
            .thenReturn(mockQuery);
        when(() => mockQuery.orderBy('sittingDateStart', descending: true))
            .thenReturn(mockQuery);
        when(() => mockQuery.get()).thenAnswer((_) async => mockQuerySnapshot);
        when(() => mockQuerySnapshot.docs).thenReturn([mockQueryDoc]);
        when(() => mockQueryDoc.data()).thenReturn(bookingData);

        // Act
        final result = await repository.getBookings(customerId: customerId);

        // Assert
        expect(result, hasLength(1));
        expect(result.first.id, equals('booking-1'));
        expect(result.first.customerId, equals(customerId));

        verify(() => mockCollection.where('customerId', isEqualTo: customerId))
            .called(1);
        verify(() => mockQuery.get()).called(1);
      });

      test('should return empty list when no bookings found', () async {
        // Arrange
        const customerId = 'customer-no-bookings';
        final mockQuery = MockQuery();
        final mockQuerySnapshot = MockQuerySnapshot();

        when(() => mockCollection.where('customerId', isEqualTo: customerId))
            .thenReturn(mockQuery);
        when(() => mockQuery.orderBy('sittingDateStart', descending: true))
            .thenReturn(mockQuery);
        when(() => mockQuery.get()).thenAnswer((_) async => mockQuerySnapshot);
        when(() => mockQuerySnapshot.docs).thenReturn([]);

        // Act
        final result = await repository.getBookings(customerId: customerId);

        // Assert
        expect(result, isEmpty);
      });

      test('should throw exception when query fails', () async {
        // Arrange
        const customerId = 'error-customer';
        final mockQuery = MockQuery();

        when(() => mockCollection.where('customerId', isEqualTo: customerId))
            .thenReturn(mockQuery);
        when(() => mockQuery.orderBy('sittingDateStart', descending: true))
            .thenReturn(mockQuery);
        when(() => mockQuery.get()).thenThrow(FirebaseException(
          plugin: 'cloud_firestore',
          code: 'unavailable',
          message: 'Service unavailable',
        ));

        // Act & Assert
        await expectLater(
          () => repository.getBookings(customerId: customerId),
          throwsA(predicate(
              (e) => e is Exception && e.toString().contains('予約一覧取得に失敗しました'))),
        );
      });
    });

    group('cancelBooking', () {
      test('should cancel booking successfully', () async {
        // Arrange
        const bookingId = 'booking-123';
        const reason = 'Customer requested cancellation';

        when(() => mockDocument.update(any())).thenAnswer((_) async {});

        // Act & Assert
        await expectLater(
          () => repository.cancelBooking(bookingId, reason: reason),
          returnsNormally,
        );

        verify(() => mockCollection.doc(bookingId)).called(1);
        verify(() => mockDocument.update(any())).called(1);
      });

      test('should throw exception when cancellation fails', () async {
        // Arrange
        const bookingId = 'booking-123';
        const reason = 'Cancel reason';

        when(() => mockDocument.update(any())).thenThrow(FirebaseException(
          plugin: 'cloud_firestore',
          code: 'not-found',
          message: 'Document not found',
        ));

        // Act & Assert
        await expectLater(
          () => repository.cancelBooking(bookingId, reason: reason),
          throwsA(predicate((e) =>
              e is Exception && e.toString().contains('予約キャンセルに失敗しました'))),
        );
      });
    });
  });
}
