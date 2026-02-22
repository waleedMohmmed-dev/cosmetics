import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/shared/costum_button.dart';
import 'package:cosmetics/shared/costum_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnBording3 extends StatelessWidget {
  const OnBording3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,

      body: Column(
        children: [
          Gap(220),

          Center(
            child: Image.asset(
              'assets/images/Vector.png',
              width: 240.w,
              height: 230.h,
            ),
          ),
          Gap(30),

          Image.asset(
            'assets/images/Frame 103.png',
            width: 308.w,
            height: 80.h,
          ),
          Gap(40),
          CostumButton(
            buttonText: 'let’s start!',

            bordersRadius: 60.r,
            width: 235.w,
            height: 64.h,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
