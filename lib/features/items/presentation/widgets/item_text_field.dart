import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';

const itemFieldTextStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w600,
  color: AppColors.textPrimary,
);

InputDecoration itemInputDecoration({
  required String label,
  String? hintText,
  String? errorText,
  String? suffixText,
  Widget? suffixIcon,
  BoxConstraints? suffixIconConstraints,
  Color? accent,
}) {
  OutlineInputBorder border(Color color, [double width = 1]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  return InputDecoration(
    labelText: label,
    hintText: hintText,
    errorText: errorText,
    errorMaxLines: 2,
    suffixText: suffixText,
    suffixIcon: suffixIcon,
    suffixIconConstraints: suffixIconConstraints,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    filled: true,
    fillColor: AppColors.surface,
    isDense: true,
    contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
    labelStyle: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
    hintStyle: const TextStyle(fontSize: 14, color: AppColors.hint),
    suffixStyle: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
    border: border(AppColors.border),
    enabledBorder: border(accent ?? AppColors.border),
    focusedBorder: border(accent ?? AppColors.primary, 1.5),
    errorBorder: border(AppColors.danger),
    focusedErrorBorder: border(AppColors.danger, 1.5),
  );
}

class ItemTextField extends StatelessWidget {
  const ItemTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.onChanged,
    this.focusNode,
    this.hintText,
    this.errorText,
    this.suffixText,
    this.suffixIcon,
    this.accent,
    this.keyboardType,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.minLines,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String label;
  final ValueChanged<String> onChanged;
  final FocusNode? focusNode;
  final String? hintText;
  final String? errorText;
  final String? suffixText;
  final Widget? suffixIcon;
  final Color? accent;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final int? minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      minLines: minLines,
      maxLines: maxLines,
      style: itemFieldTextStyle,
      decoration: itemInputDecoration(
        label: label,
        hintText: hintText,
        errorText: errorText,
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        accent: accent,
      ),
    );
  }
}