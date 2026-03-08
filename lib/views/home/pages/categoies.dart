import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';

import 'package:cosmetics/core/ui/app_future.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final _searchForCategoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          80.ph,

          Center(
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 24.sp,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          24.ph,
          AppInputFuture(
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
          100.ph,
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
            AppImage(
              path: 'assets/images/category_item.png',
              width: 64.w,
              height: 69.h,
            ),
            12.ph,
            Text(
              'Bundles',
              style: TextStyle(
                fontSize: 14.sp,

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
