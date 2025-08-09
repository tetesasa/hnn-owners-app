import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnn_owners/presentation/widgets/booking/booking_card.dart';
import 'package:hnn_owners/domain/entities/booking.dart';
import 'package:hnn_owners/core/theme/app_colors.dart';

void main() {
  group('BookingCard Widget Tests', () {
    late Booking testBooking;

    setUp(() {
      testBooking = Booking(
        id: 'booking-123',
        customerId: 'customer-456',
        sittingDateStart: DateTime(2024, 8, 15, 10, 0),
        sittingDateEnd: DateTime(2024, 8, 15, 18, 0),
        status: BookingStatus.pending,
        serviceType: ServiceType.visiting,
        petIds: ['pet-1', 'pet-2'],
        notes: 'テスト予約です',
        specialInstructions: ['餌を2回あげてください', '散歩は午後にお願いします'],
      );
    });

    Widget createTestWidget(Booking booking, {VoidCallback? onTap}) {
      return ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: BookingCard(
              booking: booking,
              onTap: onTap,
            ),
          ),
        ),
      );
    }

    testWidgets('should display booking basic information',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testBooking));

      // Assert
      expect(find.text('訪問サービス'), findsOneWidget);
      expect(find.text('予約待ち'), findsOneWidget);
      expect(find.text('2024/08/15'), findsOneWidget);
      expect(find.text('10:00 - 18:00'), findsOneWidget);
      expect(find.text('ペット: 2匹'), findsOneWidget);
    });

    testWidgets('should display different service types correctly',
        (WidgetTester tester) async {
      // Test different service types
      final serviceTypes = [
        (ServiceType.visiting, '訪問サービス'),
        (ServiceType.boarding, '宿泊サービス'),
        (ServiceType.daycare, 'デイケア'),
        (ServiceType.grooming, 'グルーミング'),
        (ServiceType.walking, 'お散歩'),
      ];

      for (final (serviceType, expectedText) in serviceTypes) {
        final booking = testBooking.copyWith(serviceType: serviceType);
        await tester.pumpWidget(createTestWidget(booking));

        expect(find.text(expectedText), findsOneWidget);
      }
    });

    testWidgets('should display different booking statuses with correct colors',
        (WidgetTester tester) async {
      // Test pending status
      await tester.pumpWidget(createTestWidget(
          testBooking.copyWith(status: BookingStatus.pending)));
      await tester.pump();

      var statusText = tester.widget<Text>(find.text('予約待ち'));
      expect(statusText.style?.color, equals(AppColors.warning));

      // Test confirmed status
      await tester.pumpWidget(createTestWidget(
          testBooking.copyWith(status: BookingStatus.confirmed)));
      await tester.pump();

      statusText = tester.widget<Text>(find.text('確定済み'));
      expect(statusText.style?.color, equals(AppColors.success));

      // Test completed status
      await tester.pumpWidget(createTestWidget(
          testBooking.copyWith(status: BookingStatus.completed)));
      await tester.pump();

      statusText = tester.widget<Text>(find.text('完了済み'));
      expect(statusText.style?.color, equals(AppColors.success));

      // Test cancelled status
      await tester.pumpWidget(createTestWidget(
          testBooking.copyWith(status: BookingStatus.cancelled)));
      await tester.pump();

      statusText = tester.widget<Text>(find.text('キャンセル済み'));
      expect(statusText.style?.color, equals(AppColors.error));
    });

    testWidgets('should display notes when available',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testBooking));

      // Assert
      expect(find.text('テスト予約です'), findsOneWidget);
    });

    testWidgets('should display special instructions when available',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testBooking));

      // Assert
      expect(find.text('特別な指示:'), findsOneWidget);
      expect(find.text('餌を2回あげてください'), findsOneWidget);
      expect(find.text('散歩は午後にお願いします'), findsOneWidget);
    });

    testWidgets('should not display special instructions section when empty',
        (WidgetTester tester) async {
      // Arrange
      final bookingWithoutInstructions =
          testBooking.copyWith(specialInstructions: []);

      // Act
      await tester.pumpWidget(createTestWidget(bookingWithoutInstructions));

      // Assert
      expect(find.text('特別な指示:'), findsNothing);
    });

    testWidgets('should handle tap events', (WidgetTester tester) async {
      // Arrange
      var tapped = false;

      // Act
      await tester.pumpWidget(createTestWidget(testBooking, onTap: () {
        tapped = true;
      }));

      await tester.tap(find.byType(Card));
      await tester.pump();

      // Assert
      expect(tapped, isTrue);
    });

    testWidgets('should display correct pet count',
        (WidgetTester tester) async {
      // Test single pet
      final singlePetBooking = testBooking.copyWith(petIds: ['pet-1']);
      await tester.pumpWidget(createTestWidget(singlePetBooking));
      expect(find.text('ペット: 1匹'), findsOneWidget);

      // Test multiple pets
      final multiplePetBooking =
          testBooking.copyWith(petIds: ['pet-1', 'pet-2', 'pet-3']);
      await tester.pumpWidget(createTestWidget(multiplePetBooking));
      expect(find.text('ペット: 3匹'), findsOneWidget);
    });

    testWidgets('should format date and time correctly',
        (WidgetTester tester) async {
      // Test different date formats
      final testCases = [
        (
          DateTime(2024, 1, 5, 9, 30),
          DateTime(2024, 1, 5, 17, 45),
          '2024/01/05',
          '9:30 - 17:45'
        ),
        (
          DateTime(2024, 12, 25, 8, 0),
          DateTime(2024, 12, 25, 20, 0),
          '2024/12/25',
          '8:00 - 20:00'
        ),
        (
          DateTime(2024, 6, 15, 14, 15),
          DateTime(2024, 6, 15, 18, 30),
          '2024/06/15',
          '14:15 - 18:30'
        ),
      ];

      for (final (startDate, endDate, expectedDate, expectedTime)
          in testCases) {
        final booking = testBooking.copyWith(
          sittingDateStart: startDate,
          sittingDateEnd: endDate,
        );

        await tester.pumpWidget(createTestWidget(booking));

        expect(find.text(expectedDate), findsOneWidget);
        expect(find.text(expectedTime), findsOneWidget);
      }
    });

    testWidgets('should display pricing information when available',
        (WidgetTester tester) async {
      // Arrange
      const pricing = BookingPricing(
        basePrice: 10000.0,
        additionalCharges: 1500.0,
        discount: 500.0,
        tax: 1100.0,
        totalPrice: 12100.0,
      );

      final bookingWithPricing = testBooking.copyWith(pricing: pricing);

      // Act
      await tester.pumpWidget(createTestWidget(bookingWithPricing));

      // Assert
      expect(find.text('¥12,100'),
          findsOneWidget); // Total: 10000 + 1500 - 500 + 1100
    });

    testWidgets('should not display pricing when not available',
        (WidgetTester tester) async {
      // Arrange
      final bookingWithoutPricing = testBooking.copyWith(pricing: null);

      // Act
      await tester.pumpWidget(createTestWidget(bookingWithoutPricing));

      // Assert
      expect(find.textContaining('¥'), findsNothing);
    });

    testWidgets('should display booking ID for debugging',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testBooking));

      // Assert - In debug mode, booking ID might be shown
      expect(find.textContaining('booking-123'), findsOneWidget);
    });

    testWidgets('should handle in-progress status correctly',
        (WidgetTester tester) async {
      // Arrange
      final inProgressBooking =
          testBooking.copyWith(status: BookingStatus.inProgress);

      // Act
      await tester.pumpWidget(createTestWidget(inProgressBooking));

      // Assert
      expect(find.text('進行中'), findsOneWidget);

      final statusText = tester.widget<Text>(find.text('進行中'));
      expect(statusText.style?.color, equals(AppColors.primary));
    });

    testWidgets('should display card with proper Material Design elevation',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testBooking));

      // Assert
      final card = tester.widget<Card>(find.byType(Card));
      expect(card.elevation, greaterThan(0));
      expect(card.shape, isA<RoundedRectangleBorder>());
    });

    testWidgets('should be accessible', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testBooking));

      // Assert - Check for semantic labels
      expect(find.bySemanticsLabel(RegExp(r'予約.*訪問サービス')), findsWidgets);
    });

    testWidgets('should handle empty notes gracefully',
        (WidgetTester tester) async {
      // Arrange
      final bookingWithoutNotes = testBooking.copyWith(notes: null);

      // Act
      await tester.pumpWidget(createTestWidget(bookingWithoutNotes));

      // Assert - Should not crash and should still display other information
      expect(find.text('訪問サービス'), findsOneWidget);
      expect(find.text('予約待ち'), findsOneWidget);
    });
  });
}
