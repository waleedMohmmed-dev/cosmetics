import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/ui/app_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<int> quantitiys;

  @override
  void initState() {
    super.initState();
    quantitiys = List<int>.filled(10, 1);
  }

  void onAdd(int index) {
    setState(() {
      quantitiys[index]++;
    });
  }

  void onMinus(int index) {
    setState(() {
      if (quantitiys[index] > 1) {
        quantitiys[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Text(
                'My Cart',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 23.sp,

                  fontWeight: FontWeight.bold,
                ),
              ),
              100.pw,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: AppImage(
                  path: 'assets/icons/svgs/cart_icon.svg',
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                'You have 4 products in your cart',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12.sp,

                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            30.ph,
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _item(
                    number: quantitiys[index],
                    onAdd: () => onAdd(index),
                    onMinus: () => onMinus(index),
                  );
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

Widget _item({
  required int number,
  required Function() onAdd,
  required Function() onMinus,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            AppImage(
              path: 'assets/images/cart_product.png',
              width: 102.w,
              height: 102.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Note Cosmetics',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  7.ph,
                  Text(
                    'Ultra rich mascara for lashes',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  15.ph,
                  Text(
                    '350 EGP',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  10.ph,
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 142.w,
        height: 42.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Color(0xff8E8EA9)),
        ),
        child: Row(
          children: [
            13.pw,
            InkWell(
              onTap: onMinus,
              child: SvgPicture.asset('assets/icons/minus.svg', width: 20.w),
            ),
            32.pw,
            Text(
              number.toString(),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            Spacer(),
            InkWell(
              onTap: onAdd,
              child: SvgPicture.asset(
                'assets/icons/add.svg',
                width: 16.w,
                height: 15.h,
              ),
            ),
            15.pw,
          ],
        ),
      ),
      Divider(thickness: 1, color: Color(0xffB3B3C180)),
    ],
  );
}
