import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final TextInputType? inputType;
  final TextInputAction? action;
  final bool obscureText;
  final TextEditingController? controller;

  const TextFieldWidget({
    required this.label,
    super.key,
    this.inputType,
    this.action,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
