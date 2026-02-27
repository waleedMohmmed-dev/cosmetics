import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:cosmetics/shared/costum_button.dart';

class CostumDailog extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback? onTap;

  const CostumDailog({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.onTap,
  });

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
              title,
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
                description,
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
              buttonText: buttonText,
              buttonColor: AppColors.buttonColor,
              bordersRadius: 60,
              width: 260.w,
              height: 60.h,
              onTap: onTap ?? () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
