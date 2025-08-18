import 'package:flutter/material.dart';

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
    this.readOnly=false,
    this.hint,
    this.trailing,
    this.keyboardType,
    this.obscure=false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: trailing,
            filled: true,
            fillColor: readOnly ? Colors.grey.shade200 : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          ),
          keyboardType: keyboardType,
          obscureText: obscure,
        ),
      ],
    );
  }
}
