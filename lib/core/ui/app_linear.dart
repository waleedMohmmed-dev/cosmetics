import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLinear extends StatelessWidget {
  const AppLinear({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentGeometry.bottomCenter,
          end: AlignmentGeometry.topCenter,
          colors: [Colors.pink, Colors.indigo.withValues(alpha: .93)],
        ),
      ),
    );
  }
}
