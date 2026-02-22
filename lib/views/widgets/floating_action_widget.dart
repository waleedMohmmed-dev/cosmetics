import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FloatingActionWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Widget widget;

  const FloatingActionWidget({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      child: Icon(Icons.arrow_forward, color: Colors.white),
    );
  }
}
