import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/home/pages/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              AppImage(
                path: 'assets/images/top_head_profile.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Positioned(
                bottom: -48.h,
                child: Container(
                  width: 96.w,
                  height: 96.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    image: DecorationImage(
                      image: AssetImage('assets/images/profile_avater.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),

          60.ph,

          Text(
            'Sara Samer Talaat',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),

          40.ph,

          _item(() {}, 'Edit Info', 'assets/icons/edit_info.svg'),

          40.ph,

          _item(
            () {
              goTo(page: CheckoutPage());
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (c) => const CheckoutPage()),
              // );
            },
            'Order History',
            'assets/icons/order_history.svg',
          ),
          42.ph,

          _item(() {}, 'Wallet', 'assets/icons/wallet.svg'),
          42.ph,

          _item(() {}, 'Settings', 'assets/icons/settings.svg'),
          42.ph,

          _item(() {}, 'Voucher', 'assets/icons/voucher.svg'),
          42.ph,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            child: Row(
              children: [
                Icon(Icons.logout, color: Colors.red.shade700),
                10.pw,
                InkWell(
                  onTap: () {
                    goTo(page: LoginView(), canPop: false);
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _item(VoidCallback onTap, String text, String iconPath) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 13.w),
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          AppImage(
            path: iconPath,
            width: 17.w,
            height: 17.h,
            color: AppColors.primaryColor,
          ),
          10.pw,
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_right, size: 24.sp, color: AppColors.primaryColor),
        ],
      ),
    ),
  );
}
