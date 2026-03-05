import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';

import 'package:cosmetics/core/ui/app_future.dart';
import 'package:cosmetics/core/ui/app_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            49.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Row(
                children: [
                  AppInputFuture(
                    hintText: 'Search',
                    controller: _searchController,

                    width: 340.w,
                    height: 50.h,
                    suffixIcon: Icon(Icons.search, color: Color(0xff8E8EA9)),
                  ),
                ],
              ),
            ),

            12.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Container(
                width: 360.w,
                height: 317.h,
                child: AppImage(
                  path: 'assets/images/top_head_line_home.png',
                  width: 364.w,
                  height: 317.h,
                ),
              ),
            ),
            10.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Top rated products',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 100 / 146,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return _item();
                },
              ),
            ),
            100.ph,
          ],
        ),
      ),
    );
  }
}

Widget _item() {
  return Container(
    width: 176.w,
    height: 237.h,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.secondaryColor,
      borderRadius: BorderRadius.circular(8.r),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(3, 10)),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: AppImage(
                path: 'assets/images/product_image.png',
                height: 161,
                width: 169.w,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),

        11.ph,

        Text(
          "Face tint / lip tint",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),

        11.ph,
        Text(
          "\$44.99",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.blueGrey,
          ),
        ),
      ],
    ),
  );
}
