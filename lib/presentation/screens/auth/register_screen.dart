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
import 'customer_selection_screen.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  bool _isLoading = false;
  bool _acceptTerms = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('新規アカウント作成'),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppDimensions.paddingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ヘッダー
                  Text(
                    'アカウント情報を入力してください',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppDimensions.paddingXL),

                  // 登録フォーム
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // お名前入力
                        AppTextField(
                          controller: _nameController,
                          labelText: 'お名前',
                          hintText: '山田太郎',
                          prefixIcon: const Icon(Icons.person_outline),
                          enabled: !_isLoading,
                          validator: _validateName,
                        ),

                        const SizedBox(height: AppDimensions.formFieldSpacing),

                        // メールアドレス入力
                        AppEmailField(
                          controller: _emailController,
                          enabled: !_isLoading,
                          validator: _validateEmail,
                        ),

                        const SizedBox(height: AppDimensions.formFieldSpacing),

                        // 電話番号入力
                        AppPhoneField(
                          controller: _phoneController,
                          enabled: !_isLoading,
                          validator: _validatePhone,
                        ),

                        const SizedBox(height: AppDimensions.formFieldSpacing),

                        // 住所入力（任意）
                        AppTextField(
                          controller: _addressController,
                          labelText: '住所（任意）',
                          hintText: '東京都渋谷区...',
                          prefixIcon: const Icon(Icons.location_on_outlined),
                          enabled: !_isLoading,
                          type: AppTextFieldType.multiline,
                          maxLines: 2,
                        ),

                        const SizedBox(height: AppDimensions.formFieldSpacing),

                        // パスワード入力
                        AppPasswordField(
                          controller: _passwordController,
                          labelText: 'パスワード',
                          hintText: '6文字以上',
                          enabled: !_isLoading,
                          validator: _validatePassword,
                        ),

                        const SizedBox(height: AppDimensions.formFieldSpacing),

                        // パスワード確認入力
                        AppPasswordField(
                          controller: _confirmPasswordController,
                          labelText: 'パスワード（確認）',
                          hintText: '同じパスワードを入力',
                          enabled: !_isLoading,
                          validator: _validateConfirmPassword,
                        ),

                        const SizedBox(height: AppDimensions.paddingL),

                        // 利用規約同意チェックボックス
                        Container(
                          padding: const EdgeInsets.all(AppDimensions.paddingM),
                          decoration: BoxDecoration(
                            color: AppColors.grey50,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.containerBorderRadius,
                            ),
                            border: Border.all(
                              color: _acceptTerms
                                  ? AppColors.primary
                                  : AppColors.outline,
                            ),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: _acceptTerms,
                                onChanged: _isLoading
                                    ? null
                                    : (value) {
                                        setState(() {
                                          _acceptTerms = value ?? false;
                                        });
                                      },
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: _isLoading
                                      ? null
                                      : () {
                                          setState(() {
                                            _acceptTerms = !_acceptTerms;
                                          });
                                        },
                                  child: RichText(
                                    text: TextSpan(
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color: AppColors.onSurface,
                                      ),
                                      children: [
                                        const TextSpan(text: ''),
                                        WidgetSpan(
                                          child: GestureDetector(
                                            onTap: () => _showTermsDialog(),
                                            child: Text(
                                              '利用規約',
                                              style: AppTextStyles.bodySmall
                                                  .copyWith(
                                                color: AppColors.primary,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const TextSpan(text: '及び'),
                                        WidgetSpan(
                                          child: GestureDetector(
                                            onTap: () => _showPrivacyDialog(),
                                            child: Text(
                                              'プライバシーポリシー',
                                              style: AppTextStyles.bodySmall
                                                  .copyWith(
                                                color: AppColors.primary,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const TextSpan(text: 'に同意する'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: AppDimensions.paddingXL),

                        // アカウント作成ボタン
                        AppPrimaryButton(
                          onPressed: (_isLoading || !_acceptTerms)
                              ? null
                              : _handleRegister,
                          loading: _isLoading,
                          size: AppButtonSize.large,
                          fullWidth: true,
                          child: const Text('アカウントを作成'),
                        ),

                        const SizedBox(height: AppDimensions.paddingL),

                        // 既存アカウントでのログインリンク
                        Center(
                          child: TextButton(
                            onPressed: _isLoading ? null : _navigateToLogin,
                            child: Text(
                              '既にアカウントをお持ちの方はこちら',
                              style: AppTextStyles.labelMedium.copyWith(
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ローディングオーバーレイ
          LoadingOverlay(
            isLoading: _isLoading,
            message: 'アカウントを作成中...',
          ),
        ],
      ),
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'お名前を入力してください';
    }
    if (value.trim().length < 2) {
      return 'お名前は2文字以上で入力してください';
    }
    return null;
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

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return '電話番号を入力してください';
    }
    final cleaned = value.replaceAll(RegExp(r'[^\d]'), '');
    if (!RegExp(r'^0\d{9,10}$').hasMatch(cleaned)) {
      return '有効な電話番号を入力してください';
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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワード（確認）を入力してください';
    }
    if (value != _passwordController.text) {
      return 'パスワードが一致しません';
    }
    return null;
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!_acceptTerms) {
      AppSnackBar.showError(
        context,
        message: '利用規約とプライバシーポリシーに同意してください',
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final authNotifier = ref.read(authNotifierProvider.notifier);
      final request = SignUpRequest(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        address: _addressController.text.trim().isNotEmpty
            ? _addressController.text.trim()
            : null,
      );

      final result = await authNotifier.signUp(request);

      if (!mounted) return;

      switch (result.status) {
        case AuthenticationStatus.success:
          // 成功 - メイン画面に遷移
          if (context.mounted) {
            Navigator.of(context).pushReplacementNamed('/home');
          }
          break;

        case AuthenticationStatus.multipleMatchesFound:
          // 複数の顧客データが見つかった場合 - 選択画面に遷移
          if (context.mounted) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CustomerSelectionScreen(
                  potentialMatches: result.potentialMatches ?? [],
                ),
              ),
            );
          }
          break;

        case AuthenticationStatus.customerNotFound:
          // 顧客データが見つからない場合
          await _showCustomerNotFoundDialog(result.message);
          break;

        default:
          // その他のエラー
          await ErrorDialog.show(
            context,
            title: 'アカウント作成エラー',
            message: result.message ?? 'アカウント作成に失敗しました',
          );
          break;
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

  Future<void> _showCustomerNotFoundDialog(String? message) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('顧客データ未発見'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message ?? 'ご入力いただいた情報に一致する顧客データが見つかりませんでした。',
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(height: AppDimensions.paddingM),
            Text(
              '管理者による承認が完了後、アプリをご利用いただけます。',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          AppPrimaryButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/home');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  void _showTermsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('利用規約'),
        content: const SingleChildScrollView(
          child: Text(
            '利用規約の詳細内容をここに記載します。\n\n'
            '実際のアプリケーションでは、詳細な利用規約を記載してください。',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('閉じる'),
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('プライバシーポリシー'),
        content: const SingleChildScrollView(
          child: Text(
            'プライバシーポリシーの詳細内容をここに記載します。\n\n'
            '実際のアプリケーションでは、詳細なプライバシーポリシーを記載してください。',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('閉じる'),
          ),
        ],
      ),
    );
  }
}
