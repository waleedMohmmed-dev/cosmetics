import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/ui/app_image.dart';

import 'package:cosmetics/views/auth/verify.dart';

import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<CreateAccountView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subNumberController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void dipose() {
    nameController.dispose();
    emailController.dispose();
    subNumberController.dispose();
    numberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              95.ph,
              Center(
                child: AppImage(
                  path: 'assets/images/splash_image.png',
                  height: 62.h,
                  width: 67.w,
                ),
              ),
              40.ph,
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              71.ph,
              AppInput(labelText: 'Your Name', controller: nameController),
              37.ph,
              AppInput(labelText: 'Email', controller: emailController),
              33.ph,
              Row(
                children: [
                  AppInput(
                    labelText: '+20',
                    width: 72.w,
                    height: 46.h,
                    controller: subNumberController,
                  ),
                  10.pw,
                  AppInput(
                    labelText: 'Phone Number',
                    width: 266.w,
                    controller: numberController,
                  ),
                ],
              ),
              16.ph,
              AppInput(
                controller: passwordController,
                hintText: 'Create your password',
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: AppColors.labelColor,
                ),
              ),
              20.ph,
              AppInput(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  color: AppColors.labelColor,
                ),
              ),
              16.ph,
              AppButton(
                buttonText: 'Next',
                buttonColor: AppColors.buttonColor,
                width: 268.w,
                height: 65.h,
                bordersRadius: 60.r,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => VerifyView(isRegister: true),
                    ),
                  );
                },
              ),
              40.ph,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const VerifyView(isRegister: true),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Have an account? ",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 13.sp,
                    ),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          color: AppColors.buttonColor,
                          fontSize: 13.sp,

                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
