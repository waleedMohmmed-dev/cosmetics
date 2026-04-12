import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/cache_helper.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/product_details.dart';
import 'package:cosmetics/utils/pref_helper.dart';
import 'package:cosmetics/views/auth/create_password.dart';
import 'package:cosmetics/views/auth/forget_password.dart';
import 'package:cosmetics/views/auth/register.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/auth/verify.dart';
import 'package:cosmetics/views/home/main_view.dart';
import 'package:cosmetics/views/home/pages/cart.dart';
import 'package:cosmetics/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    show ScreenUtil, ScreenUtilInit, SizeExtension;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  // await PrefHelper.loadData();

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
            textTheme: TextTheme(),

            fontFamily: 'Montserrat',

            scaffoldBackgroundColor: AppColors.secondaryColor,

            ///Abb Bar Theme
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.secondaryColor,
              elevation: 0,
              centerTitle: true,
              surfaceTintColor: Colors.transparent,

              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff434c6D),
              ),
            ),
          ),

          navigatorKey: navKey,
          home: LoginView(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
        );
      },
    );
  }
}
