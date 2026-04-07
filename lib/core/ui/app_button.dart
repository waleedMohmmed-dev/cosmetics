import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? width;
  final double? height;
  final double? bordersRadius;
  final double? side;
  final Color? textColor;
  final double? fontSize;
  final void Function()? onTap;
  final Widget? icon;
  final Widget? tralingIcon;
  final bool isLoding;

  const AppButton({
    super.key,
    this.text,
    this.color,
    this.side,
    this.width,
    this.height,
    this.bordersRadius,
    this.fontSize,
    this.textColor,
    this.onTap,
    this.icon,
    this.tralingIcon,
    this.isLoding = false,
  });

  @override
  Widget build(BuildContext context) {
    // if (isLoding) {
    //   return Center(
    //     child: CupertinoActivityIndicator(color: AppColors.buttonColor),
    //   );
    // }
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.buttonColor,
        shape: RoundedRectangleBorder(
          side:
              BorderSide(color: Color(0xffCCCCCC), width: 1) ??
              const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(bordersRadius ?? 60.r),
        ),
        fixedSize: Size(width ?? 268.w, height ?? 65.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text ?? "",
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: fontSize ?? 15.sp,
            ),
          ),
          10.pw,
          icon ?? const SizedBox.shrink(),
          tralingIcon ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
