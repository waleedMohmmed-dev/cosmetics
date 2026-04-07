import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppVerifyCode extends StatefulWidget {
  const AppVerifyCode({super.key});

  @override
  State<AppVerifyCode> createState() => _AppVerifyCodeState();
}

class _AppVerifyCodeState extends State<AppVerifyCode> {
  late TextEditingController pinCodeController;
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: PinCodeTextField(
        cursorColor: Color(0xff101010).withValues(alpha: .22),
        hintCharacter: '_',
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        cursorHeight: 16,
        appContext: context,
        length: 4,
        controller: pinCodeController,
        obscureText: false,
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        textStyle: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
        ),
        pinTheme: PinTheme(
          selectedBorderWidth: 1,
          fieldWidth: 66.w,
          fieldHeight: 60.h,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8.r),
          selectedColor: Color(0xffD75D72),
          selectedFillColor: AppColors.secondaryColor,
          activeColor: Color(0xffD75D72),
          activeFillColor: AppColors.secondaryColor,
          inactiveColor: Color(0xff8989925C),
          inactiveFillColor: AppColors.secondaryColor,
        ),
        onChanged: (value) {},
        onCompleted: (value) {},
      ),
    );
  }
}
