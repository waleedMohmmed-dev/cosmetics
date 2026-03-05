import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/home/pages/cart.dart';
import 'package:cosmetics/views/home/pages/categoies.dart';

import 'package:cosmetics/views/home/pages/profile.dart';
import 'package:cosmetics/views/home/pages/veiw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  /// mecanzme type infreence
  final pages = [
    const HomePage(),
    const CategoriesPage(),
    CartPage(),
    const ProfilePage(),
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
                  _buildNavItem('assets/icons/home.svg', 0),
                  _buildNavItem('assets/icons/categories.svg', 1),
                  _buildNavItem('assets/icons/my_cart.svg', 2),
                  _buildNavItem('assets/icons/profile.svg', 3),
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
      child: AppImage(
        path: iconPath,
        color: isSelected ? AppColors.buttonColor : Colors.grey,
        width: 20.w,
        height: 20.h,
      ),
    );
  }
}
/// resso coder high flutter 