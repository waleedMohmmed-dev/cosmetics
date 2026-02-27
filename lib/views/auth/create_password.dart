import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/shared/costum_button.dart';
import 'package:cosmetics/shared/costum_textfeild.dart';
import 'package:cosmetics/shared/costum_dailog.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CreatePasswordView extends StatelessWidget {
  final bool isRegister;

  const CreatePasswordView({super.key, this.isRegister = false});

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
              textAlign: TextAlign.center,
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
              width: 260.w,
              height: 65.h,
              bordersRadius: 50.r,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return Dialog(
                      child: CostumDailog(
                        title: isRegister
                            ? 'Account Activated!'
                            : 'Password Changed!',
                        description: isRegister
                            ? 'Congratulations! Your account has been successfully activated'
                            : 'Your new password has been set successfully.',
                        buttonText: isRegister ? 'Go to home' : 'Login Now',
                        onTap: () {
                          Navigator.pop(context);

                          if (isRegister) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Root()),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => LoginView()),
                            );
                          }
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
