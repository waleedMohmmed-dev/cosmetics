import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/home/repo/cart_manegar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartManager = CartManager();

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
                  image: 'assets/icons/my_cart.svg',
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.buttonColor,
                ),
              ),
            ],
          ),
        ],
      ),

      body: cartManager.items.isEmpty
          ? const Center(child: Text("Cart is empty"))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      /// Send length items to cart
                      'You have ${cartManager.items.length} products in your cart',
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
                      itemCount: cartManager.items.length,
                      itemBuilder: (context, index) {
                        final item = cartManager.items[index];

                        return _item(
                          name: item.title,
                          image: item.imageUrl,
                          price: item.price.toString(),
                          number: item.quantity,

                          onAdd: () {
                            setState(() {
                              cartManager.increase(index);
                            });
                          },
                          onMinus: () {
                            setState(() {
                              cartManager.decrease(index);
                            });
                          },
                        );
                      },
                    ),
                  ),

                  20.ph,
                ],
              ),
            ),
    );
  }
}

Widget _item({
  required String name,
  required String image,
  required String price,

  required int number,
  required Function() onAdd,
  required Function() onMinus,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10.r),
              child: AppImage(
                image: image,
                width: 102.w,
                height: 102.h,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  7.ph,
                  Text(
                    'Description of Products',

                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  15.ph,
                  Text(
                    '$price EGP',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
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
          border: Border.all(color: const Color(0xff8E8EA9)),
        ),
        child: Row(
          children: [
            9.pw,

            IconButton(
              onPressed: onMinus,
              icon: SvgPicture.asset('assets/icons/minus.svg', width: 20.w),
            ),
            13.pw,
            Text(
              number.toString(),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),

            const Spacer(),

            InkWell(
              onTap: onAdd,
              child: SvgPicture.asset(
                'assets/icons/add.svg',
                width: 16.w,
                height: 15.h,
              ),
            ),

            10.pw,
          ],
        ),
      ),

      const Divider(thickness: 1, color: Color(0xffB3B3C180)),
    ],
  );
}
