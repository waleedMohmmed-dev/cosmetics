import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/auth/forget_password.dart';
import 'package:cosmetics/views/auth/create_account.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_input.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final passwordController = TextEditingController();
  final subNamburController = TextEditingController();

  final numberController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    subNamburController.dispose();
    numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              100.ph,

              Center(
                child: AppImage(
                  path: 'assets/images/login_logo.png',
                  width: 284.w,
                  height: 227.h,
                ),
              ),
              25.ph,
              Text(
                'Login Now',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,

                  color: AppColors.primaryColor,
                ),
              ),
              14.ph,
              Text(
                'Please enter the details below to continue',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,

                  color: AppColors.primaryColor,
                ),
              ),
              25.ph,

              Row(
                children: [
                  AppInput(
                    hintText: '+20',
                    height: 46.h,
                    width: 72.w,
                    controller: subNamburController,
                    // suffixIcon: Icon(Icons.arrow_drop_down, size: 13.sp),
                    keyboardType: TextInputType.number,
                  ),
                  5.pw,
                  AppInput(
                    labelText: 'Phone Number',
                    height: 46.h,
                    width: 285.w,
                    controller: numberController,
                  ),
                ],
              ),
              7.ph,
              AppInput(
                hintText: 'Your Passwoed',
                width: double.infinity,
                height: 46.h,
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  color: AppColors.labelColor,
                ),
                controller: passwordController,
                keyboardType: TextInputType.number,
              ),
              11.ph,

              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    goTo(page: ForgetPasswordView(), canPop: true);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (c) => ForgetPasswordView()),
                    // );
                  },
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12.sp,

                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              43.ph,

              AppButton(
                buttonText: 'Login',

                onTap: () {
                  goTo(page: HomeView(), canPop: false);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (c) => MainVeiw()),
                  // );
                },
              ),
              86.ph,

              GestureDetector(
                onTap: () {
                  goTo(page: CreateAccountView(), canPop: true);
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (c) => CreateAccountView()),
                  // );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 13.sp,
                    ),

                    children: [
                      TextSpan(
                        text: "Register",
                        style: TextStyle(
                          color: AppColors.buttonColor,
                          fontSize: 13.sp,

                          fontWeight: FontWeight.w600,
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
