part of '../veiw.dart';

class _Offers extends StatefulWidget {
  const _Offers({super.key});

  @override
  State<_Offers> createState() => _OffersState();
}

class _OffersState extends State<_Offers> {
  final ApiService apiService = ApiService();
  List<OffersModel> list = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getOffersData();
  }

  Future<void> getOffersData() async {
    try {
      final res = await apiService.get('/api/Sliders');

      setState(() {
        list = (res as List).map((e) => OffersModel.fromJson(e)).toList();
        isLoading = false;
      });
    } catch (e) {
      debugPrint("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.buttonColor),
      );
    }

    if (list.isEmpty) {
      return const Center(child: Text("No offers"));
    }

    return CarouselSlider(
      options: CarouselOptions(autoPlay: true, viewportFraction: 1),
      items: List.generate(list.length, (index) {
        final model = list[index];

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AppImage(
                  image: model.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Container(
                  padding: const EdgeInsets.all(18),
                  color: const Color(0xffE9DCD3).withOpacity(0.8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${model.discountPercent}% OFF\nCODE: ${model.couponCode}",
                              style: const TextStyle(
                                color: Color(0xff62322D),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          AppImage(
                            image: "assets/images/offer_icon.png",
                            width: 54,
                            height: 54,
                          ),
                        ],
                      ),
                      8.ph,
                      Row(
                        children: [
                          const AppImage(
                            image: "assets/images/offer_icon.png",
                            width: 54,
                            height: 54,
                          ),
                          Expanded(
                            child: Text(
                              "${model.description_title1_en}\n${model.description_title2_en}",
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                color: Color(0xff434C6D),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

/// model
class OffersModel {
  final int id;
  final String couponCode;
  final int discountPercent;
  // final String descriptionTitle1;
  // final String descriptionTitle2;
  final String imageUrl;
  final String description_title1_en;
  final String description_title1_ar;
  final String description_title2_en;
  final String description_title2_ar;

  OffersModel({
    required this.id,
    required this.couponCode,
    required this.discountPercent,
    // required this.descriptionTitle1,
    // required this.descriptionTitle2,
    required this.imageUrl,
    required this.description_title1_en,
    required this.description_title1_ar,
    required this.description_title2_en,
    required this.description_title2_ar,
  });

  factory OffersModel.fromJson(Map<String, dynamic> json) {
    return OffersModel(
      id: json['id'] ?? 0,
      couponCode: json['coupon_code'] ?? '',
      discountPercent: json['discount_percent'] ?? 0,
      // descriptionTitle1: json['descriptionTitle1'] ?? '',
      // descriptionTitle2: json['descriptionTitle2'] ?? '',
      imageUrl: json['image_url'] ?? '',
      description_title1_en: json['description_title1_en'] ?? '',
      description_title1_ar: json['description_title1_ar'] ?? '',
      description_title2_en: json['description_title2_en'] ?? '',
      description_title2_ar: json['description_title2_ar'] ?? '',
    );
  }
}
