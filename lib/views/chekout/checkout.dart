import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/shared/costum_button.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,

      body: Column(
        children: [
          Gap(80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Row(
              children: [
                Container(
                  height: 33.h,
                  width: 33.w,
                  decoration: BoxDecoration(
                    color: Color(0xff1010100D).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),

                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Gap(115),
                Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ), //
          Gap(19),

          Stack(
            children: [
              Container(
                width: 390.w,
                height: 690.h,
                decoration: BoxDecoration(
                  color: const Color.from(
                    alpha: 1,
                    red: 0.835,
                    green: 0.98,
                    blue: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: 27,

                child: Text(
                  'Delivery to',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 41,
                child: Container(
                  width: 309.w,
                  height: 84.h,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.cyanAccent, width: 1.5),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/images/map.png',
                          width: 96.w,
                          height: 60.h,
                        ),
                      ),
                      Gap(1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            ' Mansoura,14 Porsaid St',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                              color: AppColors.labelColor,
                            ),
                          ),
                        ],
                      ),
                      Gap(15),

                      Icon(CupertinoIcons.chevron_down, color: Colors.red),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 180,
                left: 27,
                child: Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),

              ///
              Positioned(
                top: 220,
                left: 41,
                child: Container(
                  width: 309.w,
                  height: 57.h,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.cyanAccent, width: 1.5),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/card_icon.png',
                          width: 30.w,
                          height: 20.h,
                        ),
                      ),
                      Gap(1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '**** **** **** 0256',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Gap(116),

                      Icon(CupertinoIcons.chevron_down, color: Colors.red),
                    ],
                  ),
                ),
              ),

              ///
              Positioned(
                top: 300,
                left: 41,
                child: Container(
                  width: 309.w,
                  height: 57.h,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.cyanAccent, width: 1.5),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/vaucher.png',
                          width: 30.w,
                          height: 20.h,
                        ),
                      ),
                      Gap(1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add vaucher',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Gap(80),
                      CostumButton(
                        width: 93.w,
                        height: 30.h,
                        buttonColor: AppColors.buttonColor,
                        buttonText: 'Apply',

                        bordersRadius: 20.r,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 410,
                left: 15,
                right: 14,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Image.asset('assets/images/line.png', height: 1.h),
                ),
              ),
              Positioned(
                top: 430,
                left: 35,
                child: Text(
                  '- REVIEW PAYMENT',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                    color: AppColors.primaryColor,
                  ),
                ),
              ),

              Positioned(
                top: 470,
                left: 35,
                child: Text(
                  'PAYMENT SUMMARY',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Positioned(
                top: 520,
                left: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Gap(220),
                    Text(
                      '16.100 EGP',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 540,
                left: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SHIPPING FEES',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Gap(120),
                    Text(
                      'TO BE CALCULATED',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 35,
                right: 35,
                top: 570,
                child: Divider(thickness: 2, color: Colors.black),
              ),

              /// divider
              Positioned(
                top: 600,
                left: 35,
                child: Row(
                  children: [
                    Text(
                      'TOTAL + VAT',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),

                    //
                    Gap(180),
                    Text(
                      '16.100 EGP',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 660,
                left: 61,
                right: 61,
                child: CostumButton(
                  buttonColor: AppColors.buttonColor,
                  buttonText: 'ORDER',
                  width: 268.w,
                  height: 65.h,
                  bordersRadius: 60.r,
                  onTap: () {},

                  icon: Image.asset(
                    'assets/images/cart_suffixicon.png',
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
