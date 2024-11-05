import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String label;
  final TextInputType? inputType;
  final TextInputAction? action;
  final bool obscureText;

  const TextfieldWidget({
    required this.label,
    super.key,
    this.inputType,
    this.action,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
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
      ),
    );
  }
}
