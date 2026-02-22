import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/shared/costum_text.dart';
import 'package:cosmetics/views/on_bording3.dart';
import 'package:cosmetics/views/widgets/floating_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnBording2 extends StatelessWidget {
  const OnBording2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.secondaryColor,
        //
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Center(
              child: CostumText(
                text: 'Skip',
                size: 16.sp,
                color: Color(0xff434C6D),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Gap(100),
          Center(
            child: Image.asset(
              'assets/images/on_boarding2.png',
              width: 314.w,
              height: 288.h,
            ),
          ),
          Gap(30),
          Image.asset(
            'assets/images/Frame 102.png',
            width: 308.w,
            height: 74.h,
          ),

          Gap(40),
          FloatingActionWidget(
            backgroundColor: AppColors.primaryColor,
            widget: Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => OnBording3()),
              );
            },
          ),
        ],
      ),
    );
  }
}
