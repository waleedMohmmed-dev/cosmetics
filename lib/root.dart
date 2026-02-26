import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/futures/views/cart/cart_view.dart';
import 'package:cosmetics/futures/views/category/category_view.dart';
import 'package:cosmetics/futures/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int selectedIndex = 0;

  final List<Widget> pages = const [HomeView(), CategoryView(), CartView()];

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
                  _buildNavItem(Icons.home_outlined, 0),
                  _buildNavItem(Icons.grid_view, 1),
                  _buildNavItem(Icons.shopping_cart_outlined, 2),
                  _buildNavItem(Icons.person_outline, 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Icon(
        icon,
        size: 28,
        color: isSelected ? AppColors.buttonColor : Colors.grey,
      ),
    );
  }
}
