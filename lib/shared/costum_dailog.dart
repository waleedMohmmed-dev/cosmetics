import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/root.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:cosmetics/shared/costum_button.dart';

class CostumDailog extends StatelessWidget {
  final bool isFromCreateAccount;

  const CostumDailog({super.key, this.isFromCreateAccount = false});

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
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              'assets/images/dialog_logo.png',
              width: 100.w,
              height: 100.h,
            ),
            Gap(26),
            Text(
              isFromCreateAccount ? 'Account Activated!' : 'Password Created!',

              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
                fontFamily: 'Montserrat',
              ),
            ),
            Gap(7),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                isFromCreateAccount
                    ? 'Congratulations! Your account has been successfully activated'
                    : 'Congratulations! Your password \nhas been successfully created',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.labelColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Gap(23),
            CostumButton(
              buttonText: isFromCreateAccount
                  ? 'Go To Home'
                  : 'Return To Login',
              buttonColor: AppColors.buttonColor,
              bordersRadius: 60,
              width: 260.w,
              height: 60.h,
              onTap: () {
                if (isFromCreateAccount) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => Root()),
                    (route) => false,
                  );
                } else {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => LoginView()),
                    (route) => false,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
