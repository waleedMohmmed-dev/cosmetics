import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/ui/app_future.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/network/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'components/item.dart';

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
          70.ph,

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

          10.ph,
          AppSerach(
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
                return _Item();
              },
            ),
          ),
          100.ph,
        ],
      ),
    );
  }
}
