import '../../domain/repositories/auth_repository.dart';

class SignOutUseCase {
  SignOutUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<void> execute() async {
    try {
      await _authRepository.signOut();
    } catch (e) {
      throw Exception('ログアウトに失敗しました: $e');
    }
  }
}
