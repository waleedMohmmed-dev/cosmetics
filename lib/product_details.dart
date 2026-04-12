import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/home/models/cart_mode.dart';
import 'package:cosmetics/views/home/repo/cart_repo.dart';
import 'package:cosmetics/views/home/veiw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductsModel products;

  const ProductDetailsScreen({super.key, required this.products});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<Color> colors = const [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.pink,
    Colors.brown,
  ];

  int selectedIndex = 0;
  final CartRepo cartRepo = CartRepo();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.products;

    return Scaffold(
      appBar: AppBar(title: const Text('Product Details'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 400.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: AppImage(image: product.imageUrl, fit: BoxFit.cover),
              ),
            ),

            13.ph,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name_en,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  3.ph,

                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.buttonColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  3.ph,

                  const Text(
                    'Colors',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  3.ph,

                  SizedBox(
                    height: 50.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: colors.length,
                      separatorBuilder: (_, __) => SizedBox(width: 10.w),
                      itemBuilder: (context, index) {
                        final color = colors[index];
                        final isSelected = index == selectedIndex;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            width: 40.w,
                            height: 40.w,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primaryColor
                                    : Colors.grey.shade300,
                                width: isSelected ? 3 : 1,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  7.ph,

                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Aliquam erat volutpat. Nulla facilisi. Aliquam erat volutpat.',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  22.ph,
                  Center(
                    child: AppButton(
                      text: 'Add To Cart',
                      width: double.infinity,
                      widget: isLoading
                          ? CircularProgressIndicator()
                          : Icon(Icons.card_travel),

                      /// For Cart
                      /// !!!111
                      onTap: () async {
                        setState(() => isLoading = true);

                        final cartItem = AddToCart(
                          productId: product.id,
                          title: product.name_en,
                          imageUrl: product.imageUrl,
                          price: product.price,
                          quantity: 1,
                        );

                        await cartRepo.addToCart(cartItem);

                        setState(() => isLoading = false);

                        showMsg(
                          'Product added to cart successfully',
                          isErorr: false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
