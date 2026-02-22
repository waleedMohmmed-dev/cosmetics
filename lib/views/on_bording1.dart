import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/shared/costum_button.dart';
import 'package:cosmetics/shared/costum_text.dart';
import 'package:cosmetics/views/on_bording2.dart';
import 'package:cosmetics/views/widgets/floating_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnBording1 extends StatefulWidget {
  const OnBording1({super.key});

  @override
  State<OnBording1> createState() => _OnBording1State();
}

class _OnBording1State extends State<OnBording1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        automaticallyImplyLeading: false,

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
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gap(100),
          Center(
            child: Image.asset(
              'assets/images/on_boarding1.png',
              width: 283.w,
              height: 260.h,
            ),
          ),
          Gap(27),
          Image.asset(
            'assets/images/Frame 101.png',
            width: 308.w,
            height: 86.h,
          ),
          Gap(40),
          FloatingActionWidget(
            backgroundColor: AppColors.primaryColor,
            widget: Icon(Icons.arrow_forward, color: Colors.white),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => OnBording2()),
              );
            },
          ),
        ],
      ),
    );
  }
}
