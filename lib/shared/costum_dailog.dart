import 'package:cosmetics/core/constans/app_colors.dart';

import 'package:cosmetics/root.dart';
import 'package:cosmetics/shared/costum_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CostumDailog extends StatelessWidget {
  const CostumDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60.r),
      child: Container(
        width: double.infinity,
        height: 320.h,

        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(50.r),
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
              Gap(10),

              Text(
                'Account Activated!',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                  fontFamily: 'Montserrat',
                ),
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Congratulations! Your account has been successfully activated',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.labelColor,
                  ),
                ),
              ),
              Spacer(),
              CostumButton(
                buttonText: 'Go to home',

                buttonColor: AppColors.buttonColor,

                bordersRadius: 60,
                width: 260,
                height: 60,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => Root()),
                  );
                },
              ),
              Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
