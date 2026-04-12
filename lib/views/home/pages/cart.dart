import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/home/models/cart_mode.dart';
import 'package:cosmetics/views/home/repo/cart_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartRepo cartRepo = CartRepo();

  // ✅ FIXED TYPE
  GetCart? cart;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCart();
  }

  Future<void> fetchCart() async {
    try {
      final res = await cartRepo.getCart();

      setState(() {
        cart = res;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  void onAdd(int index) {
    final item = cart!.items[index];

    setState(() {
      cart!.items[index] = AddToCart(
        productId: item.productId,
        title: item.title,
        imageUrl: item.imageUrl,
        price: item.price,
        quantity: item.quantity + 1,
      );
    });
  }

  void onMinus(int index) {
    final item = cart!.items[index];

    if (item.quantity <= 1) return;

    setState(() {
      cart!.items[index] = AddToCart(
        productId: item.productId,
        title: item.title,
        imageUrl: item.imageUrl,
        price: item.price,
        quantity: item.quantity - 1,
      );
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

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : (cart == null || cart!.items.isEmpty)
          ? const Center(child: Text("Cart is empty"))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You have ${cart!.items.length} products in your cart',
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
                      itemCount: cart!.items.length,
                      itemBuilder: (context, index) {
                        final item = cart!.items[index];

                        return _item(
                          name: item.title,
                          image: item.imageUrl,
                          price: item.price.toString(),
                          number: item.quantity,
                          onAdd: () => onAdd(index),
                          onMinus: () => onMinus(index),
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
            AppImage(image: image, width: 102.w, height: 102.h),

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
                    'Product description',
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
            10.pw,

            IconButton(
              onPressed: onMinus,
              icon: SvgPicture.asset('assets/icons/minus.svg', width: 20.w),
            ),

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

            15.pw,
          ],
        ),
      ),

      const Divider(thickness: 1, color: Color(0xffB3B3C180)),
    ],
  );
}
// import 'package:cosmetics/core/exeptions/spacing.dart';
// import 'package:cosmetics/core/logic/app_colors.dart';
// import 'package:cosmetics/core/ui/app_image.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   late List<int> quantitiys;

//   @override
//   void initState() {
//     super.initState();
//     quantitiys = List<int>.filled(10, 1);
//   }

//   void onAdd(int index) {
//     setState(() {
//       quantitiys[index]++;
//     });
//   }

//   void onMinus(int index) {
//     setState(() {
//       if (quantitiys[index] > 1) {
//         quantitiys[index]--;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Row(
//             children: [
//               Text(
//                 'My Cart',
//                 style: TextStyle(
//                   color: AppColors.primaryColor,
//                   fontSize: 23.sp,

//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               100.pw,
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10.w),
//                 child: AppImage(
//                   image: 'assets/icons/my_cart.svg',
//                   width: 24.w,
//                   height: 24.h,
//                   color: AppColors.buttonColor,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             Align(
//               alignment: AlignmentGeometry.centerLeft,
//               child: Text(
//                 'You have 4 products in your cart',
//                 style: TextStyle(
//                   color: AppColors.primaryColor,
//                   fontSize: 12.sp,

//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//             30.ph,
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return _item(
//                     number: quantitiys[index],
//                     onAdd: () => onAdd(index),
//                     onMinus: () => onMinus(index),
//                   );
//                 },
//               ),
//             ),
//             100.ph,
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CartItemWidget extends StatelessWidget {
//   final CartItemModel item;
//   final int number;
//   final VoidCallback onAdd;
//   final VoidCallback onMinus;

//   const CartItemWidget({
//     super.key,
//     required this.item,
//     required this.number,
//     required this.onAdd,
//     required this.onMinus,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 6),
//           child: Row(
//             children: [
//               AppImage(image: item.image, width: 102.w, height: 102.h),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       item.name,
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                     7.ph,
//                     Text(
//                       item.desc,
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                     15.ph,
//                     Text(
//                       '${item.price} EGP',
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                     10.ph,
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           width: 142.w,
//           height: 42.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.r),
//             border: Border.all(color: Color(0xff8E8EA9)),
//           ),
//           child: Row(
//             children: [
//               10.pw,
//               IconButton(
//                 onPressed: onMinus,
//                 icon: SvgPicture.asset('assets/icons/minus.svg', width: 20.w),
//               ),
//               14.pw,
//               Text(
//                 number.toString(),
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w600,
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//               Spacer(),
//               InkWell(
//                 onTap: onAdd,
//                 child: SvgPicture.asset(
//                   'assets/icons/add.svg',
//                   width: 16.w,
//                   height: 15.h,
//                 ),
//               ),
//               15.pw,
//             ],
//           ),
//         ),
//         Divider(thickness: 1, color: Color(0xffB3B3C180)),
//       ],
//     );
//   }
// }

// class CartItemModel {
//   final String name;
//   final String desc;
//   final double price;
//   final String image;

//   CartItemModel({
//     required this.name,
//     required this.desc,
//     required this.price,
//     required this.image,
//   });
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// // Replace these imports with your actual project files
// import 'package:cosmetics/core/exeptions/spacing.dart';
// import 'package:cosmetics/core/logic/app_colors.dart';
// import 'package:cosmetics/core/ui/app_image.dart';

// class CartItemModel {
//   final String name;
//   final String desc;
//   final double price;
//   final String image;

//   CartItemModel({
//     required this.name,
//     required this.desc,
//     required this.price,
//     required this.image,
//   });
// }

// class CartItemWidget extends StatelessWidget {
//   final CartItemModel item;
//   final int number;
//   final VoidCallback onAdd;
//   final VoidCallback onMinus;

//   const CartItemWidget({
//     super.key,
//     required this.item,
//     required this.number,
//     required this.onAdd,
//     required this.onMinus,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 6),
//           child: Row(
//             children: [
//               AppImage(image: item.image, width: 102.w, height: 102.h),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       item.name,
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                     7.ph,
//                     Text(
//                       item.desc,
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                     15.ph,
//                     Text(
//                       '${item.price} EGP',
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                     10.ph,
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           width: 142.w,
//           height: 42.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.r),
//             border: Border.all(color: Color(0xff8E8EA9)),
//           ),
//           child: Row(
//             children: [
//               10.pw,
//               IconButton(
//                 onPressed: onMinus,
//                 icon: SvgPicture.asset('assets/icons/minus.svg', width: 20.w),
//               ),
//               14.pw,
//               Text(
//                 number.toString(),
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w600,
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//               Spacer(),
//               InkWell(
//                 onTap: onAdd,
//                 child: SvgPicture.asset(
//                   'assets/icons/add.svg',
//                   width: 16.w,
//                   height: 15.h,
//                 ),
//               ),
//               15.pw,
//             ],
//           ),
//         ),
//         Divider(thickness: 1, color: Color(0xffB3B3C180)),
//       ],
//     );
//   }
// }

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   late List<int> quantities;

//   final List<CartItemModel> cartItems = [
//     CartItemModel(
//       name: ' Lipstick ',
//       desc: ' Long lasting matte lipstick',
//       price: 350,
//       image: 'assets/images/one.jpg',
//     ),
//     CartItemModel(
//       name: 'Maskara',
//       desc: 'Long lasting matte lipstick',
//       price: 200,
//       image: 'assets/images/tow.png',
//     ),
//     CartItemModel(
//       name: 'Face Powder',
//       desc: 'Smooth finish powder',
//       price: 77,
//       image: 'assets/images/three.png',
//     ),

//     CartItemModel(
//       name: 'Hand Cream',
//       desc: 'Smooth finish powder',
//       price: 78,
//       image: 'assets/images/fourth.png',
//     ),
//     CartItemModel(
//       name: 'Face Powder',
//       desc: 'Smooth finish powder',
//       price: 66,
//       image: 'assets/images/five.png',
//     ),
//     CartItemModel(
//       name: 'Lipstick Powder',
//       desc: 'Smooth finish powder',
//       price: 40,
//       image: 'assets/images/sex.png',
//     ),
//     CartItemModel(
//       name: 'Red Lipstick',
//       desc: 'Smooth finish powder',
//       price: 90,
//       image: 'assets/images/siven.png',
//     ),
//     CartItemModel(
//       name: 'San Block Cream',
//       desc: 'Smooth finish powder',
//       price: 55,
//       image: 'assets/images/none.png',
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     quantities = List<int>.filled(cartItems.length, 1);
//   }

//   void onAdd(int index) {
//     setState(() {
//       quantities[index]++;
//     });
//   }

//   void onMinus(int index) {
//     setState(() {
//       if (quantities[index] > 1) {
//         quantities[index]--;
//       }
//     });
//   }

//   double get totalPrice {
//     double total = 0;
//     for (int i = 0; i < cartItems.length; i++) {
//       total += cartItems[i].price * quantities[i];
//     }
//     return total;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'My Cart',
//           style: TextStyle(
//             color: AppColors.primaryColor,
//             fontSize: 23.sp,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.w),
//             child: AppImage(
//               image: 'assets/icons/my_cart.svg',
//               width: 24.w,
//               height: 24.h,
//               color: AppColors.buttonColor,
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'You have ${cartItems.length} products in your cart',
//                 style: TextStyle(
//                   color: AppColors.primaryColor,
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//             30.ph,
//             Expanded(
//               child: ListView.builder(
//                 itemCount: cartItems.length,
//                 itemBuilder: (context, index) {
//                   return CartItemWidget(
//                     item: cartItems[index],
//                     number: quantities[index],
//                     onAdd: () => onAdd(index),
//                     onMinus: () => onMinus(index),
//                   );
//                 },
//               ),
//             ),
//             Divider(thickness: 1),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Total:',
//                     style: TextStyle(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.primaryColor,
//                     ),
//                   ),

//                   Text(
//                     '${totalPrice.toStringAsFixed(1)} EGP',
//                     style: TextStyle(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.primaryColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
