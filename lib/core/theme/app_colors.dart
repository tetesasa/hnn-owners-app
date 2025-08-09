import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // プライマリカラー - 温かみのある茶色ベース
  static const Color primary = Color(0xFF8B4513);
  static const Color primaryLight = Color(0xFFB8621E);
  static const Color primaryDark = Color(0xFF5D2E0A);
  static const Color primaryContainer = Color(0xFFF4E6D7);
  static const Color onPrimaryContainer = Color(0xFF2B1000);

  // セカンダリカラー - 安心の緑
  static const Color secondary = Color(0xFF4CAF50);
  static const Color secondaryLight = Color(0xFF7AC142);
  static const Color secondaryDark = Color(0xFF2E7D32);
  static const Color secondaryContainer = Color(0xFFE8F5E8);
  static const Color onSecondaryContainer = Color(0xFF0D1F0F);

  // アクセントカラー - アクション用オレンジ
  static const Color accent = Color(0xFFFF6B35);
  static const Color accentLight = Color(0xFFFF8A65);
  static const Color accentDark = Color(0xFFE64A19);

  // エラー・ワーニング・成功カラー
  static const Color error = Color(0xFFD32F2F);
  static const Color errorLight = Color(0xFFEF5350);
  static const Color errorDark = Color(0xFFC62828);
  static const Color errorContainer = Color(0xFFFCE4E4);
  static const Color onErrorContainer = Color(0xFF2E0A0A);

  static const Color warning = Color(0xFFF57C00);
  static const Color warningLight = Color(0xFFFFB74D);
  static const Color warningDark = Color(0xFFE65100);
  static const Color warningContainer = Color(0xFFFFF3E0);
  static const Color onWarningContainer = Color(0xFF1F1300);

  static const Color success = Color(0xFF388E3C);
  static const Color successLight = Color(0xFF66BB6A);
  static const Color successDark = Color(0xFF2E7D32);
  static const Color successContainer = Color(0xFFE8F5E8);
  static const Color onSuccessContainer = Color(0xFF0D1F0F);

  // ニュートラルカラー
  static const Color background = Color(0xFFFFFBFE);
  static const Color surface = Color(0xFFFFFBFE);
  static const Color surfaceVariant = Color(0xFFF7F2FA);
  static const Color onBackground = Color(0xFF1C1B1F);
  static const Color onSurface = Color(0xFF1C1B1F);
  static const Color onSurfaceVariant = Color(0xFF49454E);

  // グレースケール
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // アウトライン・境界線
  static const Color outline = Color(0xFF79747E);
  static const Color outlineVariant = Color(0xFFCAC4D0);

  // シャドウ・エレベーション
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);

  // カード・コンテナ用カラー
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardShadow = Color(0x1A000000);

  // ペット関連テーマカラー
  static const Color catPrimary = Color(0xFF8B4513);
  static const Color dogPrimary = Color(0xFF4CAF50);
  static const Color petCareAccent = Color(0xFFFF6B35);

  // ステータスカラー
  static const Color statusActive = Color(0xFF4CAF50);
  static const Color statusInactive = Color(0xFF9E9E9E);
  static const Color statusPending = Color(0xFFF57C00);
  static const Color statusCompleted = Color(0xFF2196F3);
  static const Color statusCancelled = Color(0xFFD32F2F);

  // Material 3 ダイナミックカラー対応
  static ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.onPrimaryContainer,
    secondary: AppColors.secondary,
    onSecondary: Colors.white,
    secondaryContainer: AppColors.secondaryContainer,
    onSecondaryContainer: AppColors.onSecondaryContainer,
    tertiary: AppColors.accent,
    onTertiary: Colors.white,
    tertiaryContainer: Color(0xFFFFE0CC),
    onTertiaryContainer: Color(0xFF2B1000),
    error: AppColors.error,
    onError: Colors.white,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: AppColors.onErrorContainer,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    surfaceContainerHighest: AppColors.surfaceVariant,
    onSurfaceVariant: AppColors.onSurfaceVariant,
    outline: AppColors.outline,
    outlineVariant: AppColors.outlineVariant,
    shadow: AppColors.shadow,
    scrim: AppColors.scrim,
    inverseSurface: AppColors.grey800,
    onInverseSurface: AppColors.grey100,
    inversePrimary: AppColors.primaryLight,
  );

  static ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFD2B48C),
    onPrimary: Color(0xFF2B1000),
    primaryContainer: Color(0xFF5D2E0A),
    onPrimaryContainer: Color(0xFFF4E6D7),
    secondary: Color(0xFF81C784),
    onSecondary: Color(0xFF0D1F0F),
    secondaryContainer: Color(0xFF2E7D32),
    onSecondaryContainer: Color(0xFFE8F5E8),
    tertiary: Color(0xFFFFAB91),
    onTertiary: Color(0xFF2B1000),
    tertiaryContainer: Color(0xFFE64A19),
    onTertiaryContainer: Color(0xFFFFE0CC),
    error: Color(0xFFEF5350),
    onError: Color(0xFF2E0A0A),
    errorContainer: Color(0xFFC62828),
    onErrorContainer: Color(0xFFFCE4E4),
    surface: Color(0xFF121212),
    onSurface: Color(0xFFE1E1E1),
    surfaceContainerHighest: Color(0xFF2C2C2C),
    onSurfaceVariant: Color(0xFFCACACA),
    outline: Color(0xFF938F99),
    outlineVariant: Color(0xFF49454E),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFE1E1E1),
    onInverseSurface: Color(0xFF2C2C2C),
    inversePrimary: Color(0xFF8B4513),
  );
}
