import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CategoryItemWidget extends StatelessWidget {
  final Function()? onTap;
  const CategoryItemWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/category_item.png',
                  width: 64.w,
                  height: 69.h,
                ),
                Gap(13),
                Text(
                  'Bundles',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_right,
                  color: AppColors.primaryColor.withOpacity(1),
                  size: 25.sp,
                ),
              ],
            ),
          ),

          Divider(thickness: 1, color: Color(0xffB3B3C180)),
        ],
      ),
    );
  }
}
