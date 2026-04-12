part of '../veiw.dart';

class _Products extends StatefulWidget {
  const _Products({super.key});

  @override
  State<_Products> createState() => _ProductsState();
}

class _ProductsState extends State<_Products> {
  List<ProductsModel> products = [];
  bool isLoading = true;

  final ApiService apiService = ApiService();

  Future<void> getDtata() async {
    try {
      final res = await apiService.get('/api/Products');

      setState(() {
        products = productListFromJson(res);
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDtata();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.0),
          child: Text(
            'Top rate Products',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ),

        isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.buttonColor),
              )
            : products.isEmpty
            ? const Center(child: Text('Products equal null Right now ya bro'))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: GridView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 100 / 146,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    /// ✅ FIX
                    final product = products[index];

                    return GestureDetector(
                      onTap: () {
                        goTo(
                          page: ProductDetailsScreen(
                            products: product, // ✅ FIX
                          ),
                        );
                      },
                      child: _item(model: product),
                    );
                  },
                ),
              ),
      ],
    );
  }
}

class ProductsModel {
  final int id;
  final String name_en;

  final String description_en;
  final String description_ar;
  final double price;
  final int stock;
  final String imageUrl;
  final int categoryId;
  final String name_ar;

  ProductsModel({
    required this.id,
    required this.name_en,
    required this.name_ar,
    required this.description_en,
    required this.description_ar,
    required this.price,
    required this.stock,
    required this.imageUrl,
    required this.categoryId,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'] ?? 0,
      name_en: json['name_en'] ?? '',
      name_ar: json['name_ar'] ?? '',
      description_en: json['description_en'] ?? '',
      description_ar: json['description_ar'] ?? '',
      // name: json['name'] ?? '',
      // description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      stock: json['stock'] ?? 0,
      imageUrl: json['image_url'] ?? '',
      categoryId: json['categoryId'] ?? 0,
    );
  }
}

List<ProductsModel> productListFromJson(List<dynamic> jsonList) {
  return jsonList.map((e) => ProductsModel.fromJson(e)).toList();
}
