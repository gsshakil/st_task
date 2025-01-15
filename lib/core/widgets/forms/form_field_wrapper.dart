import 'package:flutter/material.dart';

class FormFieldWrapper extends StatelessWidget {
  const FormFieldWrapper({
    super.key,
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        child,
      ],
    );
  }
}
