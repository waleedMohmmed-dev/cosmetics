import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/futures/views/cart/widget/cart_item_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        actions: [
          Row(
            children: [
              Text(
                'My Cart',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 23.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(100),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SvgPicture.asset(
                  'assets/icons/svgs/cart_icon.svg',
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                'You have 4 products in your cart',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Gap(30),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (contect, index) {
                  return CartItemWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
