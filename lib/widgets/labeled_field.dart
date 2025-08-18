import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/responsives.dart';

class LabeledField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool readOnly;
  final String? hint;
  final Widget? trailing;
  final TextInputType? keyboardType;
  final bool obscure;

  const LabeledField({
    super.key,
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.hint,
    this.trailing,
    this.keyboardType,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Responsive.font(16),
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: Responsive.height(8)),
        TextField(
          controller: controller,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.textSecondary),
            suffixIcon: trailing,
            filled: true,
            fillColor: readOnly ? Colors.grey.shade200 : Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: Responsive.width(12),
              vertical: Responsive.height(12),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Responsive.width(AppConstants.borderRadius)),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: keyboardType,
          obscureText: obscure,
        ),
      ],
    );
  }
}
