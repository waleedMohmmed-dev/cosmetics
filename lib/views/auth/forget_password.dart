import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/core/ui/app_back.dart';
import 'package:cosmetics/core/ui/app_country_code.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/network/api_service.dart';
import 'package:cosmetics/views/auth/data/repo/auth_repo.dart';
import 'package:cosmetics/views/auth/verify.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordView> {
  final phoneController = TextEditingController();

  final AuthRepo authRepo = AuthRepo();
  final ApiService apiService = ApiService();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? _selectedCountyCode;
  @override
  void dispose() {
    phoneController.dispose();

    super.dispose();
  }

  /// forget password method
  Future<void> forgetPassword() async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        final user = await authRepo.forgetPassword(
          _selectedCountyCode.toString(),
          phoneController.text.trim(),
        );
        if (user != null) {
          goTo(page: VerifyView(), canPop: true);

          setState(() => isLoading = false);
        }
      } catch (e) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            40.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  AppBack(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            40.ph,

            Center(
              child: AppImage(
                image: 'assets/images/splash_image.png',
                height: 62.sp,
                width: 67.sp,
              ),
            ),
            40.ph,

            Text(
              'Forget Password',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            40.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Text(
                'Please enter your phone number below \t \t   to recovery your password.',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.labelColor,
                ),
              ),
            ),
            40.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                children: [
                  AppCountryCode(
                    onCountryCodeChanged: (value) {
                      _selectedCountyCode = value;
                    },
                  ),
                  5.pw,
                  AppInput(
                    labelText: 'Phone Number',
                    height: 46.h,
                    width: 266.w,

                    controller: phoneController,
                    validator: InputValidator.phoneValidator,
                  ),
                ],
              ),
            ),
            55.ph,
            isLoading
                ? CupertinoActivityIndicator(color: AppColors.buttonColor)
                : AppButton(text: 'Next', onTap: forgetPassword),
          ],
        ),
      ),
    );
  }
}
