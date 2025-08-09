import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_functions/cloud_functions.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/authentication_result.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../domain/enums/user_role.dart';
import '../../domain/enums/permission.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({
    required firebase_auth.FirebaseAuth firebaseAuth,
    required FirebaseFunctions functions,
    required CustomerRepository customerRepository,
  })  : _firebaseAuth = firebaseAuth,
        _functions = functions,
        _customerRepository = customerRepository;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFunctions _functions;
  final CustomerRepository _customerRepository;

  @override
  Stream<User?> get authStateChanges {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) return null;
      return await _mapFirebaseUserToUser(firebaseUser);
    });
  }

  @override
  User? get currentUser {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser == null) return null;
    return _mapFirebaseUserToUserSync(firebaseUser);
  }

  @override
  Future<AuthenticationResult> signInWithEmailAndPassword(
    SignInRequest request,
  ) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      if (credential.user == null) {
        return const AuthenticationResult(
          user: User(uid: '', email: ''),
          status: AuthenticationStatus.failure,
          message: 'ログインに失敗しました。',
        );
      }

      final user = await _mapFirebaseUserToUser(credential.user!);
      final customer =
          await _customerRepository.getCustomerByFirebaseUid(user.uid);
      final profile = customer != null
          ? await _customerRepository.getUserProfile(user.uid)
          : null;

      if (customer == null) {
        return AuthenticationResult(
          user: user,
          status: AuthenticationStatus.customerNotFound,
          message: '顧客データが見つかりません。管理者にお問い合わせください。',
        );
      }

      return AuthenticationResult(
        user: user,
        customer: customer,
        profile: profile,
        status: AuthenticationStatus.success,
        message: 'ログインが完了しました。',
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      return AuthenticationResult(
        user: const User(uid: '', email: ''),
        status: AuthenticationStatus.failure,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return const AuthenticationResult(
        user: User(uid: '', email: ''),
        status: AuthenticationStatus.failure,
        message: '予期しないエラーが発生しました。',
      );
    }
  }

  @override
  Future<AuthenticationResult> signUpWithEmailAndPassword(
    SignUpRequest request,
  ) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      if (credential.user == null) {
        return const AuthenticationResult(
          user: User(uid: '', email: ''),
          status: AuthenticationStatus.failure,
          message: 'アカウント作成に失敗しました。',
        );
      }

      // Display nameを設定
      await credential.user!.updateDisplayName(request.name);

      final user = await _mapFirebaseUserToUser(credential.user!);

      // 既存顧客データとの照合
      final potentialMatches =
          await _customerRepository.findCustomersByEmailAndPhone(
        email: request.email,
        phone: request.phone,
        name: request.name,
      );

      if (potentialMatches.isEmpty) {
        return AuthenticationResult(
          user: user,
          status: AuthenticationStatus.customerNotFound,
          message: '一致する顧客データが見つかりませんでした。管理者による承認が必要です。',
        );
      }

      if (potentialMatches.length == 1) {
        // 自動的に紐付け
        await _customerRepository.linkCustomerToFirebaseUser(
          customerId: potentialMatches.first.id,
          firebaseUid: user.uid,
        );

        // Custom Claims を設定
        await _setOwnerClaims(user.uid, potentialMatches.first.id);

        final profile = UserProfile(
          userId: user.uid,
          customerId: potentialMatches.first.id,
          displayName: request.name,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        await _customerRepository.createUserProfile(profile);

        return AuthenticationResult(
          user: user,
          customer: potentialMatches.first,
          profile: profile,
          status: AuthenticationStatus.success,
          message: 'アカウントが作成され、顧客データと紐付けられました。',
        );
      }

      return AuthenticationResult(
        user: user,
        status: AuthenticationStatus.multipleMatchesFound,
        potentialMatches: potentialMatches,
        message: '複数の一致する顧客データが見つかりました。正しいデータを選択してください。',
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      return AuthenticationResult(
        user: const User(uid: '', email: ''),
        status: AuthenticationStatus.failure,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return const AuthenticationResult(
        user: User(uid: '', email: ''),
        status: AuthenticationStatus.failure,
        message: '予期しないエラーが発生しました。',
      );
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = _firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  @override
  Future<User?> refreshUser() async {
    await _firebaseAuth.currentUser?.reload();
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser == null) return null;
    return await _mapFirebaseUserToUser(firebaseUser);
  }

  @override
  Future<void> updateProfile({
    String? displayName,
    String? photoURL,
  }) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.updateDisplayName(displayName);
      await user.updatePhotoURL(photoURL);
    }
  }

  @override
  Future<void> updateEmail(String newEmail) async {
    await _firebaseAuth.currentUser?.verifyBeforeUpdateEmail(newEmail);
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    await _firebaseAuth.currentUser?.updatePassword(newPassword);
  }

  @override
  Future<void> deleteAccount() async {
    await _firebaseAuth.currentUser?.delete();
  }

  @override
  Future<Map<String, dynamic>?> getCustomClaims() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;
    final idTokenResult = await user.getIdTokenResult();
    return idTokenResult.claims;
  }

  @override
  Future<void> refreshCustomClaims() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.getIdTokenResult(true);
    }
  }

  Future<void> _setOwnerClaims(String uid, String customerId) async {
    try {
      final callable = _functions.httpsCallable('setOwnerClaims');
      await callable.call({
        'uid': uid,
        'customerId': customerId,
        'role': 'owner',
      });
    } catch (e) {
      // ログを記録するが処理は続行
      // TODO: Replace with proper logging system (e.g., logger package)
      // Failed to set owner claims: $e
    }
  }

  Future<User> _mapFirebaseUserToUser(firebase_auth.User firebaseUser) async {
    final idTokenResult = await firebaseUser.getIdTokenResult();
    final claims = idTokenResult.claims ?? {};

    final role = claims['role'] != null
        ? UserRole.fromString(claims['role'].toString())
        : UserRole.owner;

    final permissionsList = claims['permissions'] as List<dynamic>? ?? [];
    final permissions = permissionsList
        .map((p) => Permission.fromString(p.toString()))
        .toList();

    return User(
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      displayName: firebaseUser.displayName,
      photoURL: firebaseUser.photoURL,
      role: role,
      permissions: permissions,
      emailVerified: firebaseUser.emailVerified,
      customerId: claims['customerId']?.toString(),
      customClaims: claims,
      createdAt: firebaseUser.metadata.creationTime,
      updatedAt: firebaseUser.metadata.lastSignInTime,
    );
  }

  User _mapFirebaseUserToUserSync(firebase_auth.User firebaseUser) {
    return User(
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      displayName: firebaseUser.displayName,
      photoURL: firebaseUser.photoURL,
      emailVerified: firebaseUser.emailVerified,
      createdAt: firebaseUser.metadata.creationTime,
      updatedAt: firebaseUser.metadata.lastSignInTime,
    );
  }

  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'ユーザーが見つかりません。';
      case 'wrong-password':
        return 'パスワードが正しくありません。';
      case 'user-disabled':
        return 'アカウントが無効になっています。';
      case 'too-many-requests':
        return 'リクエストが多すぎます。しばらく時間をおいてから再試行してください。';
      case 'email-already-in-use':
        return 'このメールアドレスは既に使用されています。';
      case 'weak-password':
        return 'パスワードが弱すぎます。';
      case 'invalid-email':
        return 'メールアドレスが無効です。';
      default:
        return '認証エラーが発生しました。';
    }
  }
}
