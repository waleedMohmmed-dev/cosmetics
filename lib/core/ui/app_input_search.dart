import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputSearch extends StatefulWidget {
  AppInputSearch({super.key, this.onChanged, required this.controller});
  void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  State<AppInputSearch> createState() => _AppInputSearchState();
}

class _AppInputSearchState extends State<AppInputSearch> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 03,
      borderRadius: BorderRadius.circular(20.r),
      child: AppInput(
        onChanged: widget.onChanged,
        controller: widget.controller,

        width: 340.w,
        hintText: 'Search ',
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.primaryColor,
          size: 30.sp,
        ),
      ),
    );
  }
}
