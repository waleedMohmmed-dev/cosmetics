import 'package:flutter/material.dart';

class AppBack extends StatelessWidget {
  final Widget icon;
  final Function() onTap;
  AppBack({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerStart,
      child: IconButton(onPressed: onTap, icon: icon),
    );
  }
}
