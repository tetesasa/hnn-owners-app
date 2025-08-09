import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_dimensions.dart';

class AppTheme {
  AppTheme._();

  // ライトテーマ
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: AppColors.lightColorScheme,
        textTheme: AppTextStyles.textTheme,
        fontFamily: AppTextStyles.primaryFont,

        // AppBar テーマ
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: AppDimensions.appBarElevation,
          centerTitle: true,
          titleTextStyle: AppTextStyles.appBarTitle,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
        ),

        // カードテーマ
        cardTheme: CardThemeData(
          elevation: AppDimensions.cardElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.cardBorderRadius),
          ),
          margin: const EdgeInsets.all(AppDimensions.cardMargin),
          color: AppColors.cardBackground,
        ),

        // ボタンテーマ
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            minimumSize: const Size(
              AppDimensions.buttonMinWidth,
              AppDimensions.buttonHeight,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.buttonPaddingHorizontal,
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppDimensions.containerBorderRadius),
            ),
            textStyle: AppTextStyles.button,
            elevation: 2,
          ),
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            minimumSize: const Size(
              AppDimensions.buttonMinWidth,
              AppDimensions.buttonHeight,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.buttonPaddingHorizontal,
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppDimensions.containerBorderRadius),
            ),
            textStyle: AppTextStyles.button,
          ),
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            minimumSize: const Size(
              AppDimensions.buttonMinWidth,
              AppDimensions.buttonHeight,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.buttonPaddingHorizontal,
            ),
            side: const BorderSide(color: AppColors.primary),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppDimensions.containerBorderRadius),
            ),
            textStyle: AppTextStyles.button,
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            minimumSize: const Size(
              AppDimensions.buttonMinWidth,
              AppDimensions.buttonHeight,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.buttonPaddingHorizontal,
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppDimensions.containerBorderRadius),
            ),
            textStyle: AppTextStyles.button,
          ),
        ),

        // インプットデコレーションテーマ
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.grey50,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(AppDimensions.inputBorderRadius),
            borderSide: const BorderSide(color: AppColors.outline),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(AppDimensions.inputBorderRadius),
            borderSide: const BorderSide(color: AppColors.outline),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(AppDimensions.inputBorderRadius),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(AppDimensions.inputBorderRadius),
            borderSide: const BorderSide(color: AppColors.error),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(AppDimensions.inputBorderRadius),
            borderSide: const BorderSide(color: AppColors.error, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.inputPaddingHorizontal,
            vertical: AppDimensions.inputPaddingVertical,
          ),
          labelStyle: AppTextStyles.inputLabel,
          hintStyle: AppTextStyles.inputHint,
          helperStyle: AppTextStyles.helperText,
          errorStyle: AppTextStyles.errorText,
        ),

        // リストタイルテーマ
        listTileTheme: ListTileThemeData(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.listItemPadding,
          ),
          minVerticalPadding: AppDimensions.listItemSpacing,
          titleTextStyle: AppTextStyles.listTileTitle,
          subtitleTextStyle: AppTextStyles.listTileSubtitle,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppDimensions.containerBorderRadius),
          ),
        ),

        // チップテーマ
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.grey100,
          selectedColor: AppColors.primaryContainer,
          labelStyle: AppTextStyles.chipLabel,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.chipPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.chipBorderRadius),
          ),
        ),

        // ダイアログテーマ
        dialogTheme: DialogThemeData(
          backgroundColor: AppColors.surface,
          elevation: AppDimensions.elevationLevel3,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppDimensions.dialogBorderRadius),
          ),
          titleTextStyle: AppTextStyles.dialogTitle,
          contentTextStyle: AppTextStyles.dialogContent,
        ),

        // スナックバーテーマ
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.grey800,
          contentTextStyle:
              AppTextStyles.bodyMedium.copyWith(color: Colors.white),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppDimensions.snackBarBorderRadius),
          ),
          actionTextColor: AppColors.accent,
        ),

        // タブバーテーマ
        tabBarTheme: TabBarThemeData(
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.onSurfaceVariant,
          labelStyle:
              AppTextStyles.tabLabel.copyWith(fontWeight: FontWeight.w600),
          unselectedLabelStyle: AppTextStyles.tabLabel,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: AppColors.primary,
              width: AppDimensions.tabIndicatorWeight,
            ),
          ),
        ),

        // ボトムナビゲーションバーテーマ
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.surface,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.onSurfaceVariant,
          selectedLabelStyle: AppTextStyles.navigationLabel,
          unselectedLabelStyle: AppTextStyles.navigationLabel,
          elevation: AppDimensions.bottomNavElevation,
          type: BottomNavigationBarType.fixed,
        ),

        // フローティングアクションボタンテーマ
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 6,
          highlightElevation: 12,
        ),

        // ドロワーテーマ
        drawerTheme: const DrawerThemeData(
          backgroundColor: AppColors.surface,
          elevation: AppDimensions.elevationLevel4,
          width: AppDimensions.drawerWidth,
        ),

        // プログレスインジケーターテーマ
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primary,
          linearTrackColor: AppColors.grey200,
          circularTrackColor: AppColors.grey200,
        ),

        // スライダーテーマ
        sliderTheme: SliderThemeData(
          activeTrackColor: AppColors.primary,
          inactiveTrackColor: AppColors.grey300,
          thumbColor: AppColors.primary,
          overlayColor: AppColors.primary.withValues(alpha: 0.12),
          valueIndicatorColor: AppColors.primary,
          valueIndicatorTextStyle: AppTextStyles.labelSmall.copyWith(
            color: Colors.white,
          ),
        ),

        // スイッチテーマ
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return AppColors.grey400;
          }),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryContainer;
            }
            return AppColors.grey200;
          }),
        ),

        // チェックボックステーマ
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return Colors.transparent;
          }),
          checkColor: WidgetStateProperty.all(Colors.white),
        ),

        // ラジオテーマ
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return AppColors.onSurfaceVariant;
          }),
        ),

        // デバイダーテーマ
        dividerTheme: const DividerThemeData(
          color: AppColors.outline,
          thickness: AppDimensions.dividerThickness,
          space: AppDimensions.dividerHeight,
        ),
      );

  // ダークテーマ
  static ThemeData get darkTheme => lightTheme.copyWith(
        brightness: Brightness.dark,
        colorScheme: AppColors.darkColorScheme,
        appBarTheme: lightTheme.appBarTheme.copyWith(
          backgroundColor: AppColors.darkColorScheme.surface,
          foregroundColor: AppColors.darkColorScheme.onSurface,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        cardTheme: lightTheme.cardTheme.copyWith(
          color: AppColors.darkColorScheme.surface,
        ),
        inputDecorationTheme: lightTheme.inputDecorationTheme.copyWith(
          fillColor: AppColors.darkColorScheme.surfaceContainerHighest,
          labelStyle: AppTextStyles.inputLabel.copyWith(
            color: AppColors.darkColorScheme.primary,
          ),
          hintStyle: AppTextStyles.inputHint.copyWith(
            color: AppColors.darkColorScheme.onSurfaceVariant,
          ),
        ),
        snackBarTheme: lightTheme.snackBarTheme.copyWith(
          backgroundColor: AppColors.darkColorScheme.inverseSurface,
          contentTextStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.darkColorScheme.onInverseSurface,
          ),
        ),
      );
}
