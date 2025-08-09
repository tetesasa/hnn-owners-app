import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/authentication_result.dart';
import '../../../application/providers/auth_providers.dart';
import '../../widgets/common/app_scaffold.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_text_field.dart';
import '../../widgets/common/error_dialog.dart';
import '../../widgets/common/loading_overlay.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppDimensions.paddingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ヘッダー
                  const SizedBox(height: AppDimensions.paddingXL),

                  // アプリアイコン
                  Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryContainer,
                      ),
                      child: const Icon(
                        Icons.pets,
                        size: 40,
                        color: AppColors.primary,
                      ),
                    ),
                  ),

                  const SizedBox(height: AppDimensions.paddingL),

                  // タイトル
                  Text(
                    'ログイン',
                    style: AppTextStyles.displaySmall,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppDimensions.paddingS),

                  Text(
                    'アカウントにログインしてください',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppDimensions.paddingXL),

                  // ログインフォーム
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // メールアドレス入力
                        AppEmailField(
                          controller: _emailController,
                          enabled: !_isLoading,
                          validator: _validateEmail,
                        ),

                        const SizedBox(height: AppDimensions.formFieldSpacing),

                        // パスワード入力
                        AppPasswordField(
                          controller: _passwordController,
                          enabled: !_isLoading,
                          validator: _validatePassword,
                        ),

                        const SizedBox(height: AppDimensions.paddingM),

                        // パスワードを忘れた場合のリンク
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: _isLoading
                                ? null
                                : () => _showForgotPasswordDialog(),
                            child: Text(
                              'パスワードを忘れた場合',
                              style: AppTextStyles.labelMedium.copyWith(
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: AppDimensions.paddingL),

                        // ログインボタン
                        AppPrimaryButton(
                          onPressed: _isLoading ? null : _handleLogin,
                          loading: _isLoading,
                          size: AppButtonSize.large,
                          fullWidth: true,
                          child: const Text('ログイン'),
                        ),

                        const SizedBox(height: AppDimensions.paddingL),

                        // 区切り線
                        Row(
                          children: [
                            const Expanded(child: Divider()),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppDimensions.paddingM,
                              ),
                              child: Text(
                                'または',
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                            ),
                            const Expanded(child: Divider()),
                          ],
                        ),

                        const SizedBox(height: AppDimensions.paddingL),

                        // 新規アカウント作成ボタン
                        AppButton.outlined(
                          onPressed: _isLoading ? null : _navigateToRegister,
                          size: AppButtonSize.large,
                          fullWidth: true,
                          child: const Text('新規アカウント作成'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppDimensions.paddingXL),

                  // フッター
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        '← ウェルカム画面に戻る',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ローディングオーバーレイ
          LoadingOverlay(
            isLoading: _isLoading,
            message: 'ログイン中...',
          ),
        ],
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'メールアドレスを入力してください';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return '有効なメールアドレスを入力してください';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワードを入力してください';
    }
    if (value.length < 6) {
      return 'パスワードは6文字以上で入力してください';
    }
    return null;
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final authNotifier = ref.read(authNotifierProvider.notifier);
      final request = SignInRequest(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      final result = await authNotifier.signIn(request);

      if (!mounted) return;

      if (result.status == AuthenticationStatus.success) {
        // ログイン成功 - メイン画面に遷移
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      } else {
        // ログイン失敗 - エラーダイアログを表示
        await ErrorDialog.show(
          context,
          title: 'ログインエラー',
          message: result.message ?? 'ログインに失敗しました',
        );
      }
    } catch (e) {
      if (mounted) {
        await ErrorDialog.show(
          context,
          title: 'エラー',
          message: '予期しないエラーが発生しました: $e',
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _navigateToRegister() {
    Navigator.of(context).pushNamed('/register');
  }

  void _showForgotPasswordDialog() {
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('パスワードリセット'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'パスワードリセット用のメールを送信します。',
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(height: AppDimensions.paddingM),
            AppEmailField(
              controller: emailController,
              labelText: 'メールアドレス',
              hintText: '登録済みのメールアドレス',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('キャンセル'),
          ),
          AppPrimaryButton(
            onPressed: () async {
              if (emailController.text.trim().isNotEmpty) {
                try {
                  final authNotifier = ref.read(authNotifierProvider.notifier);
                  await authNotifier.sendPasswordResetEmail(
                    emailController.text.trim(),
                  );

                  if (context.mounted) {
                    Navigator.of(context).pop();
                    AppSnackBar.showSuccess(
                      context,
                      message: 'パスワードリセットメールを送信しました',
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    AppSnackBar.showError(
                      context,
                      message: 'メール送信に失敗しました: $e',
                    );
                  }
                }
              }
            },
            child: const Text('送信'),
          ),
        ],
      ),
    );
  }
}
