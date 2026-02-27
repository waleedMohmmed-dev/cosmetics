import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/shared/costum_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFeild extends StatefulWidget {
  SearchFeild({super.key, this.onChanged, required this.controller});
  void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  State<SearchFeild> createState() => _SearchFeildState();
}

class _SearchFeildState extends State<SearchFeild> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 03,
      borderRadius: BorderRadius.circular(20.r),
      child: CostumTextField(
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
