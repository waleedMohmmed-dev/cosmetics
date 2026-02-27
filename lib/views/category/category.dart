import 'package:cosmetics/core/constans/app_colors.dart';

import 'package:cosmetics/shared/costum_textfeild.dart';
import 'package:cosmetics/shared/search_future.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final _searchForCategoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,

      body: Column(
        children: [
          Gap(80),
          Center(
            child: Text(
              'Categories',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24.sp,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Gap(24),

          SearchFuture(
            hintText: 'Search',
            controller: _searchForCategoryController,
            width: 340.w,
            height: 50.h,
            suffixIcon: Icon(Icons.search_sharp, color: Color(0xff8E8EA9)),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return _item();
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _item() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/category_item.png',
              width: 64.w,
              height: 69.h,
            ),
            Gap(12),
            Text(
              'Bundles',
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                color: AppColors.primaryColor,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_right,
              color: AppColors.primaryColor.withOpacity(1),
              size: 25.sp,
            ),
          ],
        ),
      ),

      Divider(thickness: 1, color: Color(0xffB3B3C180)),
    ],
  );
}
