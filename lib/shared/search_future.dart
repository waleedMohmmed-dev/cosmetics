import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFuture extends StatefulWidget {
  final String? hintText;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? width;
  final bool? isPassword;
  final double? height;
  final TextInputType? keyboardType;

  final TextEditingController? controller;
  void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  SearchFuture({
    super.key,
    this.hintText,

    this.suffixIcon,
    this.prefixIcon,
    this.width,
    this.isPassword,
    this.controller,
    this.height,
    this.onFieldSubmitted,
    this.validator,
    this.onChanged,
    this.keyboardType,
  });

  @override
  State<SearchFuture> createState() => _SearchFutureState();
}

class _SearchFutureState extends State<SearchFuture> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 56.h,
      width: widget.width ?? 355.w,

      child: TextFormField(
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        keyboardType: widget.keyboardType,

        controller: widget.controller,

        validator: widget.validator,

        autofocus: false,
        obscureText: widget.isPassword ?? false,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontSize: 14.sp,
            color: Color(0xff8E8EA9),
            fontWeight: FontWeight.w400,
          ),
          hintText: widget.hintText ?? "",
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: Color(0xff8E8EA9),
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 18.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: const BorderSide(color: Color(0xff8E8EA9), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(color: Color(0xff8E8EA9), width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          filled: true,
          fillColor: AppColors.secondaryColor,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}
