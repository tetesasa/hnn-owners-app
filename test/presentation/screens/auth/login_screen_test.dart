import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hnn_owners/presentation/screens/auth/login_screen.dart';
import 'package:hnn_owners/application/providers/auth_providers.dart';
import 'package:hnn_owners/domain/entities/authentication_result.dart';
import 'package:hnn_owners/domain/entities/user.dart';

// Mock classes
class MockAuthNotifier extends Mock implements AuthNotifier {}

void main() {
  group('LoginScreen Widget Tests', () {
    late MockAuthNotifier mockAuthNotifier;

    setUp(() {
      mockAuthNotifier = MockAuthNotifier();
    });

    Widget createTestWidget() {
      return ProviderScope(
        overrides: [
          authNotifierProvider.overrideWith(() => mockAuthNotifier),
        ],
        child: const MaterialApp(
          home: LoginScreen(),
        ),
      );
    }

    testWidgets('should display login form elements',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());

      // Assert
      expect(find.text('ログイン'), findsOneWidget);
      expect(find.text('メールアドレス'), findsOneWidget);
      expect(find.text('パスワード'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.text('ログインする'), findsOneWidget);
      expect(find.text('パスワードを忘れた方'), findsOneWidget);
      expect(find.text('アカウントをお持ちでない方'), findsOneWidget);
    });

    testWidgets('should validate email field', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());

      // Find email field and submit without entering anything
      find.widgetWithText(TextFormField, 'メールアドレス');
      await tester.tap(find.text('ログインする'));
      await tester.pump();

      // Assert
      expect(find.text('メールアドレスを入力してください'), findsOneWidget);
    });

    testWidgets('should validate email format', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());

      // Enter invalid email
      final emailField = find.byType(TextFormField).first;
      await tester.enterText(emailField, 'invalid-email');
      await tester.tap(find.text('ログインする'));
      await tester.pump();

      // Assert
      expect(find.text('正しいメールアドレスを入力してください'), findsOneWidget);
    });

    testWidgets('should validate password field', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());

      // Enter valid email but no password
      final emailField = find.byType(TextFormField).first;
      await tester.enterText(emailField, 'test@example.com');
      await tester.tap(find.text('ログインする'));
      await tester.pump();

      // Assert
      expect(find.text('パスワードを入力してください'), findsOneWidget);
    });

    testWidgets('should hide/show password', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());

      final passwordField = find.byType(TextFormField).last;
      await tester.enterText(passwordField, 'password123');

      // Initially password should be hidden
      TextField textField = tester.widget(passwordField);
      expect(textField.obscureText, isTrue);

      // Tap show password icon
      final showPasswordIcon = find.byIcon(Icons.visibility);
      await tester.tap(showPasswordIcon);
      await tester.pump();

      // Password should now be visible
      textField = tester.widget(passwordField);
      expect(textField.obscureText, isFalse);

      // Tap hide password icon
      final hidePasswordIcon = find.byIcon(Icons.visibility_off);
      await tester.tap(hidePasswordIcon);
      await tester.pump();

      // Password should be hidden again
      textField = tester.widget(passwordField);
      expect(textField.obscureText, isTrue);
    });

    testWidgets('should submit login form with valid data',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockAuthNotifier.signIn(any()))
          .thenAnswer((_) async => AuthenticationResult(
                user: User(uid: 'test-uid', email: 'test@example.com'),
                status: AuthenticationStatus.success,
              ));

      // Act
      await tester.pumpWidget(createTestWidget());

      // Enter valid credentials
      final emailField = find.byType(TextFormField).first;
      final passwordField = find.byType(TextFormField).last;

      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'password123');

      await tester.tap(find.text('ログインする'));
      await tester.pump();

      // Assert
      verify(() => mockAuthNotifier.signIn(any(
          that: predicate<SignInRequest>((req) =>
              req.email == 'test@example.com' &&
              req.password == 'password123')))).called(1);
    });

    testWidgets('should show loading indicator during login',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockAuthNotifier.signIn(any())).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 2));
        return AuthenticationResult(
          user: User(uid: 'test-uid', email: 'test@example.com'),
          status: AuthenticationStatus.success,
        );
      });

      // Act
      await tester.pumpWidget(createTestWidget());

      // Enter credentials and submit
      await tester.enterText(
          find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('ログインする'));
      await tester.pump();

      // Assert - Loading indicator should be visible
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('ログイン中...'), findsOneWidget);

      // Wait for completion
      await tester.pump(Duration(seconds: 2));
    });

    testWidgets('should display error message on login failure',
        (WidgetTester tester) async {
      // Arrange
      const errorMessage = 'メールアドレスまたはパスワードが間違っています';
      when(() => mockAuthNotifier.signIn(any()))
          .thenAnswer((_) async => AuthenticationResult(
                user: const User(uid: '', email: ''),
                status: AuthenticationStatus.failure,
                message: errorMessage,
              ));

      // Act
      await tester.pumpWidget(createTestWidget());

      await tester.enterText(
          find.byType(TextFormField).first, 'wrong@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'wrongpassword');
      await tester.tap(find.text('ログインする'));
      await tester.pump();

      // Assert
      expect(find.text(errorMessage), findsOneWidget);
      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets('should handle email not verified error',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockAuthNotifier.signIn(any()))
          .thenAnswer((_) async => AuthenticationResult(
                user: User(
                    uid: 'test-uid',
                    email: 'test@example.com',
                    emailVerified: false),
                status: AuthenticationStatus.emailNotVerified,
                message: 'メールアドレスの認証が必要です',
              ));

      // Act
      await tester.pumpWidget(createTestWidget());

      await tester.enterText(
          find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('ログインする'));
      await tester.pump();

      // Assert
      expect(find.text('メールアドレスの認証が必要です'), findsOneWidget);
      expect(find.text('認証メールを再送信'), findsOneWidget);
    });

    testWidgets('should navigate to forgot password screen',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());

      await tester.tap(find.text('パスワードを忘れた方'));
      await tester.pumpAndSettle();

      // Assert - Should navigate to forgot password screen
      // Note: In a real app, you would test navigation using a mock navigator
      expect(find.text('パスワードリセット'), findsOneWidget);
    });

    testWidgets('should navigate to register screen',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());

      await tester.tap(find.text('新規登録はこちら'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('アカウント作成'), findsOneWidget);
    });

    testWidgets('should be accessible', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());

      // Assert - Check semantic labels
      expect(find.bySemanticsLabel('メールアドレス入力欄'), findsOneWidget);
      expect(find.bySemanticsLabel('パスワード入力欄'), findsOneWidget);
      expect(find.bySemanticsLabel('ログインボタン'), findsOneWidget);
    });

    testWidgets('should handle keyboard navigation',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());

      // Focus email field
      await tester.tap(find.byType(TextFormField).first);
      await tester.pump();

      // Press Tab to move to password field
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();

      // Press Enter to submit form
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();

      // Assert - Form validation should trigger
      expect(find.text('メールアドレスを入力してください'), findsOneWidget);
    });

    testWidgets('should persist email in form field',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());

      const testEmail = 'persistent@example.com';
      await tester.enterText(find.byType(TextFormField).first, testEmail);

      // Trigger rebuild
      await tester.pump();

      // Assert - Email should still be there
      final emailField =
          tester.widget<TextFormField>(find.byType(TextFormField).first);
      expect(emailField.controller?.text, equals(testEmail));
    });

    testWidgets('should clear form after successful login',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockAuthNotifier.signIn(any()))
          .thenAnswer((_) async => AuthenticationResult(
                user: User(uid: 'test-uid', email: 'test@example.com'),
                status: AuthenticationStatus.success,
              ));

      // Act
      await tester.pumpWidget(createTestWidget());

      await tester.enterText(
          find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('ログインする'));
      await tester.pumpAndSettle();

      // Assert - Form fields should be cleared
      final emailField =
          tester.widget<TextFormField>(find.byType(TextFormField).first);
      final passwordField =
          tester.widget<TextFormField>(find.byType(TextFormField).last);

      expect(emailField.controller?.text, isEmpty);
      expect(passwordField.controller?.text, isEmpty);
    });
  });
}
