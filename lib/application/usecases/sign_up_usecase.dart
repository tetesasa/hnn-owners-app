import '../../domain/entities/authentication_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class SignUpUseCase {
  SignUpUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<AuthenticationResult> execute(SignUpRequest request) async {
    try {
      // 入力値バリデーション
      final validationError = _validateRequest(request);
      if (validationError != null) {
        return AuthenticationResult(
          user: const User(uid: '', email: ''),
          status: AuthenticationStatus.failure,
          message: validationError,
        );
      }

      // アカウント作成実行
      final result = await _authRepository.signUpWithEmailAndPassword(request);

      // 成功時にメール認証送信
      if (result.status == AuthenticationStatus.success) {
        try {
          await _authRepository.sendEmailVerification();
        } catch (e) {
          // メール送信失敗は致命的ではないので、警告メッセージに留める
          return result.copyWith(
            message: '${result.message ?? ''}\n認証メールの送信に失敗しました。後ほど再送信してください。',
          );
        }
      }

      return result;
    } catch (e) {
      return AuthenticationResult(
        user: const User(uid: '', email: ''),
        status: AuthenticationStatus.failure,
        message: 'アカウント作成に失敗しました: $e',
      );
    }
  }

  String? _validateRequest(SignUpRequest request) {
    if (request.email.isEmpty) {
      return 'メールアドレスを入力してください。';
    }

    if (!_isValidEmail(request.email)) {
      return '有効なメールアドレスを入力してください。';
    }

    if (request.password.isEmpty) {
      return 'パスワードを入力してください。';
    }

    if (request.password.length < 6) {
      return 'パスワードは6文字以上で入力してください。';
    }

    if (request.name.isEmpty) {
      return 'お名前を入力してください。';
    }

    if (request.name.length < 2) {
      return 'お名前は2文字以上で入力してください。';
    }

    if (request.phone.isEmpty) {
      return '電話番号を入力してください。';
    }

    if (!_isValidPhoneNumber(request.phone)) {
      return '有効な電話番号を入力してください。';
    }

    return null;
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _isValidPhoneNumber(String phone) {
    // 日本の電話番号形式をチェック
    final cleaned = phone.replaceAll(RegExp(r'[^\d]'), '');
    return RegExp(r'^0\d{9,10}$').hasMatch(cleaned);
  }
}
