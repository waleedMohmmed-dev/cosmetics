import 'package:animate_do/animate_do.dart';
import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/cache_helper.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/utils/pref_helper.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/home/main_view.dart';
import 'package:cosmetics/views/home/veiw.dart';
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
    goTo(
      page: CacheHelper.isFirstTime
          ? OnBordingView()
          : CacheHelper.isAuth
          ? MianView()
          : LoginView(),
      canPop: false,
      delaySeconds: 3,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SpinPerfect(
              child: AppImage(
                image: 'assets/images/splash_image.png',
                width: 200.w,
                height: 200.h,
              ),
            ),
          ),
          17.ph,
          AppImage(
            image: 'assets/images/vector.png',
            width: 120.w,
            height: 46.h,
          ),
        ],
      ),
    );
  }
}
