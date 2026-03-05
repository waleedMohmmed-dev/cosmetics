import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/auth/login.dart';

import 'package:cosmetics/views/auth/verify.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordView> {
  final phoneController = TextEditingController();
  final subNumberController = TextEditingController();
  @override
  void dispose() {
    phoneController.dispose();
    subNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          40.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Container(
                  height: 33.h,
                  width: 33.w,
                  decoration: BoxDecoration(
                    color: Color(0xff1010100D).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),

                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                    onPressed: () {
                      // Navigator.pop(context);
                      goTo(page: LoginView(), canPop: true);
                    },
                  ),
                ),
              ],
            ),
          ),
          40.ph,

          Center(
            child: AppImage(
              path: 'assets/images/splash_image.png',
              height: 62.sp,
              width: 67.sp,
            ),
          ),
          40.ph,

          Text(
            'Forget Password',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          40.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Text(
              'Please enter your phone number below          \n  to recovery your password.',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.labelColor,
              ),
            ),
          ),
          40.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                AppInput(
                  controller: subNumberController,
                  hintText: '+20',
                  width: 72.w,
                  height: 46.h,
                ),
                5.pw,
                AppInput(
                  labelText: 'Phone Number',
                  height: 46.h,
                  width: 266.w,

                  controller: phoneController,
                ),
              ],
            ),
          ),
          55.ph,
          AppButton(
            buttonColor: AppColors.buttonColor,

            buttonText: 'Next',

            onTap: () {
              goTo(page: VerifyView(), canPop: true);
            },
          ),
        ],
      ),
    );
  }
}
