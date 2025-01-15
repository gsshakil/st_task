import 'package:flutter/material.dart';

class KCheckBox extends StatelessWidget {
  const KCheckBox({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.fontSize = 16,
    required this.color,
  });

  final String title;
  final bool value;
  final Function onChanged;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      dense: true,
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
        ),
      ),
      value: value,
      contentPadding: EdgeInsets.zero,
      onChanged: ((value) => onChanged()),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
