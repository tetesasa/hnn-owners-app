import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hnn_owners/application/usecases/create_booking_usecase.dart';
import 'package:hnn_owners/domain/entities/booking.dart';
import 'package:hnn_owners/domain/entities/pet.dart';
import 'package:hnn_owners/domain/repositories/booking_repository.dart';
import 'package:hnn_owners/domain/repositories/pet_repository.dart';

// Mock classes
class MockBookingRepository extends Mock implements BookingRepository {}

class MockPetRepository extends Mock implements PetRepository {}

void main() {
  late CreateBookingUseCase createBookingUseCase;
  late MockBookingRepository mockBookingRepository;
  late MockPetRepository mockPetRepository;

  setUpAll(() {
    // Register fallback values for mocktail
    registerFallbackValue(
      BookingRequest(
        customerId: 'fallback-customer',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(hours: 1)),
        serviceType: ServiceType.visiting,
        petIds: [],
      ),
    );
  });

  setUp(() {
    mockBookingRepository = MockBookingRepository();
    mockPetRepository = MockPetRepository();
    createBookingUseCase = CreateBookingUseCase(
      bookingRepository: mockBookingRepository,
      petRepository: mockPetRepository,
    );
  });

  group('CreateBookingUseCase Tests', () {
    final futureDateTime = DateTime.now().add(Duration(days: 1));
    final endDateTime = futureDateTime.add(Duration(hours: 3));

    test('should create booking successfully with valid request', () async {
      // Arrange
      final request = BookingRequest(
        customerId: 'customer-123',
        startDate: futureDateTime,
        endDate: endDateTime,
        serviceType: ServiceType.visiting,
        petIds: ['pet-1'],
      );

      final mockPet = Pet(
        id: 'pet-1',
        customerId: 'customer-123',
        name: 'Test Pet',
        type: PetType.cat,
        breed: 'Test Breed',
      );

      final expectedBooking = Booking(
        id: 'booking-123',
        customerId: 'customer-123',
        sittingDateStart: futureDateTime,
        sittingDateEnd: endDateTime,
        serviceType: ServiceType.visiting,
        petIds: ['pet-1'],
      );

      when(() => mockPetRepository.getPetById('pet-1'))
          .thenAnswer((_) async => mockPet);
      when(() => mockBookingRepository.createBooking(request))
          .thenAnswer((_) async => expectedBooking);

      // Act
      final result = await createBookingUseCase.call(request);

      // Assert
      expect(result, equals(expectedBooking));
      verify(() => mockPetRepository.getPetById('pet-1')).called(1);
      verify(() => mockBookingRepository.createBooking(request)).called(1);
    });

    test('should throw exception when start date is after end date', () async {
      // Arrange
      final request = BookingRequest(
        customerId: 'customer-123',
        startDate: endDateTime, // After end date
        endDate: futureDateTime, // Before start date
        serviceType: ServiceType.visiting,
        petIds: ['pet-1'],
      );

      // Act & Assert
      await expectLater(
        () => createBookingUseCase.call(request),
        throwsA(
          predicate((e) =>
              e is BookingValidationException &&
              e.message == '開始日は終了日より前に設定してください'),
        ),
      );

      verifyNever(() => mockPetRepository.getPetById(any()));
      verifyNever(() => mockBookingRepository.createBooking(any()));
    });

    test('should throw exception when start date is in the past', () async {
      // Arrange
      final pastDateTime = DateTime.now().subtract(Duration(hours: 1));
      final request = BookingRequest(
        customerId: 'customer-123',
        startDate: pastDateTime,
        endDate: pastDateTime.add(Duration(hours: 2)),
        serviceType: ServiceType.visiting,
        petIds: ['pet-1'],
      );

      // Act & Assert
      await expectLater(
        () => createBookingUseCase.call(request),
        throwsA(
          predicate((e) =>
              e is BookingValidationException &&
              e.message == '開始日は現在時刻より後に設定してください'),
        ),
      );

      verifyNever(() => mockPetRepository.getPetById(any()));
      verifyNever(() => mockBookingRepository.createBooking(any()));
    });

    test('should throw exception when no pets are selected', () async {
      // Arrange
      final request = BookingRequest(
        customerId: 'customer-123',
        startDate: futureDateTime,
        endDate: endDateTime,
        serviceType: ServiceType.visiting,
        petIds: [], // Empty list
      );

      // Act & Assert
      await expectLater(
        () => createBookingUseCase.call(request),
        throwsA(
          predicate((e) =>
              e is BookingValidationException &&
              e.message == '少なくとも1匹のペットを選択してください'),
        ),
      );

      verifyNever(() => mockPetRepository.getPetById(any()));
      verifyNever(() => mockBookingRepository.createBooking(any()));
    });

    test('should throw exception when pet does not exist', () async {
      // Arrange
      final request = BookingRequest(
        customerId: 'customer-123',
        startDate: futureDateTime,
        endDate: endDateTime,
        serviceType: ServiceType.visiting,
        petIds: ['nonexistent-pet'],
      );

      when(() => mockPetRepository.getPetById('nonexistent-pet'))
          .thenAnswer((_) async => null);

      // Act & Assert
      await expectLater(
        () => createBookingUseCase.call(request),
        throwsA(
          predicate((e) =>
              e is BookingValidationException &&
              e.message == '選択されたペット（ID: nonexistent-pet）が見つかりません'),
        ),
      );

      verify(() => mockPetRepository.getPetById('nonexistent-pet')).called(1);
      verifyNever(() => mockBookingRepository.createBooking(any()));
    });

    test('should throw exception when pet belongs to different customer',
        () async {
      // Arrange
      final request = BookingRequest(
        customerId: 'customer-123',
        startDate: futureDateTime,
        endDate: endDateTime,
        serviceType: ServiceType.visiting,
        petIds: ['pet-1'],
      );

      final mockPet = Pet(
        id: 'pet-1',
        customerId: 'different-customer', // Different customer
        name: 'Test Pet',
        type: PetType.cat,
        breed: 'Test Breed',
      );

      when(() => mockPetRepository.getPetById('pet-1'))
          .thenAnswer((_) async => mockPet);

      // Act & Assert
      await expectLater(
        () => createBookingUseCase.call(request),
        throwsA(
          predicate((e) =>
              e is BookingValidationException &&
              e.message == '他のお客様のペットは予約できません'),
        ),
      );

      verify(() => mockPetRepository.getPetById('pet-1')).called(1);
      verifyNever(() => mockBookingRepository.createBooking(any()));
    });

    test('should validate multiple pets correctly', () async {
      // Arrange
      final request = BookingRequest(
        customerId: 'customer-123',
        startDate: futureDateTime,
        endDate: endDateTime,
        serviceType: ServiceType.visiting,
        petIds: ['pet-1', 'pet-2'],
      );

      final mockPet1 = Pet(
        id: 'pet-1',
        customerId: 'customer-123',
        name: 'Pet 1',
        type: PetType.cat,
        breed: 'Breed 1',
        birthDate: DateTime(2021, 1, 1), // 3歳相当
      );

      final mockPet2 = Pet(
        id: 'pet-2',
        customerId: 'customer-123',
        name: 'Pet 2',
        type: PetType.dog,
        breed: 'Breed 2',
      );

      final expectedBooking = Booking(
        id: 'booking-123',
        customerId: 'customer-123',
        sittingDateStart: futureDateTime,
        sittingDateEnd: endDateTime,
        serviceType: ServiceType.visiting,
        petIds: ['pet-1', 'pet-2'],
      );

      when(() => mockPetRepository.getPetById('pet-1'))
          .thenAnswer((_) async => mockPet1);
      when(() => mockPetRepository.getPetById('pet-2'))
          .thenAnswer((_) async => mockPet2);
      when(() => mockBookingRepository.createBooking(request))
          .thenAnswer((_) async => expectedBooking);

      // Act
      final result = await createBookingUseCase.call(request);

      // Assert
      expect(result, equals(expectedBooking));
      verify(() => mockPetRepository.getPetById('pet-1')).called(1);
      verify(() => mockPetRepository.getPetById('pet-2')).called(1);
      verify(() => mockBookingRepository.createBooking(request)).called(1);
    });

    group('Service Type Validations', () {
      test('should validate visiting service minimum duration', () async {
        // Arrange - Less than 2 hours
        final shortEndTime = futureDateTime.add(Duration(hours: 1));
        final request = BookingRequest(
          customerId: 'customer-123',
          startDate: futureDateTime,
          endDate: shortEndTime,
          serviceType: ServiceType.visiting,
          petIds: ['pet-1'],
        );

        final mockPet = Pet(
          id: 'pet-1',
          customerId: 'customer-123',
          name: 'Test Pet',
          type: PetType.cat,
          breed: 'Test Breed',
          birthDate: DateTime(2021, 1, 1), // 3歳相当
        );

        when(() => mockPetRepository.getPetById('pet-1'))
            .thenAnswer((_) async => mockPet);

        // Act & Assert
        await expectLater(
          () => createBookingUseCase.call(request),
          throwsA(
            predicate((e) =>
                e is BookingValidationException &&
                e.message == '訪問サービスは最低2時間からご利用いただけます'),
          ),
        );
      });

      test('should validate boarding service minimum duration', () async {
        // Arrange - Less than 1 day
        final shortEndTime = futureDateTime.add(Duration(hours: 12));
        final request = BookingRequest(
          customerId: 'customer-123',
          startDate: futureDateTime,
          endDate: shortEndTime,
          serviceType: ServiceType.boarding,
          petIds: ['pet-1'],
        );

        final mockPet = Pet(
          id: 'pet-1',
          customerId: 'customer-123',
          name: 'Test Pet',
          type: PetType.cat,
          breed: 'Test Breed',
          birthDate: DateTime(2021, 1, 1), // 3歳相当
        );

        when(() => mockPetRepository.getPetById('pet-1'))
            .thenAnswer((_) async => mockPet);

        // Act & Assert
        await expectLater(
          () => createBookingUseCase.call(request),
          throwsA(
            predicate((e) =>
                e is BookingValidationException &&
                e.message == '宿泊サービスは最低1日からご利用いただけます'),
          ),
        );
      });

      test('should validate daycare service business hours', () async {
        // Arrange - Start time before 8 AM
        final earlyStart = DateTime(futureDateTime.year, futureDateTime.month,
            futureDateTime.day, 6, 0);
        final validEnd = DateTime(futureDateTime.year, futureDateTime.month,
            futureDateTime.day, 16, 0);
        final request = BookingRequest(
          customerId: 'customer-123',
          startDate: earlyStart,
          endDate: validEnd,
          serviceType: ServiceType.daycare,
          petIds: ['pet-1'],
        );

        final mockPet = Pet(
          id: 'pet-1',
          customerId: 'customer-123',
          name: 'Test Pet',
          type: PetType.cat,
          breed: 'Test Breed',
          birthDate: DateTime(2021, 1, 1), // 3歳相当
        );

        when(() => mockPetRepository.getPetById('pet-1'))
            .thenAnswer((_) async => mockPet);

        // Act & Assert
        await expectLater(
          () => createBookingUseCase.call(request),
          throwsA(
            predicate((e) =>
                e is BookingValidationException &&
                e.message == 'デイケアサービスの営業時間は8:00〜18:00です'),
          ),
        );
      });

      test('should validate grooming service duration', () async {
        // Arrange - More than 4 hours
        final longEndTime = futureDateTime.add(Duration(hours: 5));
        final request = BookingRequest(
          customerId: 'customer-123',
          startDate: futureDateTime,
          endDate: longEndTime,
          serviceType: ServiceType.grooming,
          petIds: ['pet-1'],
        );

        final mockPet = Pet(
          id: 'pet-1',
          customerId: 'customer-123',
          name: 'Test Pet',
          type: PetType.cat,
          breed: 'Test Breed',
          birthDate: DateTime(2021, 1, 1), // 3歳相当
        );

        when(() => mockPetRepository.getPetById('pet-1'))
            .thenAnswer((_) async => mockPet);

        // Act & Assert
        await expectLater(
          () => createBookingUseCase.call(request),
          throwsA(
            predicate((e) =>
                e is BookingValidationException &&
                e.message == 'グルーミングサービスは1〜4時間の範囲で設定してください'),
          ),
        );
      });

      test('should validate veterinary service duration', () async {
        // Arrange - Less than 30 minutes
        final shortEndTime = futureDateTime.add(Duration(minutes: 15));
        final request = BookingRequest(
          customerId: 'customer-123',
          startDate: futureDateTime,
          endDate: shortEndTime,
          serviceType: ServiceType.grooming,
          petIds: ['pet-1'],
        );

        final mockPet = Pet(
          id: 'pet-1',
          customerId: 'customer-123',
          name: 'Test Pet',
          type: PetType.cat,
          breed: 'Test Breed',
          birthDate: DateTime(2021, 1, 1), // 3歳相当
        );

        when(() => mockPetRepository.getPetById('pet-1'))
            .thenAnswer((_) async => mockPet);

        // Act & Assert
        await expectLater(
          () => createBookingUseCase.call(request),
          throwsA(
            predicate((e) =>
                e is BookingValidationException &&
                e.message == 'グルーミングサービスは1〜4時間の範囲で設定してください'),
          ),
        );
      });

      test('should validate emergency service timing', () async {
        // Arrange - Start time more than 12 hours away
        final distantFuture = DateTime.now().add(Duration(hours: 15));
        final endTime = distantFuture.add(Duration(hours: 1));
        final request = BookingRequest(
          customerId: 'customer-123',
          startDate: distantFuture,
          endDate: endTime,
          serviceType: ServiceType.walking,
          petIds: ['pet-1'],
        );

        final mockPet = Pet(
          id: 'pet-1',
          customerId: 'customer-123',
          name: 'Test Pet',
          type: PetType.cat,
          breed: 'Test Breed',
          birthDate: DateTime(2021, 1, 1), // 3歳相当
        );

        when(() => mockPetRepository.getPetById('pet-1'))
            .thenAnswer((_) async => mockPet);

        // Act & Assert
        await expectLater(
          () => createBookingUseCase.call(request),
          throwsA(
            predicate((e) =>
                e is BookingValidationException && e.message.contains('サービス')),
          ),
        );
      });
    });

    test('should handle repository errors properly', () async {
      // Arrange
      final request = BookingRequest(
        customerId: 'customer-123',
        startDate: futureDateTime,
        endDate: endDateTime,
        serviceType: ServiceType.visiting,
        petIds: ['pet-1'],
      );

      final mockPet = Pet(
        id: 'pet-1',
        customerId: 'customer-123',
        name: 'Test Pet',
        type: PetType.cat,
        breed: 'Test Breed',
      );

      when(() => mockPetRepository.getPetById('pet-1'))
          .thenAnswer((_) async => mockPet);
      when(() => mockBookingRepository.createBooking(request))
          .thenThrow(Exception('Database error'));

      // Act & Assert
      await expectLater(
        () => createBookingUseCase.call(request),
        throwsException,
      );

      verify(() => mockPetRepository.getPetById('pet-1')).called(1);
      verify(() => mockBookingRepository.createBooking(request)).called(1);
    });
  });

  group('BookingValidationException Tests', () {
    test('should create exception with message', () {
      // Arrange & Act
      const message = 'Test validation error';
      final exception = BookingValidationException(message);

      // Assert
      expect(exception.message, equals(message));
      expect(
          exception.toString(), equals('BookingValidationException: $message'));
    });
  });
}
