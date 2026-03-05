import 'dart:async';
import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_dailog.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/auth/create_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyView extends StatefulWidget {
  final bool isRegister;
  const VerifyView({super.key, this.isRegister = false});

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController pinCodeController;

  Timer? _timer;

  int _totalSeconds = 40;
  int _remaining = 40;

  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
    _startTimer();
  }

  void _startTimer() {
    _remaining = _totalSeconds;
    _canResend = false;

    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remaining <= 0) {
        _timer?.cancel();
        setState(() {
          _canResend = true;
        });
      } else {
        setState(() {
          _remaining--;
        });
      }
    });
  }

  void _restart() {
    _startTimer();
  }

  String get _formattedTime {
    final m = (_remaining ~/ 60).toString().padLeft(2, '0');
    final s = (_remaining % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  void dispose() {
    _timer?.cancel();
    pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          100.ph,
          Center(
            child: AppImage(
              path: 'assets/images/splash_image.png',
              height: 67.h,
              width: 62.w,
            ),
          ),
          40.ph,
          Text(
            'Verify Code',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          40.ph,
          RichText(
            text: TextSpan(
              text: 'We just sent a 4-digit verification code to\n \n  ',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  text: "+20 1022658997",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Enter the code in the box \n \n below to continue.  ',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          40.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Edit the number',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.buttonColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          20.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: PinCodeTextField(
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
          ),
          43.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _canResend ? _restart : null,
                  child: RichText(
                    text: TextSpan(
                      text: 'Didn’t receive a code?',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "Resend",
                          style: TextStyle(
                            color: _canResend ? Colors.red : Colors.grey,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  _formattedTime,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          113.ph,
          AppButton(
            buttonText: 'Done',
            onTap: () {
              if (widget.isRegister) {
                showDialog(
                  context: context,
                  builder: (_) =>
                      const Dialog(child: AppDailog(isFromCreateAccount: true)),
                );
              } else {
                goTo(page: CreatePasswordView(), canPop: false);
              }
            },
          ),
        ],
      ),
    );
  }
}
