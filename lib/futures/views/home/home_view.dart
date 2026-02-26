import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/futures/views/home/widget/costum_textfeild.dart';
import 'package:cosmetics/futures/views/home/widget/product_item_widget.dart';
import 'package:cosmetics/futures/views/home/widget/search_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        children: [
          Gap(70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                CostumTextField(
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
              height: 314.h,
              child: Image.asset('assets/images/top_head_line_home.png'),
            ),
          ),
          Gap(24),
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
                  return ProductItemWidget();
                },
              ),
            ),
          ),

          /// products widget
        ],
      ),
    );
  }
}
