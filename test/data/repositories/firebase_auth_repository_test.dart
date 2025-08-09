import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:hnn_owners/data/repositories/firebase_auth_repository.dart';
import 'package:hnn_owners/domain/entities/authentication_result.dart';
import 'package:hnn_owners/domain/entities/user.dart';
import 'package:hnn_owners/domain/repositories/customer_repository.dart';

// Mock classes
class MockFirebaseAuth extends Mock implements firebase_auth.FirebaseAuth {}

class MockFirebaseFunctions extends Mock implements FirebaseFunctions {}

class MockCustomerRepository extends Mock implements CustomerRepository {}

class MockUserCredential extends Mock implements firebase_auth.UserCredential {}

class MockUser extends Mock implements firebase_auth.User {}

class MockHttpsCallable extends Mock implements HttpsCallable {}

class MockHttpsCallableResult extends Mock implements HttpsCallableResult {}

// Fake classes for registerFallbackValue
class FakeSignInRequest extends Fake implements SignInRequest {}

class FakeSignUpRequest extends Fake implements SignUpRequest {}

void main() {
  late FirebaseAuthRepository repository;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockFirebaseFunctions mockFunctions;
  late MockCustomerRepository mockCustomerRepository;

  setUpAll(() {
    registerFallbackValue(FakeSignInRequest());
    registerFallbackValue(FakeSignUpRequest());
  });

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockFunctions = MockFirebaseFunctions();
    mockCustomerRepository = MockCustomerRepository();

    repository = FirebaseAuthRepository(
      firebaseAuth: mockFirebaseAuth,
      functions: mockFunctions,
      customerRepository: mockCustomerRepository,
    );
  });

  group('FirebaseAuthRepository Tests', () {
    group('signInWithEmailAndPassword', () {
      test('should return success result when sign in succeeds', () async {
        // Arrange
        final request =
            SignInRequest(email: 'test@example.com', password: 'password123');
        final mockUser = MockUser();
        final mockUserCredential = MockUserCredential();

        when(() => mockUser.uid).thenReturn('test-uid');
        when(() => mockUser.email).thenReturn('test@example.com');
        when(() => mockUser.displayName).thenReturn('Test User');
        when(() => mockUser.emailVerified).thenReturn(true);
        when(() => mockUserCredential.user).thenReturn(mockUser);

        when(() => mockFirebaseAuth.signInWithEmailAndPassword(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => mockUserCredential);

        // Act
        final result = await repository.signInWithEmailAndPassword(request);

        // Assert
        expect(result.status, equals(AuthenticationStatus.success));
        expect(result.user.uid, equals('test-uid'));
        expect(result.user.email, equals('test@example.com'));
        expect(result.user.emailVerified, isTrue);
        verify(() => mockFirebaseAuth.signInWithEmailAndPassword(
              email: 'test@example.com',
              password: 'password123',
            )).called(1);
      });

      test('should return failure result when sign in fails', () async {
        // Arrange
        final request =
            SignInRequest(email: 'test@example.com', password: 'wrongpassword');

        when(() => mockFirebaseAuth.signInWithEmailAndPassword(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenThrow(firebase_auth.FirebaseAuthException(
          code: 'wrong-password',
          message: 'パスワードが間違っています',
        ));

        // Act
        final result = await repository.signInWithEmailAndPassword(request);

        // Assert
        expect(result.status, equals(AuthenticationStatus.failure));
        expect(result.message, contains('パスワードが間違っています'));
      });

      test('should return failure result when user not found', () async {
        // Arrange
        final request = SignInRequest(
            email: 'notfound@example.com', password: 'password123');

        when(() => mockFirebaseAuth.signInWithEmailAndPassword(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenThrow(firebase_auth.FirebaseAuthException(
          code: 'user-not-found',
          message: 'ユーザーが見つかりません',
        ));

        // Act
        final result = await repository.signInWithEmailAndPassword(request);

        // Assert
        expect(result.status, equals(AuthenticationStatus.failure));
        expect(result.message, contains('ユーザーが見つかりません'));
      });
    });

    group('signUpWithEmailAndPassword', () {
      test('should return success result when sign up succeeds', () async {
        // Arrange
        final request = SignUpRequest(
          email: 'newuser@example.com',
          password: 'password123',
          name: 'New User',
          phone: '090-1234-5678',
        );
        final mockUser = MockUser();
        final mockUserCredential = MockUserCredential();

        when(() => mockUser.uid).thenReturn('new-user-uid');
        when(() => mockUser.email).thenReturn('newuser@example.com');
        when(() => mockUser.displayName).thenReturn(null);
        when(() => mockUser.emailVerified).thenReturn(false);
        when(() => mockUserCredential.user).thenReturn(mockUser);

        when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => mockUserCredential);

        when(() => mockUser.updateDisplayName(any())).thenAnswer((_) async {});

        // Act
        final result = await repository.signUpWithEmailAndPassword(request);

        // Assert
        expect(result.status, equals(AuthenticationStatus.success));
        expect(result.user.uid, equals('new-user-uid'));
        expect(result.user.email, equals('newuser@example.com'));
        expect(result.user.emailVerified, isFalse);
        verify(() => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: 'newuser@example.com',
              password: 'password123',
            )).called(1);
        verify(() => mockUser.updateDisplayName('New User')).called(1);
      });

      test('should return failure result when email already exists', () async {
        // Arrange
        final request = SignUpRequest(
          email: 'existing@example.com',
          password: 'password123',
          name: 'Existing User',
          phone: '090-1234-5678',
        );

        when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenThrow(firebase_auth.FirebaseAuthException(
          code: 'email-already-in-use',
          message: 'このメールアドレスは既に使用されています',
        ));

        // Act
        final result = await repository.signUpWithEmailAndPassword(request);

        // Assert
        expect(result.status, equals(AuthenticationStatus.failure));
        expect(result.message, contains('このメールアドレスは既に使用されています'));
      });

      test('should return failure result when password is weak', () async {
        // Arrange
        final request = SignUpRequest(
          email: 'newuser@example.com',
          password: '123',
          name: 'New User',
          phone: '090-1234-5678',
        );

        when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenThrow(firebase_auth.FirebaseAuthException(
          code: 'weak-password',
          message: 'パスワードが弱すぎます',
        ));

        // Act
        final result = await repository.signUpWithEmailAndPassword(request);

        // Assert
        expect(result.status, equals(AuthenticationStatus.failure));
        expect(result.message, contains('パスワードが弱すぎます'));
      });
    });

    group('signOut', () {
      test('should sign out successfully', () async {
        // Arrange
        when(() => mockFirebaseAuth.signOut()).thenAnswer((_) async {});

        // Act & Assert
        await expectLater(
          () => repository.signOut(),
          returnsNormally,
        );

        verify(() => mockFirebaseAuth.signOut()).called(1);
      });

      test('should throw exception when sign out fails', () async {
        // Arrange
        when(() => mockFirebaseAuth.signOut())
            .thenThrow(Exception('Sign out failed'));

        // Act & Assert
        await expectLater(
          () => repository.signOut(),
          throwsException,
        );

        verify(() => mockFirebaseAuth.signOut()).called(1);
      });
    });

    group('sendPasswordResetEmail', () {
      test('should send password reset email successfully', () async {
        // Arrange
        const email = 'reset@example.com';
        when(() => mockFirebaseAuth.sendPasswordResetEmail(email: email))
            .thenAnswer((_) async {});

        // Act & Assert
        await expectLater(
          () => repository.sendPasswordResetEmail(email),
          returnsNormally,
        );

        verify(() => mockFirebaseAuth.sendPasswordResetEmail(email: email))
            .called(1);
      });

      test('should throw exception when email not found', () async {
        // Arrange
        const email = 'notfound@example.com';
        when(() => mockFirebaseAuth.sendPasswordResetEmail(email: email))
            .thenThrow(firebase_auth.FirebaseAuthException(
          code: 'user-not-found',
          message: 'ユーザーが見つかりません',
        ));

        // Act & Assert
        await expectLater(
          () => repository.sendPasswordResetEmail(email),
          throwsA(isA<firebase_auth.FirebaseAuthException>()),
        );
      });
    });

    group('sendEmailVerification', () {
      test('should send email verification successfully', () async {
        // Arrange
        final mockUser = MockUser();
        when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(() => mockUser.sendEmailVerification()).thenAnswer((_) async {});

        // Act & Assert
        await expectLater(
          () => repository.sendEmailVerification(),
          returnsNormally,
        );

        verify(() => mockUser.sendEmailVerification()).called(1);
      });

      test('should throw exception when no current user', () async {
        // Arrange
        when(() => mockFirebaseAuth.currentUser).thenReturn(null);

        // Act & Assert
        await expectLater(
          () => repository.sendEmailVerification(),
          throwsException,
        );
      });
    });

    group('updateProfile', () {
      test('should update profile successfully', () async {
        // Arrange
        final mockUser = MockUser();
        const displayName = 'Updated Name';
        const photoURL = 'https://example.com/photo.jpg';

        when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(() => mockUser.updateDisplayName(displayName))
            .thenAnswer((_) async {});
        when(() => mockUser.updatePhotoURL(photoURL)).thenAnswer((_) async {});

        // Act & Assert
        await expectLater(
          () => repository.updateProfile(
            displayName: displayName,
            photoURL: photoURL,
          ),
          returnsNormally,
        );

        verify(() => mockUser.updateDisplayName(displayName)).called(1);
        verify(() => mockUser.updatePhotoURL(photoURL)).called(1);
      });

      test('should throw exception when no current user', () async {
        // Arrange
        when(() => mockFirebaseAuth.currentUser).thenReturn(null);

        // Act & Assert
        await expectLater(
          () => repository.updateProfile(displayName: 'Test'),
          throwsException,
        );
      });
    });

    group('currentUser', () {
      test('should return current user when authenticated', () {
        // Arrange
        final mockUser = MockUser();
        when(() => mockUser.uid).thenReturn('current-user-uid');
        when(() => mockUser.email).thenReturn('current@example.com');
        when(() => mockUser.displayName).thenReturn('Current User');
        when(() => mockUser.emailVerified).thenReturn(true);
        when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);

        // Act
        final result = repository.currentUser;

        // Assert
        expect(result, isNotNull);
        expect(result!.uid, equals('current-user-uid'));
        expect(result.email, equals('current@example.com'));
        expect(result.emailVerified, isTrue);
      });

      test('should return null when not authenticated', () {
        // Arrange
        when(() => mockFirebaseAuth.currentUser).thenReturn(null);

        // Act
        final result = repository.currentUser;

        // Assert
        expect(result, isNull);
      });
    });

    group('authStateChanges', () {
      test('should stream authentication state changes', () {
        // Arrange
        final mockUser = MockUser();
        when(() => mockUser.uid).thenReturn('stream-user-uid');
        when(() => mockUser.email).thenReturn('stream@example.com');
        when(() => mockUser.displayName).thenReturn('Stream User');
        when(() => mockUser.emailVerified).thenReturn(true);

        final authStateController = StreamController<firebase_auth.User?>();
        when(() => mockFirebaseAuth.authStateChanges())
            .thenAnswer((_) => authStateController.stream);

        // Act
        final stream = repository.authStateChanges;

        // Assert
        expect(stream, isA<Stream<User?>>());

        // Test stream values
        authStateController.add(mockUser);
        authStateController.add(null);
        authStateController.close();
      });
    });
  });
}
