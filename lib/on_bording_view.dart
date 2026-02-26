import 'package:cosmetics/futures/views/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/shared/floating_action_widget.dart';
import 'package:cosmetics/shared/costum_button.dart';

class OnBordingView extends StatefulWidget {
  const OnBordingView({super.key});

  @override
  State<OnBordingView> createState() => _OnBordingSinglePageState();
}

class _OnBordingSinglePageState extends State<OnBordingView> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> pages = [
    {
      'image': 'assets/images/logo.png',
      'title': 'WELCOME!',
      'subtitle':
          'Makeup has the power to transform your mood and empowers you to be more confident person.',
      'buttonText': 'Next',
    },
    {
      'image': 'assets/images/logo2.png',
      'title': 'SEARCH & PICK',
      'subtitle':
          'We have dedicated set of products and routines hand picked for every skin type.',
      'buttonText': 'Next',
    },
    {
      'image': 'assets/images/notificaion.png',
      'title': 'PUSH NOTIFICATIONS',
      'subtitle': 'Allow notifications for new makeup & cosmetics offers.',
      'buttonText': 'Let’s start!',
    },
  ];

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (c) => LoginView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = pages[currentIndex];
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Center(
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 16.sp, color: Color(0xff434C6D)),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              page['image'],
              width: currentIndex == 1 ? 314.w : 240.w,
              height: currentIndex == 1 ? 288.h : 230.h,
            ),
          ),
          Gap(30),
          Text(
            page['title'],
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              fontFamily: 'SegoeUI',
            ),
          ),
          Gap(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              page['subtitle'],
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryColor,
                fontFamily: 'SegoeUI',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Gap(40),
          currentIndex < pages.length - 1
              ? FloatingActionWidget(
                  backgroundColor: AppColors.primaryColor,
                  onPressed: nextPage,
                )
              : CostumButton(
                  buttonText: page['buttonText'],
                  bordersRadius: 58.r,
                  width: 268.w,
                  height: 64.h,
                  onTap: nextPage,
                ),
        ],
      ),
    );
  }
}
