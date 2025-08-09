import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hnn_owners/presentation/widgets/common/app_button.dart';
import 'package:hnn_owners/core/theme/app_colors.dart';

void main() {
  group('AppButton Widget Tests', () {
    Widget createTestWidget({
      required Widget child,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: child,
        ),
      );
    }

    testWidgets('should display primary button correctly',
        (WidgetTester tester) async {
      // Arrange
      var tapped = false;
      const buttonText = 'Primary Button';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: AppButton.filled(
            onPressed: () {
              tapped = true;
            },
            child: Text(buttonText),
          ),
        ),
      );

      // Assert
      expect(find.text(buttonText), findsOneWidget);

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final buttonStyle = button.style;

      expect(
          buttonStyle?.backgroundColor?.resolve({}), equals(AppColors.primary));
      expect(buttonStyle?.foregroundColor?.resolve({}), equals(Colors.white));

      // Test tap functionality
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('should display secondary button correctly',
        (WidgetTester tester) async {
      // Arrange
      var tapped = false;
      const buttonText = 'Secondary Button';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: AppButton.outlined(
            onPressed: () {
              tapped = true;
            },
            child: Text(buttonText),
          ),
        ),
      );

      // Assert
      expect(find.text(buttonText), findsOneWidget);

      final button = tester.widget<OutlinedButton>(find.byType(OutlinedButton));
      final buttonStyle = button.style;

      expect(
          buttonStyle?.foregroundColor?.resolve({}), equals(AppColors.primary));
      expect(buttonStyle?.side?.resolve({})?.color, equals(AppColors.primary));

      // Test tap functionality
      await tester.tap(find.byType(OutlinedButton));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('should display text button correctly',
        (WidgetTester tester) async {
      // Arrange
      var tapped = false;
      const buttonText = 'Text Button';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: AppButton(
            type: AppButtonType.text,
            onPressed: () {
              tapped = true;
            },
            child: Text(buttonText),
          ),
        ),
      );

      // Assert
      expect(find.text(buttonText), findsOneWidget);

      final button = tester.widget<TextButton>(find.byType(TextButton));
      final buttonStyle = button.style;

      expect(
          buttonStyle?.foregroundColor?.resolve({}), equals(AppColors.primary));

      // Test tap functionality
      await tester.tap(find.byType(TextButton));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('should show loading state correctly',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: AppButton.filled(
            onPressed: () {},
            loading: true,
            child: Text('Loading Button'),
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading Button'), findsNothing);

      // Button should be disabled when loading
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('should be disabled when onPressed is null',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: AppButton.filled(
            onPressed: null,
            child: Text('Disabled Button'),
          ),
        ),
      );

      // Assert
      expect(find.text('Disabled Button'), findsOneWidget);

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);

      // Button should have disabled styling
      final buttonStyle = button.style;
      expect(buttonStyle?.backgroundColor?.resolve({WidgetState.disabled}),
          equals(Colors.grey));
    });

    testWidgets('should display icon button correctly',
        (WidgetTester tester) async {
      // Arrange
      var tapped = false;
      const buttonText = 'Icon Button';
      const icon = Icons.add;

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: AppButton.filled(
            onPressed: () {
              tapped = true;
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon),
                SizedBox(width: 8),
                Text(buttonText),
              ],
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(buttonText), findsOneWidget);
      expect(find.byIcon(icon), findsOneWidget);

      // Test tap functionality
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('should handle different button sizes',
        (WidgetTester tester) async {
      // Test small button
      await tester.pumpWidget(
        createTestWidget(
          child: AppButton.filled(
            size: AppButtonSize.small,
            onPressed: () {},
            child: Text('Small Button'),
          ),
        ),
      );

      tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final smallSize = tester.getSize(find.byType(ElevatedButton));

      // Test large button
      await tester.pumpWidget(
        createTestWidget(
          child: AppButton.filled(
            size: AppButtonSize.large,
            onPressed: () {},
            child: Text('Large Button'),
          ),
        ),
      );

      final largeSize = tester.getSize(find.byType(ElevatedButton));

      // Large button should be bigger than small button
      expect(largeSize.height, greaterThan(smallSize.height));
    });

    testWidgets('should expand to full width when specified',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: SizedBox(
            width: 300,
            child: AppButton.filled(
              onPressed: () {},
              fullWidth: true,
              child: Text('Full Width Button'),
            ),
          ),
        ),
      );

      // Assert
      final buttonSize = tester.getSize(find.byType(ElevatedButton));
      expect(buttonSize.width, equals(300));
    });

    testWidgets('should be accessible', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: AppButton.filled(
            child: Text('Accessible Button'),
            onPressed: () {},
            // semanticLabel: 'ボタンをタップして次へ進む', // AppButtonには存在しない
          ),
        ),
      );

      // Assert
      expect(find.bySemanticsLabel('ボタンをタップして次へ進む'), findsOneWidget);
    });

    testWidgets('should handle custom colors', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: AppButton.filled(
            onPressed: () {},
            backgroundColor: Colors.red,
            foregroundColor: Colors.yellow,
            child: Text('Custom Color Button'),
          ),
        ),
      );

      // Assert
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final buttonStyle = button.style;

      expect(buttonStyle?.backgroundColor?.resolve({}), equals(Colors.red));
      expect(buttonStyle?.foregroundColor?.resolve({}), equals(Colors.yellow));
    });

    testWidgets('should show correct elevation on press',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: AppButton.filled(
            child: Text('Elevated Button'),
            onPressed: () {},
          ),
        ),
      );

      // Get initial elevation
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final initialElevation = button.style?.elevation?.resolve({});

      // Press the button
      await tester.press(find.byType(ElevatedButton));
      await tester.pump();

      // Get pressed elevation
      final pressedElevation =
          button.style?.elevation?.resolve({WidgetState.pressed});

      // Assert elevation changes on press
      expect(pressedElevation, isNot(equals(initialElevation)));
    });

    testWidgets('should handle long text gracefully',
        (WidgetTester tester) async {
      // Arrange
      const longText =
          'これは非常に長いボタンテキストで、ボタンの幅を超える可能性があります。文字が正しく表示されることを確認します。';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: SizedBox(
            width: 200,
            child: AppButton.filled(
              onPressed: () {},
              child: Text(longText),
            ),
          ),
        ),
      );

      // Assert - Button should handle long text without overflow
      expect(find.text(longText), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('should maintain state during rebuilds',
        (WidgetTester tester) async {
      // Arrange
      var tapCount = 0;

      Widget buildButton(int counter) {
        return createTestWidget(
          child: AppButton.filled(
            child: Text('Tap Count: $counter'),
            onPressed: () {
              tapCount++;
            },
          ),
        );
      }

      // Act - Initial build
      await tester.pumpWidget(buildButton(0));

      // Tap button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Rebuild with new counter
      await tester.pumpWidget(buildButton(tapCount));

      // Assert - Button should still be functional after rebuild
      expect(find.text('Tap Count: 1'), findsOneWidget);

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(tapCount, equals(2));
    });
  });
}
