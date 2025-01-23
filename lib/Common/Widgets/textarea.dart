import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskone/Common/Utils/color.dart';

class TextAreas extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? prefixText;
  final int? minLines, maxLines, maxLength;
  final bool obscure;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isDense;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final TextInputType? keyboard;
  final bool? enabled;
  final TextStyle? hintStyle;
  final Color? borderColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final bool readOnly;
  const TextAreas({
    super.key,
    this.controller,
    required this.hintText,
    this.onChanged,
    this.prefixText,
    this.maxLines,
    this.maxLength,
    this.minLines,
    this.keyboard,
    this.obscure = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.borderColor = AppColors.primaryColor,
    this.enabled,
    this.hintStyle,
    this.focusNode,
    this.onTap,
    this.readOnly = false,
    this.initialValue,
    this.inputFormatters,
    this.contentPadding,
    this.isDense,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      controller: controller,
      keyboardType: keyboard,
      obscureText: obscure,
      enabled: enabled,
      style: hintStyle,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        isDense: isDense,
        contentPadding: contentPadding,
        prefixText: prefixText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
        ),
        hintText: hintText,
        hintStyle: hintStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      onChanged: onChanged,
      focusNode: focusNode,
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}
