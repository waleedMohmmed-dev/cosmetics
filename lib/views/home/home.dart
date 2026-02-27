import 'package:cosmetics/core/constans/app_colors.dart';

import 'package:cosmetics/shared/search_future.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        children: [
          Gap(70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Row(
              children: [
                SearchFuture(
                  hintText: 'Search',
                  controller: _searchController,

                  width: 340.w,
                  height: 50.h,
                  suffixIcon: Icon(Icons.search, color: Color(0xff8E8EA9)),
                ),
              ],
            ),
          ),
          Gap(9),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Container(
              width: 360.w,
              height: 317.h,
              child: Image.asset(
                'assets/images/top_head_line_home.png',
                width: 364.w,
                height: 317.h,
              ),
            ),
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Top rated products',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: GridView.builder(
                itemCount: 4,
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
          ),
        ],
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
      borderRadius: BorderRadius.circular(8),
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
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/product_image.png',
                height: 161,
                width: 169.w,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),

        Gap(11),

        Text(
          "Face tint / lip tint",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
            fontFamily: 'Montserrat',
          ),
        ),

        Gap(11),
        Text(
          "\$44.99",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.blueGrey,
            fontFamily: 'Montserrat',
          ),
        ),
      ],
    ),
  );
}
