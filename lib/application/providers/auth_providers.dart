import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/authentication_result.dart';
import '../../domain/enums/user_role.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../data/repositories/firebase_auth_repository.dart';
import '../../data/repositories/firestore_customer_repository.dart';
import '../usecases/sign_in_usecase.dart';
import '../usecases/sign_up_usecase.dart';
import '../usecases/sign_out_usecase.dart';
import '../usecases/link_existing_customer_usecase.dart';

part 'auth_providers.g.dart';

// Firebase インスタンスプロバイダー
@riverpod
firebase_auth.FirebaseAuth firebaseAuth(Ref ref) {
  return firebase_auth.FirebaseAuth.instance;
}

@riverpod
FirebaseFirestore firebaseFirestore(Ref ref) {
  return FirebaseFirestore.instance;
}

@riverpod
FirebaseFunctions firebaseFunctions(Ref ref) {
  return FirebaseFunctions.instance;
}

@riverpod
FirebaseStorage firebaseStorage(Ref ref) {
  return FirebaseStorage.instance;
}

// リポジトリプロバイダー
@riverpod
CustomerRepository customerRepository(Ref ref) {
  return FirestoreCustomerRepository(
    firestore: ref.watch(firebaseFirestoreProvider),
  );
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return FirebaseAuthRepository(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    functions: ref.watch(firebaseFunctionsProvider),
    customerRepository: ref.watch(customerRepositoryProvider),
  );
}

// UseCase プロバイダー
@riverpod
SignInUseCase signInUseCase(Ref ref) {
  return SignInUseCase(
    authRepository: ref.watch(authRepositoryProvider),
  );
}

@riverpod
SignUpUseCase signUpUseCase(Ref ref) {
  return SignUpUseCase(
    authRepository: ref.watch(authRepositoryProvider),
  );
}

@riverpod
SignOutUseCase signOutUseCase(Ref ref) {
  return SignOutUseCase(
    authRepository: ref.watch(authRepositoryProvider),
  );
}

@riverpod
LinkExistingCustomerUseCase linkExistingCustomerUseCase(
  Ref ref,
) {
  return LinkExistingCustomerUseCase(
    customerRepository: ref.watch(customerRepositoryProvider),
  );
}

// 認証状態管理プロバイダー
@riverpod
Stream<User?> authStateChanges(Ref ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<User?> build() async {
    final authRepo = ref.watch(authRepositoryProvider);
    final currentUser = authRepo.currentUser;

    if (currentUser != null) {
      // Custom claims を更新
      try {
        await authRepo.refreshCustomClaims();
        return await authRepo.refreshUser();
      } catch (e) {
        // エラーが発生しても現在のユーザー情報を返す
        return currentUser;
      }
    }

    return currentUser;
  }

  Future<AuthenticationResult> signIn(SignInRequest request) async {
    final useCase = ref.read(signInUseCaseProvider);
    final result = await useCase.execute(request);

    if (result.status == AuthenticationStatus.success) {
      // 状態を更新
      ref.invalidateSelf();
    }

    return result;
  }

  Future<AuthenticationResult> signUp(SignUpRequest request) async {
    final useCase = ref.read(signUpUseCaseProvider);
    final result = await useCase.execute(request);

    if (result.status == AuthenticationStatus.success) {
      // 状態を更新
      ref.invalidateSelf();
    }

    return result;
  }

  Future<void> signOut() async {
    final useCase = ref.read(signOutUseCaseProvider);
    await useCase.execute();

    // 状態を更新
    ref.invalidateSelf();
  }

  Future<AuthenticationResult> linkExistingCustomer({
    required String customerId,
    String? additionalInfo,
  }) async {
    final currentUser = await future;
    if (currentUser == null) {
      return const AuthenticationResult(
        user: User(uid: '', email: ''),
        status: AuthenticationStatus.failure,
        message: 'ユーザーがログインしていません。',
      );
    }

    final useCase = ref.read(linkExistingCustomerUseCaseProvider);
    final result = await useCase.execute(
      firebaseUid: currentUser.uid,
      customerId: customerId,
      additionalInfo: additionalInfo,
    );

    if (result.status == AuthenticationStatus.success) {
      // 状態を更新
      ref.invalidateSelf();
    }

    return result;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    final authRepo = ref.read(authRepositoryProvider);
    await authRepo.sendPasswordResetEmail(email);
  }

  Future<void> sendEmailVerification() async {
    final authRepo = ref.read(authRepositoryProvider);
    await authRepo.sendEmailVerification();
  }

  Future<void> updateProfile({
    String? displayName,
    String? photoURL,
  }) async {
    final authRepo = ref.read(authRepositoryProvider);
    await authRepo.updateProfile(
      displayName: displayName,
      photoURL: photoURL,
    );

    // 状態を更新
    ref.invalidateSelf();
  }
}

// 認証状態に基づく簡易プロバイダー
@riverpod
bool isAuthenticated(Ref ref) {
  final authState = ref.watch(authStateChangesProvider);
  return authState.whenData((user) => user != null).valueOrNull ?? false;
}

@riverpod
bool isAuthenticatedAsOwner(Ref ref) {
  final authState = ref.watch(authStateChangesProvider);
  return authState.whenData((user) {
        return user != null &&
            user.role == UserRole.owner &&
            user.customerId != null;
      }).valueOrNull ??
      false;
}

// エラーハンドリング用プロバイダー
@riverpod
class AuthErrorNotifier extends _$AuthErrorNotifier {
  @override
  String? build() => null;

  void setError(String error) {
    state = error;
  }

  void clearError() {
    state = null;
  }
}

// ローディング状態管理プロバイダー
@riverpod
class AuthLoadingNotifier extends _$AuthLoadingNotifier {
  @override
  bool build() => false;

  void setLoading(bool loading) {
    state = loading;
  }
}
