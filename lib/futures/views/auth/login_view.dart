import 'package:cosmetics/core/constans/app_colors.dart';
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
  final TextEditingController _subNamburController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                width: 280.w,
                height: 227.h,
              ),
            ),
            Gap(20),
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
                fontWeight: FontWeight.w300,
                fontFamily: 'Montserrat',
                color: AppColors.primaryColor,
              ),
            ),
            Gap(25),

            /// text fields
            Row(
              children: [
                CostumTextField(
                  hintText: '+20',
                  height: 46.h,
                  width: 78.w,
                  controller: _subNamburController,
                  // suffixIcon: Icon(Icons.arrow_drop_down, size: 13.sp),
                  keyboardType: TextInputType.number,
                ),
                Gap(5),
                CostumTextField(
                  labelText: 'Phone Number',
                  height: 46.h,
                  width: 260.w,
                ),
              ],
            ),
            Gap(10),
            CostumTextField(
              hintText: 'Your Passwoed',
              width: double.infinity,
              height: 46.sp,
              suffixIcon: Icon(Icons.remove_red_eye_outlined),
              controller: _passwordController,
              keyboardType: TextInputType.number,
            ),
            Gap(10),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forget Password?',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.sp,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Gap(55),

            CostumButton(
              buttonText: 'Login',
              width: 260.w,
              height: 65.h,
              bordersRadius: 30.r,
              buttonColor: AppColors.buttonColor,
              onTap: () {},
            ),
            Spacer(),

            /// new font
            RichText(
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
                    ),
                  ),
                ],
              ),
            ),
            Gap(40),
          ],
        ),
      ),
    );
  }
}
