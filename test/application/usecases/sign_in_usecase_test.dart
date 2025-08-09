import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hnn_owners/application/usecases/sign_in_usecase.dart';
import 'package:hnn_owners/domain/entities/authentication_result.dart';
import 'package:hnn_owners/domain/entities/user.dart';
import 'package:hnn_owners/domain/repositories/auth_repository.dart';

// Mock class for AuthRepository
class MockAuthRepository extends Mock implements AuthRepository {}

// Fake class for SignInRequest
class FakeSignInRequest extends Fake implements SignInRequest {}

void main() {
  late SignInUseCase signInUseCase;
  late MockAuthRepository mockAuthRepository;

  setUpAll(() {
    registerFallbackValue(FakeSignInRequest());
  });

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signInUseCase = SignInUseCase(authRepository: mockAuthRepository);
  });

  group('SignInUseCase Tests', () {
    test('should return failure when email is empty', () async {
      // Arrange
      final request = SignInRequest(email: '', password: 'password123');

      // Act
      final result = await signInUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.failure));
      expect(result.message, equals('メールアドレスを入力してください。'));
    });

    test('should return failure when password is empty', () async {
      // Arrange
      final request = SignInRequest(email: 'test@example.com', password: '');

      // Act
      final result = await signInUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.failure));
      expect(result.message, equals('パスワードを入力してください。'));
    });

    test('should return failure when email format is invalid', () async {
      // Arrange
      final request =
          SignInRequest(email: 'invalid-email', password: 'password123');

      // Act
      final result = await signInUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.failure));
      expect(result.message, equals('有効なメールアドレスを入力してください。'));
    });

    test('should validate email formats correctly', () async {
      // Test invalid email formats
      final invalidEmails = [
        'invalid-email',
        'test@',
        '@example.com',
        'test..test@example.com',
        'test@.com',
        'test@com',
      ];

      for (final email in invalidEmails) {
        final request = SignInRequest(email: email, password: 'password123');
        final result = await signInUseCase.execute(request);
        expect(result.status, equals(AuthenticationStatus.failure));
        expect(result.message, equals('有効なメールアドレスを入力してください。'));
      }

      // Test valid email formats
      final validEmails = [
        'test@example.com',
        'user.name@example.co.jp',
        'test123@test-domain.com',
        'user+tag@example.org',
      ];

      final successResult = AuthenticationResult(
        user: User(
            uid: 'test-uid', email: 'test@example.com', emailVerified: true),
        status: AuthenticationStatus.success,
        message: 'ログインに成功しました。',
      );

      for (final email in validEmails) {
        when(() => mockAuthRepository.signInWithEmailAndPassword(any()))
            .thenAnswer((_) async => successResult);

        final request = SignInRequest(email: email, password: 'password123');
        final result = await signInUseCase.execute(request);
        expect(result.status, equals(AuthenticationStatus.success));
      }
    });

    test('should return success when sign in is successful with verified email',
        () async {
      // Arrange
      final request =
          SignInRequest(email: 'test@example.com', password: 'password123');
      final expectedResult = AuthenticationResult(
        user: User(
            uid: 'test-uid', email: 'test@example.com', emailVerified: true),
        status: AuthenticationStatus.success,
        message: 'ログインに成功しました。',
      );

      when(() => mockAuthRepository.signInWithEmailAndPassword(any()))
          .thenAnswer((_) async => expectedResult);

      // Act
      final result = await signInUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.success));
      expect(result.user.uid, equals('test-uid'));
      expect(result.user.email, equals('test@example.com'));
      expect(result.user.emailVerified, isTrue);
    });

    test('should return emailNotVerified when user email is not verified',
        () async {
      // Arrange
      final request =
          SignInRequest(email: 'test@example.com', password: 'password123');
      final repositoryResult = AuthenticationResult(
        user: User(
            uid: 'test-uid', email: 'test@example.com', emailVerified: false),
        status: AuthenticationStatus.success,
        message: 'ログインに成功しました。',
      );

      when(() => mockAuthRepository.signInWithEmailAndPassword(any()))
          .thenAnswer((_) async => repositoryResult);

      // Act
      final result = await signInUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.emailNotVerified));
      expect(result.message, equals('メールアドレスの認証が完了していません。認証メールをご確認ください。'));
      expect(result.user.emailVerified, isFalse);
    });

    test('should return success when user email verification is null',
        () async {
      // Arrange
      final request =
          SignInRequest(email: 'test@example.com', password: 'password123');
      final repositoryResult = AuthenticationResult(
        user: User(
            uid: 'test-uid', email: 'test@example.com', emailVerified: null),
        status: AuthenticationStatus.success,
        message: 'ログインに成功しました。',
      );

      when(() => mockAuthRepository.signInWithEmailAndPassword(any()))
          .thenAnswer((_) async => repositoryResult);

      // Act
      final result = await signInUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.success));
      expect(result.user.emailVerified, isNull);
    });

    test('should return failure when repository throws exception', () async {
      // Arrange
      final request =
          SignInRequest(email: 'test@example.com', password: 'password123');
      when(() => mockAuthRepository.signInWithEmailAndPassword(any()))
          .thenThrow(Exception('Network error'));

      // Act
      final result = await signInUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.failure));
      expect(result.message, contains('ログインに失敗しました'));
      expect(result.message, contains('Network error'));
    });

    test('should pass through repository failure results', () async {
      // Arrange
      final request =
          SignInRequest(email: 'test@example.com', password: 'wrongpassword');
      final repositoryResult = AuthenticationResult(
        user: const User(uid: '', email: ''),
        status: AuthenticationStatus.failure,
        message: 'Invalid credentials',
      );

      when(() => mockAuthRepository.signInWithEmailAndPassword(any()))
          .thenAnswer((_) async => repositoryResult);

      // Act
      final result = await signInUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.failure));
      expect(result.message, equals('Invalid credentials'));
    });
  });
}
