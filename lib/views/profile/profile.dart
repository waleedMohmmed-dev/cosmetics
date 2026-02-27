import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/views/chekout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/top_head_profile.png',
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

          Gap(60),

          Text(
            'Sara Samer Talaat',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),

          Gap(40),

          _item(() {}, 'Edit Info', 'assets/svgs/edit_info.svg'),

          Gap(42),

          _item(
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => const CheckoutView()),
              );
            },
            'Order History',
            'assets/svgs/order_history.svg',
          ),
          Gap(42),

          _item(() {}, 'Wallet', 'assets/svgs/wallet.svg'),
          Gap(42),

          _item(() {}, 'Settings', 'assets/svgs/settings.svg'),
          Gap(42),

          _item(() {}, 'Voucher', 'assets/svgs/voucher.svg'),
          Gap(42),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            child: Row(
              children: [
                Icon(Icons.logout, color: Colors.red.shade700),
                Gap(10),
                Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red.shade700,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
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
    child: GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 17.w,
            height: 17.h,
            color: AppColors.primaryColor,
          ),

          Gap(10),
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
