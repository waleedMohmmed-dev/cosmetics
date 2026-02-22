import 'package:cosmetics/views/on_bording1.dart';
import 'package:cosmetics/views/on_bording2.dart';
import 'package:cosmetics/views/on_bording3.dart';
import 'package:cosmetics/views/splash_view.dart';
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
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(splashColor: Colors.transparent),
          home: const SplashView(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
        );
      },
    );
  }
}
