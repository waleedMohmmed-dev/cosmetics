import 'package:cosmetics/futures/views/cart/cart_view.dart';
import 'package:cosmetics/futures/views/category/category_view.dart';
import 'package:cosmetics/futures/views/home/home_view.dart';
import 'package:cosmetics/splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    show ScreenUtil, ScreenUtilInit;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(splashColor: Colors.transparent),
          home: Splash(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
        );
      },
    );
  }
}
