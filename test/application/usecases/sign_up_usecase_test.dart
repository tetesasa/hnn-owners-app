import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hnn_owners/application/usecases/sign_up_usecase.dart';
import 'package:hnn_owners/domain/entities/authentication_result.dart';
import 'package:hnn_owners/domain/entities/user.dart';
import 'package:hnn_owners/domain/repositories/auth_repository.dart';

// Mock class for AuthRepository
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SignUpUseCase signUpUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signUpUseCase = SignUpUseCase(authRepository: mockAuthRepository);
  });

  group('SignUpUseCase Tests', () {
    test('should return failure when email is empty', () async {
      // Arrange
      final request = SignUpRequest(
        email: '',
        password: 'password123',
        name: 'Test User',
        phone: '090-1234-5678',
      );

      // Act
      final result = await signUpUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.failure));
      expect(result.message, equals('メールアドレスを入力してください。'));
      verifyNever(() => mockAuthRepository.signUpWithEmailAndPassword(any()));
    });

    test('should return failure when password is empty', () async {
      // Arrange
      final request = SignUpRequest(
        email: 'test@example.com',
        password: '',
        name: 'Test User',
        phone: '090-1234-5678',
      );

      // Act
      final result = await signUpUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.failure));
      expect(result.message, equals('パスワードを入力してください。'));
      verifyNever(() => mockAuthRepository.signUpWithEmailAndPassword(any()));
    });

    test('should return failure when name is empty', () async {
      // Arrange
      final request = SignUpRequest(
        email: 'test@example.com',
        password: 'password123',
        name: '',
        phone: '090-1234-5678',
      );

      // Act
      final result = await signUpUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.failure));
      expect(result.message, equals('お名前を入力してください。'));
      verifyNever(() => mockAuthRepository.signUpWithEmailAndPassword(any()));
    });

    test('should return failure when phone is empty', () async {
      // Arrange
      final request = SignUpRequest(
        email: 'test@example.com',
        password: 'password123',
        name: 'Test User',
        phone: '',
      );

      // Act
      final result = await signUpUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.failure));
      expect(result.message, equals('電話番号を入力してください。'));
      verifyNever(() => mockAuthRepository.signUpWithEmailAndPassword(any()));
    });

    test('should return failure when email format is invalid', () async {
      // Arrange
      final request = SignUpRequest(
        email: 'invalid-email',
        password: 'password123',
        name: 'Test User',
        phone: '090-1234-5678',
      );

      // Act
      final result = await signUpUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.failure));
      expect(result.message, equals('有効なメールアドレスを入力してください。'));
      verifyNever(() => mockAuthRepository.signUpWithEmailAndPassword(any()));
    });

    test('should return failure when password is too short', () async {
      // Arrange
      final request = SignUpRequest(
        email: 'test@example.com',
        password: '12345', // 5 characters, should be at least 6
        name: 'Test User',
        phone: '090-1234-5678',
      );

      // Act
      final result = await signUpUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.failure));
      expect(result.message, equals('パスワードは6文字以上で入力してください。'));
      verifyNever(() => mockAuthRepository.signUpWithEmailAndPassword(any()));
    });

    test('should return failure when name is too short', () async {
      // Arrange
      final request = SignUpRequest(
        email: 'test@example.com',
        password: 'password123',
        name: 'A', // 1 character, should be at least 2
        phone: '090-1234-5678',
      );

      // Act
      final result = await signUpUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.failure));
      expect(result.message, equals('お名前は2文字以上で入力してください。'));
      verifyNever(() => mockAuthRepository.signUpWithEmailAndPassword(any()));
    });

    test('should return failure when phone number format is invalid', () async {
      // Test various invalid phone formats
      final invalidPhones = [
        '1234567890', // doesn't start with 0
        '0123', // too short
        '012345678901', // too long
        '0ab-1234-5678', // contains letters
        '090-12-34', // too short with hyphens
      ];

      for (final phone in invalidPhones) {
        final request = SignUpRequest(
          email: 'test@example.com',
          password: 'password123',
          name: 'Test User',
          phone: phone,
        );

        final result = await signUpUseCase.execute(request);
        expect(result.status, equals(AuthenticationStatus.failure));
        expect(result.message, equals('有効な電話番号を入力してください。'));
      }

      verifyNever(() => mockAuthRepository.signUpWithEmailAndPassword(any()));
    });

    test('should accept valid phone number formats', () async {
      // Test various valid phone formats
      final validPhones = [
        '09012345678', // 11 digits
        '0312345678', // 10 digits
        '090-1234-5678', // with hyphens
        '03-1234-5678', // with hyphens
        '090 1234 5678', // with spaces
        '(090)1234-5678', // with parentheses
      ];

      final successResult = AuthenticationResult(
        user: User(uid: 'test-uid', email: 'test@example.com'),
        status: AuthenticationStatus.success,
        message: 'アカウントが作成されました。',
      );

      for (final phone in validPhones) {
        reset(mockAuthRepository);

        when(() => mockAuthRepository.signUpWithEmailAndPassword(any()))
            .thenAnswer((_) async => successResult);
        when(() => mockAuthRepository.sendEmailVerification())
            .thenAnswer((_) async {});

        final request = SignUpRequest(
          email: 'test@example.com',
          password: 'password123',
          name: 'Test User',
          phone: phone,
        );

        final result = await signUpUseCase.execute(request);
        expect(result.status, equals(AuthenticationStatus.success));
      }
    });

    test('should return success when sign up is successful', () async {
      // Arrange
      final request = SignUpRequest(
        email: 'test@example.com',
        password: 'password123',
        name: 'Test User',
        phone: '090-1234-5678',
      );

      final expectedResult = AuthenticationResult(
        user: User(uid: 'test-uid', email: 'test@example.com'),
        status: AuthenticationStatus.success,
        message: 'アカウントが作成されました。',
      );

      when(() => mockAuthRepository.signUpWithEmailAndPassword(request))
          .thenAnswer((_) async => expectedResult);
      when(() => mockAuthRepository.sendEmailVerification())
          .thenAnswer((_) async {});

      // Act
      final result = await signUpUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.success));
      expect(result.user.uid, equals('test-uid'));
      expect(result.user.email, equals('test@example.com'));
      verify(() => mockAuthRepository.signUpWithEmailAndPassword(request))
          .called(1);
      verify(() => mockAuthRepository.sendEmailVerification()).called(1);
    });

    test('should send email verification after successful sign up', () async {
      // Arrange
      final request = SignUpRequest(
        email: 'test@example.com',
        password: 'password123',
        name: 'Test User',
        phone: '090-1234-5678',
      );

      final successResult = AuthenticationResult(
        user: User(uid: 'test-uid', email: 'test@example.com'),
        status: AuthenticationStatus.success,
        message: 'アカウントが作成されました。',
      );

      when(() => mockAuthRepository.signUpWithEmailAndPassword(request))
          .thenAnswer((_) async => successResult);
      when(() => mockAuthRepository.sendEmailVerification())
          .thenAnswer((_) async {});

      // Act
      final result = await signUpUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.success));
      verify(() => mockAuthRepository.sendEmailVerification()).called(1);
    });

    test('should handle email verification failure gracefully', () async {
      // Arrange
      final request = SignUpRequest(
        email: 'test@example.com',
        password: 'password123',
        name: 'Test User',
        phone: '090-1234-5678',
      );

      final successResult = AuthenticationResult(
        user: User(uid: 'test-uid', email: 'test@example.com'),
        status: AuthenticationStatus.success,
        message: 'アカウントが作成されました。',
      );

      when(() => mockAuthRepository.signUpWithEmailAndPassword(request))
          .thenAnswer((_) async => successResult);
      when(() => mockAuthRepository.sendEmailVerification())
          .thenThrow(Exception('Email service error'));

      // Act
      final result = await signUpUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.success));
      expect(result.message, contains('アカウントが作成されました。'));
      expect(result.message, contains('認証メールの送信に失敗しました'));
      verify(() => mockAuthRepository.sendEmailVerification()).called(1);
    });

    test('should not send email verification when sign up fails', () async {
      // Arrange
      final request = SignUpRequest(
        email: 'test@example.com',
        password: 'password123',
        name: 'Test User',
        phone: '090-1234-5678',
      );

      final failureResult = AuthenticationResult(
        user: const User(uid: '', email: ''),
        status: AuthenticationStatus.failure,
        message: 'Email already exists',
      );

      when(() => mockAuthRepository.signUpWithEmailAndPassword(request))
          .thenAnswer((_) async => failureResult);

      // Act
      final result = await signUpUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.failure));
      expect(result.message, equals('Email already exists'));
      verifyNever(() => mockAuthRepository.sendEmailVerification());
    });

    test('should return failure when repository throws exception', () async {
      // Arrange
      final request = SignUpRequest(
        email: 'test@example.com',
        password: 'password123',
        name: 'Test User',
        phone: '090-1234-5678',
      );

      when(() => mockAuthRepository.signUpWithEmailAndPassword(request))
          .thenThrow(Exception('Network error'));

      // Act
      final result = await signUpUseCase.execute(request);

      // Assert
      expect(result.status, equals(AuthenticationStatus.failure));
      expect(result.message, contains('アカウント作成に失敗しました'));
      expect(result.message, contains('Network error'));
      verifyNever(() => mockAuthRepository.sendEmailVerification());
    });

    test('should validate all fields in combination', () async {
      // Arrange - Valid request with all required fields
      final validRequest = SignUpRequest(
        email: 'valid@example.com',
        password: 'validPassword123',
        name: 'Valid User',
        phone: '090-1234-5678',
      );

      final successResult = AuthenticationResult(
        user: User(uid: 'test-uid', email: 'valid@example.com'),
        status: AuthenticationStatus.success,
        message: 'アカウントが作成されました。',
      );

      when(() => mockAuthRepository.signUpWithEmailAndPassword(validRequest))
          .thenAnswer((_) async => successResult);
      when(() => mockAuthRepository.sendEmailVerification())
          .thenAnswer((_) async {});

      // Act
      final result = await signUpUseCase.execute(validRequest);

      // Assert
      expect(result.status, equals(AuthenticationStatus.success));
      verify(() => mockAuthRepository.signUpWithEmailAndPassword(validRequest))
          .called(1);
      verify(() => mockAuthRepository.sendEmailVerification()).called(1);
    });
  });
}
