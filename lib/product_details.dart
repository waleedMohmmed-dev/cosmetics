import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/home/veiw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductsModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product; // ✅ simplify

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
                borderRadius: BorderRadiusGeometry.circular(10.r),
                child: AppImage(
                  image: product.imageUrl, // ✅ FIX
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name_en, // ✅ FIX
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '\$${product.price.toStringAsFixed(2)}', // ✅ FIX
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.buttonColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'This makeup product is designed to enhance your natural beauty with a flawless and radiant finish It features a lightweight formula that feels comfortable on the skin throughout the day The texture is smooth and easy to apply making it perfect for both beginners and professionals It blends effortlessly without leaving streaks or patches The formula adapts to different skin types ensuring a balanced and even look It provides buildable coverage allowing you to go from natural to full glam easily  skin visually It offers a balance between coverage and comfort It is designed to be both effective and gentle It gives you confidence with every application It is a must have essential for everyday beauty It combines performance comfort and style!! ', // ✅ FIX
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
