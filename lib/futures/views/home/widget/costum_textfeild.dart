import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CostumTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? width;
  final bool? isPassword;
  final double? height;

  final TextEditingController? controller;
  void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  CostumTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.width,
    this.isPassword,
    this.controller,
    this.height,
    this.onFieldSubmitted,
    this.validator,
    this.onChanged,
  });

  @override
  State<CostumTextField> createState() => _CostumTextFieldState();
}

class _CostumTextFieldState extends State<CostumTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 56.h,
      width: widget.width ?? 355.w,

      child: TextFormField(
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,

        controller: widget.controller,

        validator: widget.validator,

        autofocus: false,
        obscureText: widget.isPassword ?? false,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText ?? "",
          hintStyle: TextStyle(
            fontSize: 15.sp,
            color: Color(0xff8E8EA9),
            fontWeight: FontWeight.w500,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 18.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: Color(0xff8E8EA9), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: Color(0xff8E8EA9), width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
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
