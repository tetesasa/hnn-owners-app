import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';

enum AppButtonSize { small, medium, large }

enum AppButtonType { filled, outlined, text }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.type = AppButtonType.filled,
    this.size = AppButtonSize.medium,
    this.fullWidth = false,
    this.loading = false,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.elevation,
    this.borderRadius,
  });

  const AppButton.filled({
    super.key,
    required this.onPressed,
    required this.child,
    this.size = AppButtonSize.medium,
    this.fullWidth = false,
    this.loading = false,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.borderRadius,
  })  : type = AppButtonType.filled,
        borderColor = null;

  const AppButton.outlined({
    super.key,
    required this.onPressed,
    required this.child,
    this.size = AppButtonSize.medium,
    this.fullWidth = false,
    this.loading = false,
    this.foregroundColor,
    this.borderColor,
    this.borderRadius,
  })  : type = AppButtonType.outlined,
        backgroundColor = null,
        elevation = null;

  const AppButton.text({
    super.key,
    required this.onPressed,
    required this.child,
    this.size = AppButtonSize.medium,
    this.fullWidth = false,
    this.loading = false,
    this.foregroundColor,
    this.borderRadius,
  })  : type = AppButtonType.text,
        backgroundColor = null,
        borderColor = null,
        elevation = null;

  final VoidCallback? onPressed;
  final Widget child;
  final AppButtonType type;
  final AppButtonSize size;
  final bool fullWidth;
  final bool loading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? elevation;
  final BorderRadius? borderRadius;

  double get _height {
    switch (size) {
      case AppButtonSize.small:
        return AppDimensions.buttonHeightS;
      case AppButtonSize.medium:
        return AppDimensions.buttonHeight;
      case AppButtonSize.large:
        return AppDimensions.buttonHeightL;
    }
  }

  double get _fontSize {
    switch (size) {
      case AppButtonSize.small:
        return 12;
      case AppButtonSize.medium:
        return 14;
      case AppButtonSize.large:
        return 16;
    }
  }

  double get _padding {
    switch (size) {
      case AppButtonSize.small:
        return AppDimensions.paddingS;
      case AppButtonSize.medium:
        return AppDimensions.buttonPaddingHorizontal;
      case AppButtonSize.large:
        return AppDimensions.paddingL;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || loading;

    Widget buttonChild = child;

    if (loading) {
      buttonChild = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                _getLoadingColor(context),
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.paddingS),
          child,
        ],
      );
    }

    final buttonStyle = _getButtonStyle(context, isDisabled);

    switch (type) {
      case AppButtonType.filled:
        return SizedBox(
          width: fullWidth ? double.infinity : null,
          child: ElevatedButton(
            onPressed: isDisabled ? null : onPressed,
            style: buttonStyle,
            child: buttonChild,
          ),
        );
      case AppButtonType.outlined:
        return SizedBox(
          width: fullWidth ? double.infinity : null,
          child: OutlinedButton(
            onPressed: isDisabled ? null : onPressed,
            style: buttonStyle,
            child: buttonChild,
          ),
        );
      case AppButtonType.text:
        return SizedBox(
          width: fullWidth ? double.infinity : null,
          child: TextButton(
            onPressed: isDisabled ? null : onPressed,
            style: buttonStyle,
            child: buttonChild,
          ),
        );
    }
  }

  ButtonStyle _getButtonStyle(BuildContext context, bool isDisabled) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ButtonStyle(
      minimumSize: WidgetStateProperty.all(
        Size(
          fullWidth ? double.infinity : AppDimensions.buttonMinWidth,
          _height,
        ),
      ),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(horizontal: _padding),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: borderRadius ??
              BorderRadius.circular(AppDimensions.containerBorderRadius),
        ),
      ),
      textStyle: WidgetStateProperty.all(
        AppTextStyles.button.copyWith(fontSize: _fontSize),
      ),
      backgroundColor: _getBackgroundColor(colorScheme, isDisabled),
      foregroundColor: _getForegroundColor(colorScheme, isDisabled),
      side: _getBorderSide(colorScheme, isDisabled),
      elevation: _getElevation(isDisabled),
    );
  }

  WidgetStateProperty<Color?>? _getBackgroundColor(
    ColorScheme colorScheme,
    bool isDisabled,
  ) {
    if (type == AppButtonType.text || type == AppButtonType.outlined) {
      return WidgetStateProperty.all(Colors.transparent);
    }

    return WidgetStateProperty.resolveWith((states) {
      if (isDisabled) {
        return colorScheme.onSurface.withValues(alpha: 0.12);
      }
      if (states.contains(WidgetState.hovered)) {
        return (backgroundColor ?? AppColors.primary).withValues(alpha: 0.8);
      }
      if (states.contains(WidgetState.pressed)) {
        return (backgroundColor ?? AppColors.primary).withValues(alpha: 0.9);
      }
      return backgroundColor ?? AppColors.primary;
    });
  }

  WidgetStateProperty<Color?>? _getForegroundColor(
    ColorScheme colorScheme,
    bool isDisabled,
  ) {
    return WidgetStateProperty.resolveWith((states) {
      if (isDisabled) {
        return colorScheme.onSurface.withValues(alpha: 0.38);
      }

      switch (type) {
        case AppButtonType.filled:
          return foregroundColor ?? Colors.white;
        case AppButtonType.outlined:
        case AppButtonType.text:
          return foregroundColor ?? AppColors.primary;
      }
    });
  }

  WidgetStateProperty<BorderSide?>? _getBorderSide(
    ColorScheme colorScheme,
    bool isDisabled,
  ) {
    if (type != AppButtonType.outlined) return null;

    return WidgetStateProperty.resolveWith((states) {
      if (isDisabled) {
        return BorderSide(
          color: colorScheme.onSurface.withValues(alpha: 0.12),
        );
      }
      return BorderSide(
        color: borderColor ?? AppColors.primary,
      );
    });
  }

  WidgetStateProperty<double?>? _getElevation(bool isDisabled) {
    if (type != AppButtonType.filled || elevation == null) return null;

    return WidgetStateProperty.resolveWith((states) {
      if (isDisabled) return 0;
      if (states.contains(WidgetState.hovered)) return elevation! + 2;
      if (states.contains(WidgetState.pressed)) return elevation! - 1;
      return elevation;
    });
  }

  Color _getLoadingColor(BuildContext context) {
    switch (type) {
      case AppButtonType.filled:
        return foregroundColor ?? Colors.white;
      case AppButtonType.outlined:
      case AppButtonType.text:
        return foregroundColor ?? AppColors.primary;
    }
  }
}

// 専用ボタンコンポーネント
class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.size = AppButtonSize.medium,
    this.fullWidth = false,
    this.loading = false,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final AppButtonSize size;
  final bool fullWidth;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return AppButton.filled(
      onPressed: onPressed,
      size: size,
      fullWidth: fullWidth,
      loading: loading,
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      child: child,
    );
  }
}

class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.size = AppButtonSize.medium,
    this.fullWidth = false,
    this.loading = false,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final AppButtonSize size;
  final bool fullWidth;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return AppButton.outlined(
      onPressed: onPressed,
      size: size,
      fullWidth: fullWidth,
      loading: loading,
      foregroundColor: AppColors.primary,
      borderColor: AppColors.primary,
      child: child,
    );
  }
}

class AppDangerButton extends StatelessWidget {
  const AppDangerButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.size = AppButtonSize.medium,
    this.fullWidth = false,
    this.loading = false,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final AppButtonSize size;
  final bool fullWidth;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return AppButton.filled(
      onPressed: onPressed,
      size: size,
      fullWidth: fullWidth,
      loading: loading,
      backgroundColor: AppColors.error,
      foregroundColor: Colors.white,
      child: child,
    );
  }
}
