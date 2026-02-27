import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/views/auth/forget_password.dart';
import 'package:cosmetics/views/auth/create_account.dart';

import 'package:cosmetics/root.dart';
import 'package:cosmetics/shared/costum_button.dart';
import 'package:cosmetics/shared/costum_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _passwordController = TextEditingController();
  final _subNamburController = TextEditingController();

  final _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            Gap(100),
            Center(
              child: Image.asset(
                'assets/images/login_logo.png',
                width: 284.w,
                height: 227.h,
              ),
            ),
            Gap(25),
            Text(
              'Login Now',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                color: AppColors.primaryColor,
              ),
            ),
            Gap(14),
            Text(
              'Please enter the details below to continue',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
                color: AppColors.primaryColor,
              ),
            ),
            Gap(25),

            Row(
              children: [
                CostumTextField(
                  hintText: '+20',
                  height: 46.h,
                  width: 72.w,
                  controller: _subNamburController,
                  // suffixIcon: Icon(Icons.arrow_drop_down, size: 13.sp),
                  keyboardType: TextInputType.number,
                ),
                Gap(5),
                CostumTextField(
                  labelText: 'Phone Number',
                  height: 46.h,
                  width: 260.w,
                  controller: _numberController,
                ),
              ],
            ),
            Gap(7),
            CostumTextField(
              hintText: 'Your Passwoed',
              width: double.infinity,
              height: 46.h,
              suffixIcon: Icon(
                Icons.visibility_off,
                color: AppColors.labelColor,
              ),
              controller: _passwordController,
              keyboardType: TextInputType.number,
            ),
            Gap(11),

            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => ForgetPasswordView()),
                  );
                },
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Gap(43),

            CostumButton(
              buttonText: 'Login',
              width: 260.w,
              height: 65.h,
              bordersRadius: 30.r,
              buttonColor: AppColors.buttonColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => Root()),
                );
              },
            ),
            Spacer(),

            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (c) => CreateAccountView()),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 13.sp,
                    fontFamily: 'Montserrat',
                  ),

                  children: [
                    TextSpan(
                      text: "Register",
                      style: TextStyle(
                        color: AppColors.buttonColor,
                        fontSize: 13.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
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
