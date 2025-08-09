import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';

enum AppTextFieldType { email, password, phone, text, multiline }

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.type = AppTextFieldType.text,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.onTap,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.borderRadius,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final AppTextFieldType type;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final BorderRadius? borderRadius;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.type == AppTextFieldType.password;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      obscureText: _obscureText,
      maxLines: _getMaxLines(),
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      keyboardType: _getKeyboardType(),
      textInputAction: _getTextInputAction(),
      inputFormatters: _getInputFormatters(),
      style: AppTextStyles.inputText.copyWith(
        color: widget.enabled
            ? null
            : colorScheme.onSurface.withValues(alpha: 0.6),
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        helperText: widget.helperText,
        errorText: widget.errorText,
        prefixIcon: _getPrefixIcon(),
        suffixIcon: _getSuffixIcon(),
        filled: true,
        fillColor: widget.fillColor ??
            (widget.enabled ? AppColors.grey50 : AppColors.grey100),
        border: _getBorder(),
        enabledBorder: _getBorder(),
        focusedBorder: _getFocusedBorder(),
        errorBorder: _getErrorBorder(),
        focusedErrorBorder: _getFocusedErrorBorder(),
        disabledBorder: _getDisabledBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.inputPaddingHorizontal,
          vertical: AppDimensions.inputPaddingVertical,
        ),
        labelStyle: AppTextStyles.inputLabel,
        hintStyle: AppTextStyles.inputHint,
        helperStyle: AppTextStyles.helperText,
        errorStyle: AppTextStyles.errorText,
      ),
    );
  }

  int? _getMaxLines() {
    if (widget.maxLines != null) return widget.maxLines;

    switch (widget.type) {
      case AppTextFieldType.multiline:
        return null;
      case AppTextFieldType.password:
        return 1;
      default:
        return 1;
    }
  }

  TextInputType _getKeyboardType() {
    if (widget.keyboardType != null) return widget.keyboardType!;

    switch (widget.type) {
      case AppTextFieldType.email:
        return TextInputType.emailAddress;
      case AppTextFieldType.phone:
        return TextInputType.phone;
      case AppTextFieldType.multiline:
        return TextInputType.multiline;
      default:
        return TextInputType.text;
    }
  }

  TextInputAction _getTextInputAction() {
    if (widget.textInputAction != null) return widget.textInputAction!;

    switch (widget.type) {
      case AppTextFieldType.multiline:
        return TextInputAction.newline;
      case AppTextFieldType.password:
        return TextInputAction.done;
      default:
        return TextInputAction.next;
    }
  }

  List<TextInputFormatter>? _getInputFormatters() {
    if (widget.inputFormatters != null) return widget.inputFormatters;

    switch (widget.type) {
      case AppTextFieldType.phone:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9\-\(\)\+\s]')),
          LengthLimitingTextInputFormatter(20),
        ];
      case AppTextFieldType.email:
        return [
          FilteringTextInputFormatter.deny(RegExp(r'\s')),
          LengthLimitingTextInputFormatter(254),
        ];
      default:
        return null;
    }
  }

  Widget? _getPrefixIcon() {
    if (widget.prefixIcon != null) return widget.prefixIcon;

    switch (widget.type) {
      case AppTextFieldType.email:
        return const Icon(Icons.email_outlined);
      case AppTextFieldType.password:
        return const Icon(Icons.lock_outline);
      case AppTextFieldType.phone:
        return const Icon(Icons.phone_outlined);
      default:
        return null;
    }
  }

  Widget? _getSuffixIcon() {
    if (widget.suffixIcon != null) return widget.suffixIcon;

    if (widget.type == AppTextFieldType.password) {
      return IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }

    return null;
  }

  OutlineInputBorder _getBorder() {
    return OutlineInputBorder(
      borderRadius: widget.borderRadius ??
          BorderRadius.circular(AppDimensions.inputBorderRadius),
      borderSide: BorderSide(
        color: widget.borderColor ?? AppColors.outline,
      ),
    );
  }

  OutlineInputBorder _getFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: widget.borderRadius ??
          BorderRadius.circular(AppDimensions.inputBorderRadius),
      borderSide: BorderSide(
        color: widget.focusedBorderColor ?? AppColors.primary,
        width: 2,
      ),
    );
  }

  OutlineInputBorder _getErrorBorder() {
    return OutlineInputBorder(
      borderRadius: widget.borderRadius ??
          BorderRadius.circular(AppDimensions.inputBorderRadius),
      borderSide: const BorderSide(
        color: AppColors.error,
      ),
    );
  }

  OutlineInputBorder _getFocusedErrorBorder() {
    return OutlineInputBorder(
      borderRadius: widget.borderRadius ??
          BorderRadius.circular(AppDimensions.inputBorderRadius),
      borderSide: const BorderSide(
        color: AppColors.error,
        width: 2,
      ),
    );
  }

  OutlineInputBorder _getDisabledBorder() {
    return OutlineInputBorder(
      borderRadius: widget.borderRadius ??
          BorderRadius.circular(AppDimensions.inputBorderRadius),
      borderSide: BorderSide(
        color: AppColors.outline.withValues(alpha: 0.5),
      ),
    );
  }
}

// 特化したテキストフィールドコンポーネント
class AppEmailField extends StatelessWidget {
  const AppEmailField({
    super.key,
    this.controller,
    this.labelText = 'メールアドレス',
    this.hintText = 'example@email.com',
    this.onChanged,
    this.validator,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      type: AppTextFieldType.email,
      onChanged: onChanged,
      validator: validator ?? _defaultEmailValidator,
      enabled: enabled,
      textInputAction: TextInputAction.next,
    );
  }

  String? _defaultEmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'メールアドレスを入力してください';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return '有効なメールアドレスを入力してください';
    }
    return null;
  }
}

class AppPasswordField extends StatelessWidget {
  const AppPasswordField({
    super.key,
    this.controller,
    this.labelText = 'パスワード',
    this.hintText = 'パスワードを入力',
    this.onChanged,
    this.validator,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      type: AppTextFieldType.password,
      onChanged: onChanged,
      validator: validator ?? _defaultPasswordValidator,
      enabled: enabled,
      textInputAction: TextInputAction.done,
    );
  }

  String? _defaultPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワードを入力してください';
    }
    if (value.length < 6) {
      return 'パスワードは6文字以上で入力してください';
    }
    return null;
  }
}

class AppPhoneField extends StatelessWidget {
  const AppPhoneField({
    super.key,
    this.controller,
    this.labelText = '電話番号',
    this.hintText = '090-1234-5678',
    this.onChanged,
    this.validator,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      type: AppTextFieldType.phone,
      onChanged: onChanged,
      validator: validator ?? _defaultPhoneValidator,
      enabled: enabled,
      textInputAction: TextInputAction.next,
    );
  }

  String? _defaultPhoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '電話番号を入力してください';
    }
    final cleaned = value.replaceAll(RegExp(r'[^\d]'), '');
    if (!RegExp(r'^0\d{9,10}$').hasMatch(cleaned)) {
      return '有効な電話番号を入力してください';
    }
    return null;
  }
}
