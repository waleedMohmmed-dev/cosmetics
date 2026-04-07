import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/core/ui/app_country_code.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_login_or_register.dart';
import 'package:cosmetics/network/api_error.dart';
import 'package:cosmetics/network/api_service.dart';
import 'package:cosmetics/views/auth/data/repo/auth_repo.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_input.dart';

import 'package:cosmetics/views/auth/verify.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<CreateAccountView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  String? selectedCountryCode;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthRepo authRepo = AuthRepo();

  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  ///Register
  Future<void> register() async {
    if (!_formKey.currentState!.validate()) return;

    if (selectedCountryCode == null) {
      showMsg('Please select country code', isErorr: true);
      return;
    }

    setState(() => isLoading = true);

    try {
      final user = await authRepo.register(
        nameController.text.trim(),
        selectedCountryCode!,
        phoneNumberController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        showMsg('Register Success', isErorr: true);
        goTo(page: VerifyView());
      }
    } catch (e) {
      String errorMsg = 'Error In Register';

      if (e is ApiError) {
        errorMsg = e.message;
      }

      showMsg(errorMsg, isErorr: true);
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  95.ph,

                  /// image
                  Center(
                    child: AppImage(
                      image: 'assets/images/splash_image.png',
                      height: 62.h,
                      width: 67.w,
                    ),
                  ),

                  40.ph,

                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  71.ph,

                  AppInput(
                    labelText: 'Your Name',
                    controller: nameController,
                    validator: InputValidator.nameValidator,
                  ),

                  37.ph,

                  AppInput(
                    labelText: 'Email',
                    controller: emailController,
                    validator: InputValidator.emailValidator,
                  ),

                  33.ph,

                  Row(
                    children: [
                      AppCountryCode(
                        onCountryCodeChanged: (value) {
                          selectedCountryCode = value;
                        },
                      ),
                      10.pw,
                      AppInput(
                        labelText: 'Phone Number',
                        width: 260.w,
                        controller: phoneNumberController,
                        validator: InputValidator.phoneValidator,
                      ),
                    ],
                  ),

                  16.ph,

                  AppInput(
                    controller: passwordController,
                    hintText: 'Create your password',
                    validator: InputValidator.passwordValidator,
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.labelColor,
                    ),
                  ),

                  20.ph,

                  isLoading
                      ? CupertinoActivityIndicator(color: AppColors.buttonColor)
                      : AppButton(text: 'Next', onTap: register),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: AppLoginOrRegister(),
      ),
    );
  }
}
