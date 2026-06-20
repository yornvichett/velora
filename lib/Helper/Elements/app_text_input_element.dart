import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum AppInputVariant { filled, outlined, underlined }

enum AppInputSize { small, medium, large }

class AppTextInputElement extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final String? initialValue;
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final VoidCallback? onSuffixTap;
  final String? prefixText;
  final String? suffixText;
  final bool isPassword;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final bool showCounter;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final AutovalidateMode autovalidateMode;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final AppInputVariant variant;
  final AppInputSize size;
  final Color? activeColor;
  final Color? fillColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? iconColor;
  final double? borderRadius;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? helperStyle;
  final EdgeInsetsGeometry? contentPadding;

  const AppTextInputElement({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.initialValue,
    this.prefixIcon,
    this.prefixWidget,
    this.suffixIcon,
    this.suffixWidget,
    this.onSuffixTap,
    this.prefixText,
    this.suffixText,
    this.isPassword = false,
    this.readOnly = false,
    this.enabled = true,
    this.autofocus = false,
    this.showCounter = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.variant = AppInputVariant.filled,
    this.size = AppInputSize.medium,
    this.activeColor,
    this.fillColor,
    this.textColor,
    this.hintColor,
    this.iconColor,
    this.borderRadius,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.helperStyle,
    this.contentPadding,
  });

  @override
  State<AppTextInputElement> createState() => _AppTextInputElementState();
}

class _AppTextInputElementState extends State<AppTextInputElement> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (mounted) setState(() => _isFocused = _focusNode.hasFocus);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.removeListener(_onFocusChanged);
      _focusNode.dispose();
    }
    super.dispose();
  }

  double get _fontSize => switch (widget.size) {
    AppInputSize.small => 13,
    AppInputSize.medium => 15,
    AppInputSize.large => 17,
  };

  double get _iconSize => switch (widget.size) {
    AppInputSize.small => 18,
    AppInputSize.medium => 20,
    AppInputSize.large => 22,
  };

  EdgeInsetsGeometry get _contentPadding =>
      widget.contentPadding ??
      switch (widget.size) {
        AppInputSize.small => const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        AppInputSize.medium => const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        AppInputSize.large => const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
      };

  double get _radius =>
      widget.borderRadius ??
      switch (widget.size) {
        AppInputSize.small => 12,
        AppInputSize.medium => 16,
        AppInputSize.large => 20,
      };
  Color get _activeColor => widget.activeColor ?? const Color(0xFF125FA3);

  Color get _fillColor =>
      widget.fillColor ??
      (widget.enabled ? Colors.grey.shade100 : Colors.grey.shade50);


  Color get _iconColor => widget.iconColor ?? Colors.grey.shade500;
  InputBorder _filledBorder(Color color, {double width = 1.0}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(_radius),
        borderSide: BorderSide(color: color, width: width),
      );


  InputBorder _borderFor({
    required bool focused,
    required bool error,
    required bool disabled,
  }) {
    if (widget.variant == AppInputVariant.underlined) {
      if (error) {
        return const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 0.5),
        );
      }

      return UnderlineInputBorder(
        borderSide: BorderSide(
          color: focused ? _activeColor : Colors.grey.shade300,
          width: focused ? 0.5 : 0,
        ),
      );
    }

    if (disabled) {
      return _filledBorder(Colors.grey.shade200);
    }

    if (error) {
      return _filledBorder(Colors.red, width: 0.5);
    }

    return _filledBorder(
      focused
          ? _activeColor
          : (widget.variant == AppInputVariant.outlined
                ? Colors.grey.shade400
                : Colors.grey.shade200),
      width: focused ? 0.5 : 0,
    );
  }

  Widget? get _prefix {
    if (widget.prefixWidget != null) {
      return widget.prefixWidget;
    }

    if (widget.prefixIcon != null) {
      return Icon(widget.prefixIcon, size: _iconSize, color: _iconColor);
    }

    return null;
  }

  Widget? get _suffix {
    if (widget.isPassword) {
      return IconButton(
        splashRadius: 18,
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        icon: Icon(
          _obscureText
              ? Icons.visibility_off_rounded
              : Icons.visibility_rounded,
          size: _iconSize,
          color: widget.iconColor ?? Colors.grey.shade500,
        ),
      );
    }

    if (widget.suffixWidget != null) {
      return widget.suffixWidget;
    }

    if (widget.suffixIcon != null) {
      return IconButton(
        splashRadius: 18,
        onPressed: widget.onSuffixTap,
        icon: Icon(
          widget.suffixIcon,
          size: _iconSize,
          color: widget.iconColor ?? Colors.grey.shade500,
        ),
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bool hasExternalError =
        widget.errorText != null && widget.errorText!.isNotEmpty;
    final bool isDisabled = !widget.enabled;

    return TextFormField(
      controller: widget.controller,
      initialValue: widget.controller == null ? widget.initialValue : null,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      obscureText: _obscureText,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      inputFormatters: widget.inputFormatters,
      autovalidateMode: widget.autovalidateMode,
      buildCounter: widget.showCounter
          ? null
          : (_, {required currentLength, required isFocused, maxLength}) =>
                null,

      validator: hasExternalError ? (_) => widget.errorText : widget.validator,

      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      onTap: widget.onTap,

      style:
          widget.textStyle ??
          TextStyle(
            fontSize: _fontSize,
            fontWeight: FontWeight.w500,
            color: widget.textColor ?? Colors.grey.shade900,
          ),

      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        helperText: widget.helperText,
        helperMaxLines: 2,
        errorMaxLines: 2,

        labelStyle:
            widget.labelStyle ??
            TextStyle(
              color: _isFocused ? _activeColor : Colors.grey.shade600,
              fontSize: _fontSize,
            ),

        hintStyle:
            widget.hintStyle ??
            TextStyle(
              color: widget.hintColor ?? Colors.grey.shade400,
              fontSize: _fontSize,
              fontWeight: FontWeight.w400,
            ),

        helperStyle:
            widget.helperStyle ??
            TextStyle(color: Colors.grey.shade500, fontSize: _fontSize - 2),

        errorStyle: TextStyle(
          color: Colors.red.shade600,
          fontSize: _fontSize - 2,
        ),
        prefixIcon: _prefix,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 56,
          minHeight: 56,
        ),
        suffixIcon: _suffix,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 48,
          minHeight: 48,
        ),
        prefixText: widget.prefixText,
        suffixText: widget.suffixText,
        prefixStyle: TextStyle(
          color: Colors.grey.shade600,
          fontSize: _fontSize,
        ),
        suffixStyle: TextStyle(
          color: Colors.grey.shade600,
          fontSize: _fontSize,
        ),
        filled: widget.variant != AppInputVariant.underlined,
        fillColor: isDisabled ? Colors.grey.shade50 : _fillColor,
        contentPadding: _contentPadding,
        border: _borderFor(focused: false, error: false, disabled: false),
        enabledBorder: _borderFor(
          focused: false,
          error: false,
          disabled: isDisabled,
        ),
        focusedBorder: _borderFor(focused: true, error: false, disabled: false),
        errorBorder: _borderFor(focused: false, error: true, disabled: false),
        focusedErrorBorder: _borderFor(
          focused: true,
          error: true,
          disabled: false,
        ),
        disabledBorder: _borderFor(
          focused: false,
          error: false,
          disabled: true,
        ),
      ),
    );
  }
}
