import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/views/cart/cart.dart';
import 'package:cosmetics/views/category/category.dart';
import 'package:cosmetics/views/home/home.dart';
import 'package:cosmetics/views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeView(),
    CategoryView(),
    CartView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[selectedIndex],

          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              height: 64.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 16,
                    offset: Offset(1, 0),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem('assets/svgs/home_icon.svg', 0),
                  _buildNavItem('assets/svgs/categories.svg', 1),
                  _buildNavItem('assets/svgs/my_cart.svg', 2),
                  _buildNavItem('assets/svgs/profile.svg', 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String iconPath, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: SvgPicture.asset(
        iconPath,
        color: isSelected ? AppColors.buttonColor : Colors.grey,
        width: 20.w,
        height: 20.h,
      ),
    );
  }
}
