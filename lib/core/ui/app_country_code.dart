import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/network/api_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCountryCode extends StatefulWidget {
  /// send data alwyas
  final ValueChanged<String> onCountryCodeChanged;
  const AppCountryCode({super.key, required this.onCountryCodeChanged});

  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  late String? selectedCountryCode;

  List<CountryModel>? list;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    getData();
  }

  /// Country Codes list
  Future<void> getData() async {
    final res = await apiService.get('/api/Countries');

    list = (res as List).map((e) => CountryModel.fromJson(e)).toList();

    selectedCountryCode = list!.first.code;

    ///
    widget.onCountryCodeChanged.call(selectedCountryCode!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff0ff8E8EA9), width: .5),
        borderRadius: BorderRadius.circular(8),
      ),

      child: list == null
          ? Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 20.0,
              ),
              child: CircularProgressIndicator(color: AppColors.buttonColor),
            )
          : DropdownButton<String>(
              value: selectedCountryCode,
              padding: EdgeInsets.symmetric(horizontal: 13.r),

              items: list!
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text('${e.code}'),
                      value: e.code,
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                selectedCountryCode = value;
                widget.onCountryCodeChanged.call(selectedCountryCode!);
                setState(() {});
              },
            ),
    );
  }
}

class CountryModel {
  final int id;
  final String code;
  final String name_en;
  final String name_ar;

  CountryModel({
    required this.id,
    required this.code,
    required this.name_ar,
    required this.name_en,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      code: json['code'],
      name_ar: json['name_ar'],
      name_en: json['name_en'],
    );
  }

  static List<CountryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => CountryModel.fromJson(e)).toList();
  }
}
