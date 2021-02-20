import 'package:flutter/material.dart';

class AppTextBox extends StatelessWidget {
  final String label;
  final TextAlign alignment;
  final double fontSize;
  final bool isBold;
  final Color color;

  const AppTextBox(
    this.label, {
    this.alignment = TextAlign.start,
    this.fontSize = 18,
    this.isBold = false,
    this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: alignment,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
