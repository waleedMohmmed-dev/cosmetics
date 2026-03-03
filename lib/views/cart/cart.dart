import 'package:cosmetics/core/constans/app_colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
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
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        actions: [
          Row(
            children: [
              Text(
                'My Cart',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 23.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(100),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SvgPicture.asset(
                  'assets/icons/svgs/cart_icon.svg',
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
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Gap(30),
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
            Gap(140),
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
            Image.asset(
              'assets/images/cart_product.png',
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
                      fontFamily: 'Montserrat',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Gap(7),
                  Text(
                    'Ultra rich mascara for lashes',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Gap(15),
                  Text(
                    '350 EGP',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Gap(10),
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
            Gap(13),
            InkWell(
              onTap: onMinus,
              child: SvgPicture.asset('assets/svgs/minus.svg', width: 20.w),
            ),
            Gap(32),
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
                'assets/svgs/add.svg',
                width: 16.w,
                height: 15.h,
              ),
            ),
            Gap(15),
          ],
        ),
      ),
      Divider(thickness: 1, color: Color(0xffB3B3C180)),
    ],
  );
}
