import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/home/pages/profile.dart';
import 'package:cosmetics/views/home/pages/veiw.dart';

import 'package:cosmetics/views/on_bording_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // Future.delayed(Duration(seconds: 2)).then(
    //   (value) => Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (c) => OnBordingView()),
    //   ),
    // );

    goTo(page: const OnBordingView(), canPop: false, delaySeconds: 20);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AppImage(
              path: 'assets/images/splash_image.png',
              width: 200.w,
              height: 200.h,
            ),
          ),
          17.ph,
          AppImage(
            path: 'assets/images/vector.png',
            width: 120.w,
            height: 46.h,
          ),
        ],
      ),
    );
  }
}
