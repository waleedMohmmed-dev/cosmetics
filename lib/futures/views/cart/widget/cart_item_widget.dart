import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /// image
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Image.asset(
                'assets/images/cart_product.png',
                width: 102.w,
                height: 102.h,
              ),

              /// text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Note Cosmetics',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),

                    Gap(7),

                    Text(
                      'Ultra rich mascara for lashes',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),

                    Gap(15),

                    Text(
                      '350 EGP',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),

                    Gap(10),
                  ],
                ),
              ),
            ],
          ),
        ),

        /// quntity
        Container(
          width: 142.w,
          height: 42.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Color(0xff8E8EA9)),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.minimize,
                  size: 30.sp,
                  color: Color(0xff434C6D82),
                ),
              ),
              Gap(20),
              Text(
                '1',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ],
          ),
        ),

        Divider(thickness: 1, color: Color(0xffB3B3C180)),
      ],
    );
  }
}
