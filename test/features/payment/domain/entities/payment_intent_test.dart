import 'package:flutter_test/flutter_test.dart';
import 'package:hnn_owners/features/payment/domain/entities/payment_intent.dart';

void main() {
  group('PaymentIntent Tests', () {
    test('should create PaymentIntent with required fields', () {
      // Arrange & Act
      final paymentIntent = PaymentIntent(
        id: 'pi_test_123',
        clientSecret: 'pi_test_123_secret',
        amount: 5000,
        currency: 'jpy',
        status: PaymentIntentStatus.requiresPaymentMethod,
      );

      // Assert
      expect(paymentIntent.id, equals('pi_test_123'));
      expect(paymentIntent.clientSecret, equals('pi_test_123_secret'));
      expect(paymentIntent.amount, equals(5000));
      expect(paymentIntent.currency, equals('jpy'));
      expect(paymentIntent.status,
          equals(PaymentIntentStatus.requiresPaymentMethod));
    });

    test('should create PaymentIntent with optional fields', () {
      // Arrange & Act
      final paymentIntent = PaymentIntent(
        id: 'pi_test_123',
        clientSecret: 'pi_test_123_secret',
        amount: 5000,
        currency: 'jpy',
        status: PaymentIntentStatus.succeeded,
        customerId: 'cus_123',
        paymentMethodId: 'pm_123',
        description: 'Test payment',
        bookingId: 'booking_123',
        metadata: {'key': 'value'},
        created: DateTime(2024, 1, 1),
        updated: DateTime(2024, 1, 2),
        lastPaymentError: null,
        livemode: false,
      );

      // Assert
      expect(paymentIntent.customerId, equals('cus_123'));
      expect(paymentIntent.paymentMethodId, equals('pm_123'));
      expect(paymentIntent.description, equals('Test payment'));
      expect(paymentIntent.bookingId, equals('booking_123'));
      expect(paymentIntent.metadata, equals({'key': 'value'}));
      expect(paymentIntent.created, equals(DateTime(2024, 1, 1)));
      expect(paymentIntent.updated, equals(DateTime(2024, 1, 2)));
      expect(paymentIntent.livemode, equals(false));
    });

    test('should support copyWith', () {
      // Arrange
      final originalPaymentIntent = PaymentIntent(
        id: 'pi_test_123',
        clientSecret: 'pi_test_123_secret',
        amount: 5000,
        currency: 'jpy',
        status: PaymentIntentStatus.requiresPaymentMethod,
      );

      // Act
      final updatedPaymentIntent = originalPaymentIntent.copyWith(
        status: PaymentIntentStatus.succeeded,
        customerId: 'cus_123',
      );

      // Assert
      expect(updatedPaymentIntent.id, equals('pi_test_123'));
      expect(
          updatedPaymentIntent.status, equals(PaymentIntentStatus.succeeded));
      expect(updatedPaymentIntent.customerId, equals('cus_123'));
      expect(updatedPaymentIntent.amount, equals(5000)); // Unchanged
    });

    test('should serialize to and from JSON', () {
      // Arrange
      final paymentIntent = PaymentIntent(
        id: 'pi_test_123',
        clientSecret: 'pi_test_123_secret',
        amount: 5000,
        currency: 'jpy',
        status: PaymentIntentStatus.succeeded,
        customerId: 'cus_123',
        description: 'Test payment',
        metadata: {'booking_id': 'booking_123'},
        created: DateTime(2024, 1, 1),
      );

      // Act
      final json = paymentIntent.toJson();
      final fromJson = PaymentIntent.fromJson(json);

      // Assert
      expect(fromJson, equals(paymentIntent));
      expect(fromJson.id, equals('pi_test_123'));
      expect(fromJson.amount, equals(5000));
      expect(fromJson.status, equals(PaymentIntentStatus.succeeded));
    });

    test('should convert to and from Firestore', () {
      // Arrange
      final paymentIntent = PaymentIntent(
        id: 'pi_test_123',
        clientSecret: 'pi_test_123_secret',
        amount: 5000,
        currency: 'jpy',
        status: PaymentIntentStatus.succeeded,
        customerId: 'cus_123',
        bookingId: 'booking_123',
        created: DateTime(2024, 1, 1),
      );

      // Act
      final firestoreData = paymentIntent.toFirestore();
      final fromFirestore = PaymentIntent.fromFirestore(firestoreData);

      // Assert
      expect(fromFirestore.id, equals(paymentIntent.id));
      expect(fromFirestore.amount, equals(paymentIntent.amount));
      expect(fromFirestore.status, equals(paymentIntent.status));
      expect(fromFirestore.customerId, equals(paymentIntent.customerId));
      expect(fromFirestore.bookingId, equals(paymentIntent.bookingId));
    });

    test('should create from Stripe API response', () {
      // Arrange
      final stripeResponse = {
        'id': 'pi_test_123',
        'client_secret': 'pi_test_123_secret',
        'amount': 5000,
        'currency': 'jpy',
        'status': 'succeeded',
        'customer': 'cus_123',
        'payment_method': 'pm_123',
        'description': 'Test payment',
        'metadata': {'booking_id': 'booking_123'},
        'created': 1704067200, // 2024-01-01 00:00:00 UTC
        'livemode': false,
      };

      // Act
      final paymentIntent = PaymentIntent.fromStripeResponse(stripeResponse);

      // Assert
      expect(paymentIntent.id, equals('pi_test_123'));
      expect(paymentIntent.clientSecret, equals('pi_test_123_secret'));
      expect(paymentIntent.amount, equals(5000));
      expect(paymentIntent.currency, equals('jpy'));
      expect(paymentIntent.status, equals(PaymentIntentStatus.succeeded));
      expect(paymentIntent.customerId, equals('cus_123'));
      expect(paymentIntent.paymentMethodId, equals('pm_123'));
      expect(paymentIntent.description, equals('Test payment'));
      expect(paymentIntent.livemode, equals(false));
    });

    group('Status mapping tests', () {
      test('should map Stripe statuses correctly', () {
        final testCases = {
          'requires_payment_method': PaymentIntentStatus.requiresPaymentMethod,
          'requires_confirmation': PaymentIntentStatus.requiresConfirmation,
          'requires_action': PaymentIntentStatus.requiresAction,
          'processing': PaymentIntentStatus.processing,
          'requires_capture': PaymentIntentStatus.requiresCapture,
          'canceled': PaymentIntentStatus.canceled,
          'succeeded': PaymentIntentStatus.succeeded,
        };

        for (final entry in testCases.entries) {
          final response = {
            'id': 'pi_test',
            'client_secret': 'secret',
            'amount': 1000,
            'currency': 'jpy',
            'status': entry.key,
          };

          final paymentIntent = PaymentIntent.fromStripeResponse(response);
          expect(paymentIntent.status, equals(entry.value));
        }
      });

      test('should default to pending for unknown status', () {
        // Arrange
        final response = {
          'id': 'pi_test',
          'client_secret': 'secret',
          'amount': 1000,
          'currency': 'jpy',
          'status': 'unknown_status',
        };

        // Act
        final paymentIntent = PaymentIntent.fromStripeResponse(response);

        // Assert
        expect(paymentIntent.status, equals(PaymentIntentStatus.pending));
      });
    });

    group('Helper methods tests', () {
      test('should format JPY amount correctly', () {
        // Arrange
        final paymentIntent = PaymentIntent(
          id: 'pi_test',
          clientSecret: 'secret',
          amount: 123456,
          currency: 'jpy',
          status: PaymentIntentStatus.succeeded,
        );

        // Act & Assert
        expect(paymentIntent.formattedAmount, equals('¥123,456'));
      });

      test('should format other currency amount correctly', () {
        // Arrange
        final paymentIntent = PaymentIntent(
          id: 'pi_test',
          clientSecret: 'secret',
          amount: 2500, // $25.00 in cents
          currency: 'usd',
          status: PaymentIntentStatus.succeeded,
        );

        // Act & Assert
        expect(paymentIntent.formattedAmount, equals('2500 usd'));
      });

      test('should return correct success status', () {
        final testCases = {
          PaymentIntentStatus.succeeded: true,
          PaymentIntentStatus.processing: false,
          PaymentIntentStatus.requiresAction: false,
          PaymentIntentStatus.canceled: false,
        };

        for (final entry in testCases.entries) {
          final paymentIntent = PaymentIntent(
            id: 'pi_test',
            clientSecret: 'secret',
            amount: 1000,
            currency: 'jpy',
            status: entry.key,
          );

          expect(paymentIntent.isSucceeded, equals(entry.value));
        }
      });

      test('should return correct requiresAction status', () {
        final paymentIntent = PaymentIntent(
          id: 'pi_test',
          clientSecret: 'secret',
          amount: 1000,
          currency: 'jpy',
          status: PaymentIntentStatus.requiresAction,
        );

        expect(paymentIntent.requiresAction, isTrue);
      });

      test('should return correct failed status', () {
        // Test canceled status
        final canceledPaymentIntent = PaymentIntent(
          id: 'pi_test',
          clientSecret: 'secret',
          amount: 1000,
          currency: 'jpy',
          status: PaymentIntentStatus.canceled,
        );

        expect(canceledPaymentIntent.isFailed, isTrue);

        // Test with error message
        final errorPaymentIntent = PaymentIntent(
          id: 'pi_test',
          clientSecret: 'secret',
          amount: 1000,
          currency: 'jpy',
          status: PaymentIntentStatus.processing,
          lastPaymentError: 'Card declined',
        );

        expect(errorPaymentIntent.isFailed, isTrue);
      });
    });

    test('should be equal when all fields match', () {
      // Arrange
      final paymentIntent1 = PaymentIntent(
        id: 'pi_test_123',
        clientSecret: 'pi_test_123_secret',
        amount: 5000,
        currency: 'jpy',
        status: PaymentIntentStatus.succeeded,
        customerId: 'cus_123',
      );

      final paymentIntent2 = PaymentIntent(
        id: 'pi_test_123',
        clientSecret: 'pi_test_123_secret',
        amount: 5000,
        currency: 'jpy',
        status: PaymentIntentStatus.succeeded,
        customerId: 'cus_123',
      );

      // Act & Assert
      expect(paymentIntent1, equals(paymentIntent2));
      expect(paymentIntent1.hashCode, equals(paymentIntent2.hashCode));
    });

    test('should not be equal when fields differ', () {
      // Arrange
      final paymentIntent1 = PaymentIntent(
        id: 'pi_test_123',
        clientSecret: 'pi_test_123_secret',
        amount: 5000,
        currency: 'jpy',
        status: PaymentIntentStatus.succeeded,
      );

      final paymentIntent2 = PaymentIntent(
        id: 'pi_test_456', // Different ID
        clientSecret: 'pi_test_123_secret',
        amount: 5000,
        currency: 'jpy',
        status: PaymentIntentStatus.succeeded,
      );

      // Act & Assert
      expect(paymentIntent1, isNot(equals(paymentIntent2)));
      expect(paymentIntent1.hashCode, isNot(equals(paymentIntent2.hashCode)));
    });
  });
}
