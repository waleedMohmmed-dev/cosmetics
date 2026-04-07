import 'package:carousel_slider/carousel_slider.dart';
import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/ui/app_future.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/network/api_service.dart';
import 'package:cosmetics/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'components/offers.dart';
part 'components/products.dart';

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
                  AppSerach(
                    hintText: 'Search',
                    controller: _searchController,
                    suffixIcon: Icon(Icons.search, color: Color(0xff8E8EA9)),
                  ),
                ],
              ),
            ),
            14.ph,
            _Offers(),
            8.ph,
            _Products(),
            100.ph,
          ],
        ),
      ),
    );
  }
}

/// !Item
class _item extends StatelessWidget {
  final ProductsModel model;
  const _item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 176.w,
      height: 237.h,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(3, 10),
          ),
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
                  image: model.imageUrl,
                  height: 161.h,
                  width: 169.w,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),

          6.ph,

          Text(
            model.name_en,
            // "Face tint / lip tint",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
          2.ph,
          Text(
            '\$ ${model.price}',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
              color: Colors.blueGrey,
            ),
          ),

          Row(
            children: [
              Text(
                "% ${model.stock.toString()}",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueGrey,
                ),
              ),
              Spacer(),
              Text(
                model.id.toString(),
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
