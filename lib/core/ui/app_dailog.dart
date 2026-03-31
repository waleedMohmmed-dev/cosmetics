import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cosmetics/core/ui/app_button.dart';

class AppDailog extends StatelessWidget {
  final bool isFromCreateAccount;

  const AppDailog({super.key, this.isFromCreateAccount = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 343.h,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(38.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          children: [
            AppImage(
              path: 'assets/images/dialog_logo.png',
              width: 100.w,
              height: 100.h,
            ),
            26.ph,

            Text(
              isFromCreateAccount ? 'Account Activated!' : 'Password Created!',

              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            7.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                isFromCreateAccount
                    ? 'Congratulations! Your account has been successfully activated'
                    : 'Congratulations! Your password has been successfully created',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.labelColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            23.ph,
            AppButton(
              buttonText: isFromCreateAccount
                  ? 'Go To Home'
                  : 'Return To Login',

              onTap: () {
                if (isFromCreateAccount) {
                  goTo(page: HomeView(), canPop: false);
                } else {
                  goTo(page: LoginView());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
