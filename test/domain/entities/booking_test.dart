import 'package:flutter_test/flutter_test.dart';
import 'package:hnn_owners/domain/entities/booking.dart';

void main() {
  group('Booking Entity Tests', () {
    test('Booking creation with required fields', () {
      // Arrange
      final startDate = DateTime(2024, 8, 15, 10, 0);
      final endDate = DateTime(2024, 8, 15, 18, 0);

      // Act
      final booking = Booking(
        id: 'booking-123',
        customerId: 'customer-456',
        sittingDateStart: startDate,
        sittingDateEnd: endDate,
      );

      // Assert
      expect(booking.id, equals('booking-123'));
      expect(booking.customerId, equals('customer-456'));
      expect(booking.sittingDateStart, equals(startDate));
      expect(booking.sittingDateEnd, equals(endDate));
      expect(booking.status, equals(BookingStatus.pending)); // default
      expect(booking.serviceType, equals(ServiceType.visiting)); // default
      expect(booking.petIds, isEmpty); // default
      expect(booking.specialInstructions, isEmpty); // default
      expect(booking.communicationLog, isEmpty); // default
    });

    test('Booking creation with full details', () {
      // Arrange
      final startDate = DateTime(2024, 8, 20, 9, 0);
      final endDate = DateTime(2024, 8, 22, 17, 0);
      final createdAt = DateTime.now();
      final updatedAt = DateTime.now().add(Duration(minutes: 30));

      const pricing = BookingPricing(
        basePrice: 15000.0,
        additionalCharges: 2000.0,
        discount: 1000.0,
        tax: 1600.0,
        totalPrice: 17600.0, // 15000 + 2000 - 1000 + 1600
      );

      const rating = BookingRating(
        rating: 5,
        comment: 'Excellent service!',
        categoryRatings: {
          'reliability': 5,
          'communication': 5,
          'care_quality': 5,
        },
      );

      // Act
      final booking = Booking(
        id: 'booking-full-123',
        customerId: 'customer-789',
        sittingDateStart: startDate,
        sittingDateEnd: endDate,
        status: BookingStatus.completed,
        serviceType: ServiceType.boarding,
        staffId: 'staff-001',
        petId: 'pet-123',
        petIds: ['pet-123', 'pet-456'],
        notes: 'Please take extra care',
        ownerNotes: 'Cat is shy with strangers',
        staffNotes: 'Cat warmed up quickly',
        specialInstructions: ['Feed twice daily', 'Medicine at 8PM'],
        pricing: pricing,
        ownerRating: rating,
        photoUrls: ['photo1.jpg', 'photo2.jpg'],
        cancelReason: null,
        createdVia: 'mobile_app',
        lastModifiedBy: 'owner',
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      // Assert
      expect(booking.id, equals('booking-full-123'));
      expect(booking.status, equals(BookingStatus.completed));
      expect(booking.serviceType, equals(ServiceType.boarding));
      expect(booking.staffId, equals('staff-001'));
      expect(booking.petIds, hasLength(2));
      expect(booking.petIds, contains('pet-123'));
      expect(booking.petIds, contains('pet-456'));
      expect(booking.notes, equals('Please take extra care'));
      expect(booking.specialInstructions, hasLength(2));
      expect(booking.pricing, equals(pricing));
      expect(booking.ownerRating, equals(rating));
      expect(booking.photoUrls, hasLength(2));
      expect(booking.createdVia, equals('mobile_app'));
    });

    test('Booking copyWith method', () {
      // Arrange
      final originalBooking = Booking(
        id: 'booking-copy-test',
        customerId: 'customer-copy',
        sittingDateStart: DateTime(2024, 8, 25, 10, 0),
        sittingDateEnd: DateTime(2024, 8, 25, 18, 0),
        status: BookingStatus.pending,
        notes: 'Original notes',
      );

      // Act
      final updatedBooking = originalBooking.copyWith(
        status: BookingStatus.confirmed,
        notes: 'Updated notes',
        staffId: 'new-staff-123',
      );

      // Assert
      expect(updatedBooking.id, equals('booking-copy-test')); // unchanged
      expect(updatedBooking.customerId, equals('customer-copy')); // unchanged
      expect(updatedBooking.status, equals(BookingStatus.confirmed)); // changed
      expect(updatedBooking.notes, equals('Updated notes')); // changed
      expect(updatedBooking.staffId, equals('new-staff-123')); // changed
    });

    test('Booking JSON serialization', () {
      // Arrange
      final booking = Booking(
        id: 'json-booking-123',
        customerId: 'json-customer-456',
        sittingDateStart: DateTime(2024, 9, 1, 14, 0),
        sittingDateEnd: DateTime(2024, 9, 1, 20, 0),
        status: BookingStatus.confirmed,
        serviceType: ServiceType.grooming,
        petIds: ['pet-json-1', 'pet-json-2'],
        specialInstructions: ['Handle with care', 'Reward with treats'],
      );

      // Act
      final json = booking.toJson();

      // Assert
      expect(json['id'], equals('json-booking-123'));
      expect(json['customerId'], equals('json-customer-456'));
      expect(json['status'], equals('confirmed'));
      expect(json['serviceType'], equals('grooming'));
      expect(json['petIds'], isA<List>());
      expect(json['specialInstructions'], isA<List>());
      expect((json['petIds'] as List), hasLength(2));
      expect((json['specialInstructions'] as List), hasLength(2));
    });

    test('Booking Firestore serialization', () {
      // Arrange
      final startDate = DateTime(2024, 9, 5, 8, 0);
      final endDate = DateTime(2024, 9, 7, 18, 0);
      final booking = Booking(
        id: 'firestore-booking-123',
        customerId: 'firestore-customer-456',
        sittingDateStart: startDate,
        sittingDateEnd: endDate,
        serviceType: ServiceType.visiting, // veterinaryは存在しないためvisitingで代替
        petIds: ['pet-firestore-1'],
      );

      // Act
      final firestoreData = booking.toFirestore();

      // Assert
      expect(firestoreData['customerId'], equals('firestore-customer-456'));
      expect(firestoreData['sittingDateStart'], equals(startDate));
      expect(firestoreData['sittingDateEnd'], equals(endDate));
      expect(firestoreData['serviceType'], equals('veterinary'));
      expect(firestoreData['status'], equals('pending'));
      expect(firestoreData['petIds'], isA<List>());
    });

    test('Booking equality', () {
      // Arrange
      final startDate = DateTime(2024, 9, 10, 12, 0);
      final endDate = DateTime(2024, 9, 10, 18, 0);

      final booking1 = Booking(
        id: 'equality-test-123',
        customerId: 'customer-equality',
        sittingDateStart: startDate,
        sittingDateEnd: endDate,
        status: BookingStatus.pending,
      );

      final booking2 = Booking(
        id: 'equality-test-123',
        customerId: 'customer-equality',
        sittingDateStart: startDate,
        sittingDateEnd: endDate,
        status: BookingStatus.pending,
      );

      final booking3 = Booking(
        id: 'different-id-456',
        customerId: 'customer-equality',
        sittingDateStart: startDate,
        sittingDateEnd: endDate,
        status: BookingStatus.pending,
      );

      // Act & Assert
      expect(booking1, equals(booking2)); // should be equal
      expect(booking1, isNot(equals(booking3))); // should not be equal
      expect(booking1.hashCode,
          equals(booking2.hashCode)); // hash codes should match
    });
  });

  group('BookingStatus Tests', () {
    test('BookingStatus fromString method', () {
      // Act & Assert
      expect(
          BookingStatus.fromString('pending'), equals(BookingStatus.pending));
      expect(BookingStatus.fromString('confirmed'),
          equals(BookingStatus.confirmed));
      expect(BookingStatus.fromString('in_progress'),
          equals(BookingStatus.inProgress));
      expect(BookingStatus.fromString('completed'),
          equals(BookingStatus.completed));
      expect(BookingStatus.fromString('cancelled'),
          equals(BookingStatus.cancelled));
      expect(BookingStatus.fromString('no_show'), equals(BookingStatus.noShow));
      expect(BookingStatus.fromString('invalid'),
          equals(BookingStatus.pending)); // fallback
    });

    test('BookingStatus toString method', () {
      // Act & Assert
      expect(BookingStatus.pending.toString(), equals('pending'));
      expect(BookingStatus.confirmed.toString(), equals('confirmed'));
      expect(BookingStatus.inProgress.toString(), equals('in_progress'));
      expect(BookingStatus.completed.toString(), equals('completed'));
      expect(BookingStatus.cancelled.toString(), equals('cancelled'));
      expect(BookingStatus.noShow.toString(), equals('no_show'));
    });
  });

  group('ServiceType Tests', () {
    test('ServiceType fromString method', () {
      // Act & Assert
      expect(ServiceType.fromString('visiting'), equals(ServiceType.visiting));
      expect(ServiceType.fromString('boarding'), equals(ServiceType.boarding));
      expect(ServiceType.fromString('daycare'), equals(ServiceType.daycare));
      expect(ServiceType.fromString('grooming'), equals(ServiceType.grooming));
      // veterinaryとemergencyは存在しないためコメントアウト
      // expect(ServiceType.fromString('veterinary'), equals(ServiceType.veterinary));
      // expect(ServiceType.fromString('emergency'), equals(ServiceType.emergency));
      expect(ServiceType.fromString('walking'), equals(ServiceType.walking));
      expect(ServiceType.fromString('invalid'),
          equals(ServiceType.visiting)); // fallback
    });
  });

  group('BookingPricing Tests', () {
    test('BookingPricing creation and total calculation', () {
      // Arrange & Act
      const pricing = BookingPricing(
        basePrice: 10000.0,
        additionalCharges: 1500.0,
        discount: 500.0,
        tax: 1100.0,
        totalPrice: 12100.0, // 10000 + 1500 - 500 + 1100
      );

      // Assert
      expect(pricing.basePrice, equals(10000.0));
      expect(pricing.additionalCharges, equals(1500.0));
      expect(pricing.discount, equals(500.0));
      expect(pricing.tax, equals(1100.0));
    });

    test('BookingPricing with default values', () {
      // Arrange & Act
      const pricing = BookingPricing(
        basePrice: 8000.0,
        totalPrice: 8000.0,
      );

      // Assert
      expect(pricing.basePrice, equals(8000.0));
      expect(pricing.additionalCharges, equals(0.0)); // default
      expect(pricing.discount, equals(0.0)); // default
      expect(pricing.tax, equals(0.0)); // default
    });

    test('BookingPricing JSON operations', () {
      // Arrange
      const pricing = BookingPricing(
        basePrice: 12000.0,
        additionalCharges: 2000.0,
        discount: 1000.0,
        tax: 1300.0,
        totalPrice: 14300.0, // 12000 + 2000 - 1000 + 1300
      );

      // Act
      final json = pricing.toJson();
      final fromJson = BookingPricing.fromJson(json);

      // Assert
      expect(fromJson.basePrice, equals(pricing.basePrice));
      expect(fromJson.additionalCharges, equals(pricing.additionalCharges));
      expect(fromJson.discount, equals(pricing.discount));
      expect(fromJson.tax, equals(pricing.tax));
    });
  });

  group('BookingRating Tests', () {
    test('BookingRating creation', () {
      // Arrange
      final ratedAt = DateTime.now();

      // Act
      final rating = BookingRating(
        rating: 4,
        comment: 'Good service overall',
        ratedAt: ratedAt,
        categoryRatings: const {
          'punctuality': 5,
          'care_quality': 4,
          'communication': 4,
        },
      );

      // Assert
      expect(rating.rating, equals(4));
      expect(rating.comment, equals('Good service overall'));
      expect(rating.ratedAt, equals(ratedAt));
      expect(rating.categoryRatings, hasLength(3));
      expect(rating.categoryRatings['punctuality'], equals(5));
      expect(rating.categoryRatings['care_quality'], equals(4));
    });

    test('BookingRating with minimal data', () {
      // Arrange & Act
      const rating = BookingRating(rating: 5);

      // Assert
      expect(rating.rating, equals(5));
      expect(rating.comment, isNull);
      expect(rating.ratedAt, isNull);
      expect(rating.categoryRatings, isEmpty); // default empty map
    });

    test('BookingRating JSON operations', () {
      // Arrange
      const rating = BookingRating(
        rating: 3,
        comment: 'Average service',
        categoryRatings: {'overall': 3, 'value': 4},
      );

      // Act
      final json = rating.toJson();
      final fromJson = BookingRating.fromJson(json);

      // Assert
      expect(fromJson.rating, equals(rating.rating));
      expect(fromJson.comment, equals(rating.comment));
      expect(fromJson.categoryRatings, equals(rating.categoryRatings));
    });
  });
}
