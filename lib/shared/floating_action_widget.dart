import 'package:flutter/material.dart';

class FloatingActionWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Widget? widget;

  const FloatingActionWidget({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      child: Icon(Icons.arrow_forward_ios, color: Colors.white),
    );
  }
}
