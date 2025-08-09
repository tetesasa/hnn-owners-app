import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hnn_owners/application/usecases/sign_out_usecase.dart';
import 'package:hnn_owners/domain/repositories/auth_repository.dart';

// Mock class for AuthRepository
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SignOutUseCase signOutUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signOutUseCase = SignOutUseCase(authRepository: mockAuthRepository);
  });

  group('SignOutUseCase Tests', () {
    test('should successfully sign out when repository succeeds', () async {
      // Arrange
      when(() => mockAuthRepository.signOut()).thenAnswer((_) async {});

      // Act & Assert - Should not throw
      await expectLater(
        () => signOutUseCase.execute(),
        returnsNormally,
      );

      // Verify repository was called
      verify(() => mockAuthRepository.signOut()).called(1);
    });

    test('should throw exception when repository throws exception', () async {
      // Arrange
      const errorMessage = 'Network error';
      when(() => mockAuthRepository.signOut())
          .thenThrow(Exception(errorMessage));

      // Act & Assert
      await expectLater(
        () => signOutUseCase.execute(),
        throwsA(
          predicate((e) =>
              e is Exception &&
              e.toString().contains('ログアウトに失敗しました') &&
              e.toString().contains(errorMessage)),
        ),
      );

      // Verify repository was called
      verify(() => mockAuthRepository.signOut()).called(1);
    });

    test('should throw exception when repository throws string error',
        () async {
      // Arrange
      const errorMessage = 'String error message';
      when(() => mockAuthRepository.signOut()).thenThrow(errorMessage);

      // Act & Assert
      await expectLater(
        () => signOutUseCase.execute(),
        throwsA(
          predicate((e) =>
              e is Exception &&
              e.toString().contains('ログアウトに失敗しました') &&
              e.toString().contains(errorMessage)),
        ),
      );

      // Verify repository was called
      verify(() => mockAuthRepository.signOut()).called(1);
    });

    test('should handle various error types from repository', () async {
      // Test different error types
      final errorTypes = [
        Exception('Standard exception'),
        StateError('State error'),
        ArgumentError('Argument error'),
        'Simple string error',
        42, // Number error
      ];

      for (final error in errorTypes) {
        // Reset mock for each test
        reset(mockAuthRepository);

        // Arrange
        when(() => mockAuthRepository.signOut()).thenThrow(error);

        // Act & Assert
        await expectLater(
          () => signOutUseCase.execute(),
          throwsA(
            predicate(
                (e) => e is Exception && e.toString().contains('ログアウトに失敗しました')),
          ),
        );

        // Verify repository was called for each error type
        verify(() => mockAuthRepository.signOut()).called(1);
      }
    });

    test('should complete normally multiple times when repository succeeds',
        () async {
      // Arrange
      when(() => mockAuthRepository.signOut()).thenAnswer((_) async {});

      // Act - Call multiple times
      await signOutUseCase.execute();
      await signOutUseCase.execute();
      await signOutUseCase.execute();

      // Assert - Should complete without throwing
      verify(() => mockAuthRepository.signOut()).called(3);
    });

    test('should propagate timeout errors appropriately', () async {
      // Arrange - Simulate timeout
      when(() => mockAuthRepository.signOut()).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        throw Exception('Timeout');
      });

      // Act & Assert
      await expectLater(
        () => signOutUseCase.execute(),
        throwsA(
          predicate((e) =>
              e is Exception &&
              e.toString().contains('ログアウトに失敗しました') &&
              e.toString().contains('Timeout')),
        ),
      );

      verify(() => mockAuthRepository.signOut()).called(1);
    });
  });
}
