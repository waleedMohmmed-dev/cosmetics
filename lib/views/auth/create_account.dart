import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/auth/verify.dart';

import 'package:cosmetics/shared/costum_button.dart';
import 'package:cosmetics/shared/costum_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<CreateAccountView> {
  final nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subNumberController = TextEditingController();
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
                height: 62.sp,
                width: 67.sp,
              ),
            ),
            Gap(40),
            Text(
              'Create Account',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                fontFamily: 'Montserrat',
              ),
            ),
            Gap(70),
            CostumTextField(labelText: 'Your Name', controller: nameController),
            Gap(20),
            CostumTextField(labelText: 'Email', controller: _emailController),
            Gap(20),
            Row(
              children: [
                CostumTextField(
                  labelText: '+20',
                  width: 72.w,
                  height: 46.h,
                  controller: _subNumberController,
                ),
                Gap(10),
                CostumTextField(
                  labelText: 'Phone Number',
                  width: 266.w,
                  controller: _numberController,
                ),
              ],
            ),
            Gap(16),
            CostumTextField(
              controller: _passwordController,
              hintText: 'Create your password',
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: AppColors.labelColor,
              ),
            ),
            Gap(20),
            CostumTextField(
              controller: _confirmPasswordController,
              hintText: 'Confirm Password',
              suffixIcon: Icon(
                Icons.visibility_off,
                color: AppColors.labelColor,
              ),
            ),
            Gap(16),
            CostumButton(
              buttonText: 'Next',
              buttonColor: AppColors.buttonColor,
              width: 268.w,
              height: 65.h,
              bordersRadius: 60.r,
              onTap: () {
                // هنا نمرر isRegister = true
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => VerifyView(isRegister: true),
                  ),
                );
              },
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (c) => LoginView()),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: "Have an account? ",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 13.sp,
                    fontFamily: 'Montserrat',
                  ),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: AppColors.buttonColor,
                        fontSize: 13.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(40),
          ],
        ),
      ),
    );
  }
}
