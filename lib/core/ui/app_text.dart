import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String? text;
  final Color? color;
  final FontWeight? weight;
  final double? size;
  final int? maxLines;

  const AppText({
    super.key,
    this.text,
    this.color,
    this.weight,
    this.size,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,

      text ?? '',
      style: TextStyle(color: color, fontWeight: weight, fontSize: size),
    );
  }
}
