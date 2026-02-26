import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/futures/views/category/widget/category_item_widget.dart';
import 'package:cosmetics/futures/views/home/widget/costum_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final TextEditingController _searchForCategoryController =
      TextEditingController();
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

          CostumTextField(
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
                return CategoryItemWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
