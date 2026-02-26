import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/futures/views/auth/verify_view.dart';
import 'package:cosmetics/shared/costum_button.dart';
import 'package:cosmetics/shared/costum_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _subNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        children: [
          Gap(60),
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
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Gap(60),
          Center(
            child: Image.asset(
              'assets/images/splash_image.png',
              height: 57.sp,
              width: 67.sp,
            ),
          ),
          Gap(40),

          Text(
            'Forget Password',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
          Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Text(
              'Please enter your phone number below            \n  to recovery your password.',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Gap(62),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                CostumTextField(
                  controller: _subNumberController,
                  hintText: '+20',
                  width: 72.w,
                  height: 46.h,
                ),
                Gap(5),
                CostumTextField(
                  labelText: 'Phone Number',
                  height: 46.h,
                  width: 266.w,

                  controller: _phoneController,
                ),
              ],
            ),
          ),
          Gap(55),
          CostumButton(
            buttonColor: AppColors.buttonColor,

            buttonText: 'Next',
            bordersRadius: 60.r,
            width: 250.w,
            height: 65.h,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => VerifyView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
