import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/core/ui/app_country_code.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_login_or_register.dart';
import 'package:cosmetics/network/api_error.dart';
import 'package:cosmetics/network/api_service.dart';
import 'package:cosmetics/utils/pref_helper.dart';
import 'package:cosmetics/views/auth/data/repo/auth_repo.dart';
import 'package:cosmetics/views/auth/forget_password.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/views/home/main_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final passwordController = TextEditingController();
  final countryCodeController = TextEditingController();
  String? SelectedCountryCode;
  final phoneNumberController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void dispose() {
    passwordController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  final AuthRepo authRepo = AuthRepo();
  final ApiService apiService = ApiService();
  bool isLoading = false;

  // / Login Method
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      try {
        final user = await authRepo.login(
          countryCodeController.text.trim(),
          phoneNumberController.text.trim(),
          passwordController.text.trim(),
        );

        if (user != null) {
          goTo(page: const MianView(), canPop: false);
          await PrefHelper.saveToken(user.token!);
        }
        setState(() => isLoading = false);
      } catch (e) {
        setState(() => isLoading = false);
        String errorMsg = 'Unknown error';

        if (e is ApiError) {
          errorMsg = e.message;
        }
        showMsg('The login process failed Please try again later.');
      }
    }
  }

  void initState() {
    passwordController.text = '12345678';
    countryCodeController.text = '+20';
    phoneNumberController.text = '01276597628';
    super.initState();
  }

  // Future<void> login() async {
  //   final phone = phoneNumberController.text.trim();
  //   final password = passwordController.text.trim();
  //   try {
  //     final res = await apiService.post('/api/Auth/verify-otp', {
  //       "countryCode": SelectedCountryCode,
  //       "phoneNumber": phone,
  //       "password": password,
  //     });

  //     showMsg('The login process Success Welcome in Cosmetics!');
  //   } on DioException catch (ex) {
  //     showMsg(ex.response?.data['message'], isErorr: true);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,

          ///! Aotomatic Validation
          // autovalidateMode: AutovalidateMode.always,
          // onChanged: () {
          //   if (formKey.currentState!.validate()) ;
          // },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  100.ph,

                  /// iamge
                  Center(
                    child: AppImage(
                      image: 'assets/images/login_logo.png',
                      width: 284.w,
                      height: 227.h,
                    ),
                  ),
                  25.ph,
                  Text(
                    'Login Now',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,

                      color: AppColors.primaryColor,
                    ),
                  ),
                  14.ph,
                  Text(
                    'Please enter the details below to continue',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  25.ph,

                  /// ?country code
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppCountryCode(
                        onCountryCodeChanged: (value) {
                          SelectedCountryCode = value;
                        },
                      ),
                      5.pw,
                      Expanded(
                        child: AppInput(
                          labelText: 'Phone Number',
                          height: 46.h,
                          width: 285.w,
                          controller: phoneNumberController,
                          validator: InputValidator.phoneValidator,
                        ),
                      ),
                    ],
                  ),

                  7.ph,
                  AppInput(
                    hintText: 'Your Passwoed',
                    width: double.infinity,
                    height: 46.h,
                    suffixIcon: Icon(
                      Icons.visibility_off_outlined,
                      color: AppColors.labelColor,
                    ),
                    controller: passwordController,
                    keyboardType: TextInputType.number,
                    validator: InputValidator.passwordValidator,
                  ),
                  1.ph,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      onPressed: () {
                        goTo(page: ForgetPasswordView(), canPop: true);
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  43.ph,
                  isLoading
                      ? CupertinoActivityIndicator(color: AppColors.buttonColor)
                      : AppButton(
                          text: 'Login',
                          // isLoding: true,
                          onTap: () {
                            login();
                          },
                        ),
                  80.ph,
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: AppLoginOrRegister(isLogin: true),
      ),
    );
  }
}

 //Plays
// Medal of Holler = Action game 
///pin feat girl  =  torid = gata 