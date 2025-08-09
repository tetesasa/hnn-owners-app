import '../entities/user.dart';
import '../entities/authentication_result.dart';

abstract class AuthRepository {
  Stream<User?> get authStateChanges;
  User? get currentUser;

  Future<AuthenticationResult> signInWithEmailAndPassword(
    SignInRequest request,
  );

  Future<AuthenticationResult> signUpWithEmailAndPassword(
    SignUpRequest request,
  );

  Future<void> signOut();

  Future<void> sendPasswordResetEmail(String email);

  Future<void> sendEmailVerification();

  Future<User?> refreshUser();

  Future<void> updateProfile({
    String? displayName,
    String? photoURL,
  });

  Future<void> updateEmail(String newEmail);

  Future<void> updatePassword(String newPassword);

  Future<void> deleteAccount();

  Future<Map<String, dynamic>?> getCustomClaims();

  Future<void> refreshCustomClaims();
}
