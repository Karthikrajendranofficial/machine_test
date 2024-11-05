import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String label;

  const TextfieldWidget({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text(
                  label,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        )
      ],
    );
  }
}
