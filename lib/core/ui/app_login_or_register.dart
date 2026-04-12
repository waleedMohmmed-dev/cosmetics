import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/views/auth/register.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoginOrRegister extends StatelessWidget {
  final bool isLogin;
  const AppLoginOrRegister({super.key, this.isLogin = false});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: isLogin ? 'Dont have an account?' : 'Hava an account?',
            style: TextStyle(color: AppColors.primaryColor, fontSize: 13.sp),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: TextButton(
              onPressed: () {
                if (isLogin) {
                  goTo(page: Register());
                } else {
                  goTo(page: LoginView());
                }
              },

              child: Text(
                isLogin ? 'Register' : 'Login',
                style: TextStyle(
                  color: AppColors.buttonColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
