import 'package:cosmetics/core/constans/app_colors.dart';

import 'package:cosmetics/on_bording_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(builder: (c) => OnBordingView()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/splash_image.png',
              width: 200.w,
              height: 165.h,
            ),
          ),
          Gap(16),
          Image.asset('assets/images/vector.png', width: 180.w),
        ],
      ),
    );
  }
}
