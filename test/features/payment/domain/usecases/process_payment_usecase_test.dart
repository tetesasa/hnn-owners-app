import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hnn_owners/features/payment/domain/usecases/process_payment_usecase.dart';
import 'package:hnn_owners/features/payment/domain/entities/payment_intent.dart';
import 'package:hnn_owners/features/payment/domain/repositories/payment_repository.dart';
import 'package:hnn_owners/features/payment/domain/repositories/invoice_repository.dart';
import 'package:hnn_owners/features/payment/data/repositories/booking_payment_repository.dart';
import 'package:hnn_owners/domain/entities/booking.dart';
import 'package:hnn_owners/core/error/result.dart';

// Mock classes
class MockPaymentRepository extends Mock implements PaymentRepository {}

class MockInvoiceRepository extends Mock implements InvoiceRepository {}

class MockBookingPaymentRepository extends Mock
    implements BookingPaymentRepository {}

void main() {
  late ProcessPaymentUseCase useCase;
  late MockPaymentRepository mockPaymentRepository;
  late MockInvoiceRepository mockInvoiceRepository;
  late MockBookingPaymentRepository mockBookingRepository;

  setUp(() {
    mockPaymentRepository = MockPaymentRepository();
    mockInvoiceRepository = MockInvoiceRepository();
    mockBookingRepository = MockBookingPaymentRepository();
    useCase = ProcessPaymentUseCase(
      paymentRepository: mockPaymentRepository,
      invoiceRepository: mockInvoiceRepository,
      bookingRepository: mockBookingRepository,
    );
  });

  group('ProcessPaymentUseCase Tests', () {
    final mockBooking = Booking(
      id: 'booking-123',
      customerId: 'customer-123',
      sittingDateStart: DateTime.now().add(Duration(days: 1)),
      sittingDateEnd: DateTime.now().add(Duration(days: 1, hours: 3)),
      status: BookingStatus.confirmed,
      serviceType: ServiceType.visiting,
      petIds: ['pet-1'],
    );

    const mockPaymentIntent = PaymentIntent(
      id: 'pi_test_123',
      clientSecret: 'pi_test_123_secret',
      amount: 9000,
      currency: 'jpy',
      status: PaymentIntentStatus.succeeded,
      customerId: 'customer-123',
      description: 'Pet visiting service - Booking booking-1',
    );

    test('should process payment successfully with valid request', () async {
      // Arrange
      const request = PaymentProcessRequest(
        bookingId: 'booking-123',
        customerId: 'customer-123',
        amount: 9000,
        currency: 'jpy',
        paymentMethodId: 'pm_123',
      );

      when(() => mockBookingRepository.getBooking('booking-123'))
          .thenAnswer((_) async => Result.success(mockBooking));

      when(() => mockPaymentRepository.createPaymentIntent(
            amount: 9000,
            currency: 'jpy',
            customerId: 'customer-123',
            description: any(named: 'description'),
            bookingId: 'booking-123',
            metadata: any(named: 'metadata'),
          )).thenAnswer((_) async => const Result.success(mockPaymentIntent));

      when(() => mockPaymentRepository.confirmPaymentIntent(
            paymentIntentId: 'pi_test_123',
            paymentMethodId: 'pm_123',
          )).thenAnswer((_) async => const Result.success(mockPaymentIntent));

      when(() => mockBookingRepository.updateBookingStatus(
            bookingId: 'booking-123',
            status: BookingStatus.completed,
            paymentIntentId: 'pi_test_123',
          )).thenAnswer((_) async => const Result.success(null));

      // Act
      final result = await useCase.call(request);

      // Assert
      expect(result.isSuccess, isTrue);
      final processResult = result.data!;
      expect(processResult.status, PaymentProcessStatus.succeeded);
      expect(processResult.paymentIntent.id, 'pi_test_123');
      expect(processResult.booking.id, 'booking-123');

      verify(() => mockBookingRepository.getBooking('booking-123')).called(1);
      verify(() => mockPaymentRepository.createPaymentIntent(
            amount: 9000,
            currency: 'jpy',
            customerId: 'customer-123',
            description: any(named: 'description'),
            bookingId: 'booking-123',
            metadata: any(named: 'metadata'),
          )).called(1);
      verify(() => mockPaymentRepository.confirmPaymentIntent(
            paymentIntentId: 'pi_test_123',
            paymentMethodId: 'pm_123',
          )).called(1);
    });

    test('should return failure when booking is not found', () async {
      // Arrange
      const request = PaymentProcessRequest(
        bookingId: 'nonexistent-booking',
        customerId: 'customer-123',
        amount: 9000,
        currency: 'jpy',
        paymentMethodId: 'pm_123',
      );

      when(() => mockBookingRepository.getBooking('nonexistent-booking'))
          .thenAnswer((_) async => const Result.failure(AppError.validation(
                message: '予約が見つかりません',
                field: 'bookingId',
              )));

      // Act
      final result = await useCase.call(request);

      // Assert
      expect(result.isFailure, isTrue);
      expect(result.error!.message, '予約が見つかりません');

      verify(() => mockBookingRepository.getBooking('nonexistent-booking'))
          .called(1);
      verifyNever(() => mockPaymentRepository.createPaymentIntent(
            amount: any(named: 'amount'),
            currency: any(named: 'currency'),
            customerId: any(named: 'customerId'),
            description: any(named: 'description'),
            bookingId: any(named: 'bookingId'),
            metadata: any(named: 'metadata'),
          ));
    });

    test('should return failure when booking is not confirmed', () async {
      // Arrange
      final unconfirmedBooking = mockBooking.copyWith(
        status: BookingStatus.pending,
      );

      const request = PaymentProcessRequest(
        bookingId: 'booking-123',
        customerId: 'customer-123',
        amount: 9000,
        currency: 'jpy',
        paymentMethodId: 'pm_123',
      );

      when(() => mockBookingRepository.getBooking('booking-123'))
          .thenAnswer((_) async => Result.success(unconfirmedBooking));

      // Act
      final result = await useCase.call(request);

      // Assert
      expect(result.isFailure, isTrue);
      expect(result.error!.message, '確定された予約のみ決済可能です');

      verify(() => mockBookingRepository.getBooking('booking-123')).called(1);
      verifyNever(() => mockPaymentRepository.createPaymentIntent(
            amount: any(named: 'amount'),
            currency: any(named: 'currency'),
            customerId: any(named: 'customerId'),
            description: any(named: 'description'),
            bookingId: any(named: 'bookingId'),
            metadata: any(named: 'metadata'),
          ));
    });

    test('should return failure when payment amount is incorrect', () async {
      // Arrange
      const request = PaymentProcessRequest(
        bookingId: 'booking-123',
        customerId: 'customer-123',
        amount: 5000, // Incorrect amount
        currency: 'jpy',
        paymentMethodId: 'pm_123',
      );

      when(() => mockBookingRepository.getBooking('booking-123'))
          .thenAnswer((_) async => Result.success(mockBooking));

      // Act
      final result = await useCase.call(request);

      // Assert
      expect(result.isFailure, isTrue);
      expect(result.error!.message, '決済金額が正しくありません');

      verify(() => mockBookingRepository.getBooking('booking-123')).called(1);
      verifyNever(() => mockPaymentRepository.createPaymentIntent(
            amount: any(named: 'amount'),
            currency: any(named: 'currency'),
            customerId: any(named: 'customerId'),
            description: any(named: 'description'),
            bookingId: any(named: 'bookingId'),
            metadata: any(named: 'metadata'),
          ));
    });

    test('should handle payment requiring 3D Secure', () async {
      // Arrange
      final requiresActionPaymentIntent = mockPaymentIntent.copyWith(
        status: PaymentIntentStatus.requiresAction,
      );

      const request = PaymentProcessRequest(
        bookingId: 'booking-123',
        customerId: 'customer-123',
        amount: 9000,
        currency: 'jpy',
        paymentMethodId: 'pm_123',
      );

      when(() => mockBookingRepository.getBooking('booking-123'))
          .thenAnswer((_) async => Result.success(mockBooking));

      when(() => mockPaymentRepository.createPaymentIntent(
            amount: 9000,
            currency: 'jpy',
            customerId: 'customer-123',
            description: any(named: 'description'),
            bookingId: 'booking-123',
            metadata: any(named: 'metadata'),
          )).thenAnswer((_) async => const Result.success(mockPaymentIntent));

      when(() => mockPaymentRepository.confirmPaymentIntent(
                paymentIntentId: 'pi_test_123',
                paymentMethodId: 'pm_123',
              ))
          .thenAnswer((_) async => Result.success(requiresActionPaymentIntent));

      // Act
      final result = await useCase.call(request);

      // Assert
      expect(result.isSuccess, isTrue);
      final processResult = result.data!;
      expect(processResult.status, PaymentProcessStatus.requiresAction);
      expect(processResult.paymentIntent.status,
          PaymentIntentStatus.requiresAction);

      verify(() => mockPaymentRepository.confirmPaymentIntent(
            paymentIntentId: 'pi_test_123',
            paymentMethodId: 'pm_123',
          )).called(1);
    });

    test('should handle payment method not provided', () async {
      // Arrange
      const request = PaymentProcessRequest(
        bookingId: 'booking-123',
        customerId: 'customer-123',
        amount: 9000,
        currency: 'jpy',
        paymentMethodId: null, // No payment method provided
      );

      when(() => mockBookingRepository.getBooking('booking-123'))
          .thenAnswer((_) async => Result.success(mockBooking));

      when(() => mockPaymentRepository.createPaymentIntent(
            amount: 9000,
            currency: 'jpy',
            customerId: 'customer-123',
            description: any(named: 'description'),
            bookingId: 'booking-123',
            metadata: any(named: 'metadata'),
          )).thenAnswer((_) async => const Result.success(mockPaymentIntent));

      // Act
      final result = await useCase.call(request);

      // Assert
      expect(result.isFailure, isTrue);
      expect(result.error!.message, 'PaymentMethodが指定されていません');

      verify(() => mockPaymentRepository.createPaymentIntent(
            amount: 9000,
            currency: 'jpy',
            customerId: 'customer-123',
            description: any(named: 'description'),
            bookingId: 'booking-123',
            metadata: any(named: 'metadata'),
          )).called(1);
      verifyNever(() => mockPaymentRepository.confirmPaymentIntent(
            paymentIntentId: any(named: 'paymentIntentId'),
            paymentMethodId: any(named: 'paymentMethodId'),
          ));
    });

    test('should handle PaymentIntent creation failure', () async {
      // Arrange
      const request = PaymentProcessRequest(
        bookingId: 'booking-123',
        customerId: 'customer-123',
        amount: 9000,
        currency: 'jpy',
        paymentMethodId: 'pm_123',
      );

      when(() => mockBookingRepository.getBooking('booking-123'))
          .thenAnswer((_) async => Result.success(mockBooking));

      when(() => mockPaymentRepository.createPaymentIntent(
            amount: 9000,
            currency: 'jpy',
            customerId: 'customer-123',
            description: any(named: 'description'),
            bookingId: 'booking-123',
            metadata: any(named: 'metadata'),
          )).thenAnswer((_) async => const Result.failure(AppError.payment(
            message: 'PaymentIntent creation failed',
            code: 'payment_intent_creation_failed',
          )));

      // Act
      final result = await useCase.call(request);

      // Assert
      expect(result.isFailure, isTrue);
      expect(result.error!.message, 'PaymentIntent creation failed');

      verify(() => mockPaymentRepository.createPaymentIntent(
            amount: 9000,
            currency: 'jpy',
            customerId: 'customer-123',
            description: any(named: 'description'),
            bookingId: 'booking-123',
            metadata: any(named: 'metadata'),
          )).called(1);
      verifyNever(() => mockPaymentRepository.confirmPaymentIntent(
            paymentIntentId: any(named: 'paymentIntentId'),
            paymentMethodId: any(named: 'paymentMethodId'),
          ));
    });
  });
}
