import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/views/on_bording1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(builder: (c) => OnBording1()),
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
              'assets/images/Layer_1.png',
              width: 200.w,
              height: 165.h,
            ),
          ),
          Gap(16),
          Image.asset('assets/images/splash_image2.png', width: 180.w),
        ],
      ),
    );
  }
}
