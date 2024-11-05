import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onSubmitted;

  const SearchFieldWidget({
    super.key,
    required this.hintText,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
      ),
      onSubmitted: onSubmitted,
    );
  }
}
