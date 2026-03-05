import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/home/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:url_launcher/url_launcher.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  /// Url_Lunchur Open Maps methodd
  Future<void> _openMaps() async {
    final address = 'Mansoura,14 Porsaid St';
    final query = Uri.encodeComponent(address);
    final url = 'https://www.google.com/maps/search/?api=1&query=$query';

    /// if the phone can open link
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Can not open The Mpas Soryy Bro .';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          80.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                      goTo(page: ProfilePage());
                    },
                  ),
                ),

                100.pw,
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
          ),
          10.ph,

          Stack(
            children: [
              Container(
                width: 390.w,
                height: 690.h,
                decoration: BoxDecoration(
                  color: Color(0xff29D3DA).withValues(alpha: .11),
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
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Color(0xff73B9BB), width: 1.5),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: _openMaps,
                          child: AppImage(
                            path: 'assets/images/map.png',
                            width: 96.w,
                            height: 60.h,
                          ),
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,

                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            'Mansoura,14 Porsaid St',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,

                              color: AppColors.labelColor,
                            ),
                          ),
                        ],
                      ),
                      10.pw,

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
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Color(0xff73B9BB), width: 1.5),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppImage(
                          path: 'assets/images/card_icon.png',
                          width: 30.w,
                          height: 20.h,
                        ),
                      ),
                      1.pw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '**** **** **** 0256',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,

                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      100.pw,
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
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Color(0xff73B9BB), width: 1.5),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppImage(
                          path: 'assets/images/vaucher.png',
                          width: 30.w,
                          height: 20.h,
                        ),
                      ),
                      1.pw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add vaucher',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,

                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      68.pw,
                      AppButton(
                        width: 101.w,
                        height: 30.h,

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
                  child: AppImage(path: 'assets/images/line.png', height: 1.h),
                ),
              ),
              Positioned(
                top: 430,
                left: 35,
                child: Text(
                  '-REVIEW PAYMENT',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,

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
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    200.pw,
                    Text(
                      '16.100 EGP',
                      style: TextStyle(
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
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    120.pw,
                    Text(
                      'TO BE CALCULATED',
                      style: TextStyle(
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
                child: Divider(thickness: 1, color: Color(0xff73B9BB)),
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
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    180.pw,
                    Text(
                      '16.100 EGP',
                      style: TextStyle(
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
                child: AppButton(
                  buttonText: 'ORDER',

                  onTap: () {},
                  icon: AppImage(
                    path: 'assets/images/cart_suffixicon.png',
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
