import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/ui/app_floating_action_widget.dart';
import 'package:cosmetics/core/ui/app_button.dart';

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
      goTo(page: LoginView(), canPop: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = pages[currentIndex];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Center(
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff434C6D),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AppImage(
              path: page['image'],
              width: currentIndex == 1 ? 314.w : 240.w,
              height: currentIndex == 1 ? 288.h : 230.h,
            ),
          ),

          30.ph,
          Text(
            page['title'],
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              fontFamily: 'SegoeUI',
            ),
          ),
          10.ph,
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

          40.ph,
          currentIndex < pages.length - 1
              ? AppFloatingActionWidget(
                  backgroundColor: AppColors.primaryColor,
                  onPressed: nextPage,
                )
              : AppButton(
                  buttonText: page['buttonText'],
                  buttonColor: AppColors.primaryColor,

                  onTap: nextPage,
                ),
        ],
      ),
    );
  }
}
