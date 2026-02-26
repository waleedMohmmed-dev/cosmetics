import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/shared/costum_button.dart';
import 'package:cosmetics/shared/costum_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            Gap(120),
            Center(
              child: Image.asset(
                'assets/images/splash_image.png',
                height: 57.sp,
                width: 67.sp,
              ),
            ),
            Gap(40),

            Text(
              'Create Password',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                fontFamily: 'Montserrat',
              ),
            ),
            Gap(30),

            Text(
              'The password should have at least \n6 characters.',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryColor,
              ),
            ),
            Gap(60),

            CostumTextField(
              height: 46.w,
              hintText: 'New password',
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: AppColors.labelColor,
              ),
            ),
            Gap(20),
            CostumTextField(
              height: 46.w,
              hintText: 'Confirm password',
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: AppColors.labelColor,
              ),
            ),
            Gap(70),
            CostumButton(
              buttonText: 'Confirm',

              buttonColor: AppColors.buttonColor,
              onTap: () {},
              width: 260.w,
              height: 65.h,
              bordersRadius: 50.r,
            ),
          ],
        ),
      ),
    );
  }
}
