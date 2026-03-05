import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/views/splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    show ScreenUtil, ScreenUtilInit;

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            fontFamily: 'Montserrat',
            splashColor: Colors.transparent,
            scaffoldBackgroundColor: AppColors.secondaryColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.secondaryColor,
              elevation: 0,
            ),
            // theme text here
          ),
          navigatorKey: navKey,
          home: SplashView(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
        );
      },
    );
  }
}
