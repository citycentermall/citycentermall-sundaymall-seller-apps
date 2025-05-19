import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;
  // final IconData? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final bool obscureText;
  final bool showSuffixIcon;
  final VoidCallback? toggleObscure;
  final InputBorder? border;
  final String? prefixText;
  final TextInputType? keyboardType;
  final int? maxLength;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hintText,
    required prefixIcon,
    this.controller,
    required this.validator,
    this.obscureText = false,
    this.showSuffixIcon = false,
    this.toggleObscure,
    this.border,
    this.prefixText,
    this.keyboardType,
    this.maxLength,
    // this.prefixIcon,
    // this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          keyboardType: keyboardType,
          maxLength: maxLength,
          decoration: InputDecoration(
            counterText: '',
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon(prefixIcon),
                  prefixText != null
                      ? const SizedBox(width: 8.0,)
                      : const SizedBox.shrink(),
                  prefixText != null
                      ? Text(prefixText ?? 'khali', style: const TextStyle(fontSize: 16),)
                      : const SizedBox.shrink()
                ],
              ),
            ),
            suffixIcon: showSuffixIcon
                ? IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: toggleObscure,
            )
                : null,
            border: border ?? OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}