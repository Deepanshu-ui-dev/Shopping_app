import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Reusable themed text field wrapping [ShadInput].
class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final bool obscureText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hinttext,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return ShadInput(
      controller: controller,
      placeholder: Text(hinttext),
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      leading: prefixIcon != null ? Icon(prefixIcon, size: 16) : null,
      trailing: suffixIcon,
    );
  }
}