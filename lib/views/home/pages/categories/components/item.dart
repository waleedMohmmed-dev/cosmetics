part of '../view.dart';

class _Item extends StatefulWidget {
  const _Item({super.key});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  final ApiService apiService = ApiService();
  List<CategoryModel> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getDtataCategories();
  }

  Future<void> getDtataCategories() async {
    try {
      final res = await apiService.get('/api/Categories');
      if (res != null) {
        setState(() {
          categories = categoryListFromJson(res);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching categories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(color: AppColors.buttonColor),
      );
    }

    if (categories.isEmpty) {
      return Center(child: Text(' Categories equal null Right now ya bro'));
    }

    return Column(
      children: categories.map((category) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 13.0,
                vertical: 20,
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: AppImage(
                        image: category.imageUrl.isNotEmpty
                            ? category.imageUrl
                            : 'https://via.placeholder.com/64',
                        // placeholder
                        width: 90.w,
                        height: 69.h,
                      ),
                    ),
                  ),
                  12.pw,
                  Text(
                    category.title_en,

                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_right,
                    color: AppColors.primaryColor,
                    size: 25.sp,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(thickness: 1, color: Color(0xffB3B3C180)),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class CategoryModel {
  final int id;
  final String title_en;
  final String title_ar;
  final String imageUrl;

  CategoryModel({
    required this.id,
    required this.title_en,
    required this.imageUrl,
    required this.title_ar,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      title_en: json['title_en'] ?? '',
      title_ar: json['title_ar'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }
}

List<CategoryModel> categoryListFromJson(List<dynamic> jsonList) {
  return jsonList.map((e) => CategoryModel.fromJson(e)).toList();
}
