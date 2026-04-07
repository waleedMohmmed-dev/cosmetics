import 'package:cosmetics/views/home/pages/cart.dart';
import 'package:cosmetics/views/home/pages/categories/view.dart';
import 'package:cosmetics/views/home/pages/profile/view.dart';
import 'package:cosmetics/views/home/veiw.dart';
import 'package:flutter/material.dart';

import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/ui/app_image.dart';

class MianView extends StatefulWidget {
  const MianView({super.key});

  @override
  State<MianView> createState() => _MianViewState();
}

class _MianViewState extends State<MianView> {
  final list = [
    // save data as objects
    _Model(icon: 'assets/icons/home.svg', page: HomePage()),
    _Model(icon: 'assets/icons/categories.svg', page: CategoriesPage()),
    _Model(icon: 'assets/icons/my_cart.svg', page: CartPage()),
    _Model(icon: 'assets/icons/profile.svg', page: ProfilePage()),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex].page,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.symmetric(horizontal: 13),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(25),

          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 7,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: .1),
            ),
          ],
        ),

        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          backgroundColor: Colors.transparent,
          items: List.generate(4, (index) {
            return BottomNavigationBarItem(
              icon: AppImage(
                image: list[index].icon,
                color: currentIndex == index ? AppColors.buttonColor : null,
              ),
              label: '',
            );
          }),
        ),
      ),
    );
  }
}

class _Model {
  final String icon;
  final Widget page;
  _Model({required this.icon, required this.page});
}
