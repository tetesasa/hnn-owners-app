import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/customer.dart';
import '../../../domain/entities/authentication_result.dart';
import '../../../application/providers/auth_providers.dart';
import '../../widgets/common/app_scaffold.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/error_dialog.dart';
import '../../widgets/common/loading_overlay.dart';

class CustomerSelectionScreen extends ConsumerStatefulWidget {
  const CustomerSelectionScreen({
    super.key,
    required this.potentialMatches,
  });

  final List<Customer> potentialMatches;

  @override
  ConsumerState<CustomerSelectionScreen> createState() =>
      _CustomerSelectionScreenState();
}

class _CustomerSelectionScreenState
    extends ConsumerState<CustomerSelectionScreen> {
  String? _selectedCustomerId;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('顧客データ選択'),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 説明文
                  Container(
                    padding: const EdgeInsets.all(AppDimensions.paddingM),
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.containerBorderRadius,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.info_outline,
                              color: AppColors.primary,
                              size: AppDimensions.iconSizeS,
                            ),
                            const SizedBox(width: AppDimensions.paddingS),
                            Text(
                              '複数の顧客データが見つかりました',
                              style: AppTextStyles.titleMedium.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppDimensions.paddingS),
                        Text(
                          'ご自身に該当する顧客データを選択してください。',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppDimensions.paddingL),

                  // 顧客リスト
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.potentialMatches.length,
                      itemBuilder: (context, index) {
                        final customer = widget.potentialMatches[index];
                        return _buildCustomerCard(customer);
                      },
                    ),
                  ),

                  const SizedBox(height: AppDimensions.paddingL),

                  // アクションボタン
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppPrimaryButton(
                        onPressed: (_selectedCustomerId == null || _isLoading)
                            ? null
                            : _handleConfirmSelection,
                        loading: _isLoading,
                        size: AppButtonSize.large,
                        fullWidth: true,
                        child: const Text('選択した顧客データで続行'),
                      ),
                      const SizedBox(height: AppDimensions.paddingM),
                      AppButton.text(
                        onPressed: _isLoading ? null : _handleNoMatch,
                        size: AppButtonSize.large,
                        fullWidth: true,
                        child: const Text('該当する顧客データがない'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ローディングオーバーレイ
          LoadingOverlay(
            isLoading: _isLoading,
            message: '顧客データを紐付け中...',
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerCard(Customer customer) {
    final isSelected = _selectedCustomerId == customer.id;

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.paddingM),
      elevation: isSelected ? 4 : 1,
      child: InkWell(
        onTap: _isLoading
            ? null
            : () {
                setState(() {
                  _selectedCustomerId = customer.id;
                });
              },
        borderRadius: BorderRadius.circular(AppDimensions.cardBorderRadius),
        child: Container(
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(AppDimensions.cardBorderRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 選択インジケーター
              Row(
                children: [
                  Icon(
                    isSelected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppDimensions.paddingS),
                  Expanded(
                    child: Text(
                      customer.name,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: isSelected ? AppColors.primary : null,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppDimensions.paddingS),

              // 顧客情報
              _buildInfoRow(
                Icons.email_outlined,
                'メール',
                customer.email,
              ),

              const SizedBox(height: AppDimensions.paddingXS),

              _buildInfoRow(
                Icons.phone_outlined,
                '電話番号',
                customer.phone,
              ),

              if (customer.address.isNotEmpty) ...[
                const SizedBox(height: AppDimensions.paddingXS),
                _buildInfoRow(
                  Icons.location_on_outlined,
                  '住所',
                  customer.address,
                ),
              ],

              if (customer.createdAt != null) ...[
                const SizedBox(height: AppDimensions.paddingXS),
                _buildInfoRow(
                  Icons.date_range_outlined,
                  '登録日',
                  _formatDate(customer.createdAt!),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: AppDimensions.iconSizeS,
          color: AppColors.onSurfaceVariant,
        ),
        const SizedBox(width: AppDimensions.paddingS),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              Text(
                value,
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _handleConfirmSelection() async {
    if (_selectedCustomerId == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final authNotifier = ref.read(authNotifierProvider.notifier);
      final result = await authNotifier.linkExistingCustomer(
        customerId: _selectedCustomerId!,
        additionalInfo: '新規登録時に選択された顧客データ',
      );

      if (!mounted) return;

      if (result.status == AuthenticationStatus.success) {
        // 成功 - メイン画面に遷移
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/home',
            (route) => false,
          );
        }
      } else {
        // エラー
        await ErrorDialog.show(
          context,
          title: '紐付けエラー',
          message: result.message ?? '顧客データの紐付けに失敗しました',
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

  Future<void> _handleNoMatch() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('管理者承認待ち'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '該当する顧客データがない場合、管理者による承認が必要です。',
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(height: AppDimensions.paddingM),
            Text(
              '承認が完了するまで、一部機能が制限される場合があります。',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('キャンセル'),
          ),
          AppPrimaryButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/home',
                (route) => false,
              );
            },
            child: const Text('続行'),
          ),
        ],
      ),
    );
  }
}
