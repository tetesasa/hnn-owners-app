import '../../domain/entities/authentication_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class SignInUseCase {
  SignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<AuthenticationResult> execute(SignInRequest request) async {
    try {
      // 入力値バリデーション
      if (request.email.isEmpty) {
        return const AuthenticationResult(
          user: User(uid: '', email: ''),
          status: AuthenticationStatus.failure,
          message: 'メールアドレスを入力してください。',
        );
      }

      if (request.password.isEmpty) {
        return const AuthenticationResult(
          user: User(uid: '', email: ''),
          status: AuthenticationStatus.failure,
          message: 'パスワードを入力してください。',
        );
      }

      if (!_isValidEmail(request.email)) {
        return const AuthenticationResult(
          user: User(uid: '', email: ''),
          status: AuthenticationStatus.failure,
          message: '有効なメールアドレスを入力してください。',
        );
      }

      // ログイン実行
      final result = await _authRepository.signInWithEmailAndPassword(request);

      // メール認証チェック（必要に応じて）
      if (result.status == AuthenticationStatus.success &&
          result.user.emailVerified == false) {
        return result.copyWith(
          status: AuthenticationStatus.emailNotVerified,
          message: 'メールアドレスの認証が完了していません。認証メールをご確認ください。',
        );
      }

      return result;
    } catch (e) {
      return AuthenticationResult(
        user: const User(uid: '', email: ''),
        status: AuthenticationStatus.failure,
        message: 'ログインに失敗しました: $e',
      );
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
