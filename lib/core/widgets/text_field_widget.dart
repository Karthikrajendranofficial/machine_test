import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final TextInputType? inputType;
  final TextInputAction? action;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  const TextFieldWidget({
    required this.label,
    super.key,
    this.inputType,
    this.action,
    this.controller,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      keyboardType: inputType,
      textInputAction: action,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
