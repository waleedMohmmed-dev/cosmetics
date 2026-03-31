import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_snack.dart';
import 'package:cosmetics/network/api_error.dart';
import 'package:cosmetics/views/auth/data/model/user_model.dart';
import 'package:cosmetics/views/auth/data/repo/auth_repo.dart';
import 'package:cosmetics/views/auth/forget_password.dart';
import 'package:cosmetics/views/auth/create_account.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_input.dart';
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
  final phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    passwordController.text = '12345678';
    countryCodeController.text = '+20';
    phoneNumberController.text = '01276597628';
    super.initState();
  }

  void dispose() {
    passwordController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  final AuthRepo authRepo = AuthRepo();
  bool isLoading = false;

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
          goTo(page: const HomeView(), canPop: false);
        }
        setState(() => isLoading = false);
      } catch (e) {
        setState(() => isLoading = false);
        String errorMsg = 'Unknown error';

        if (e is ApiError) {
          errorMsg = e.message;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          appSnack('The login process failed Please try again later.'),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                100.ph,

                /// iamge
                Center(
                  child: AppImage(
                    path: 'assets/images/login_logo.png',
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

                /// textfields
                Row(
                  children: [
                    SizedBox(
                      width: 70.w,
                      height: 42.h,
                      child: AppInput(
                        hintText: '+20',
                        //height: 46.h,
                        //width: 72.w,
                        controller: countryCodeController,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'pleas Enter your country code';
                          }
                          return null;
                        },

                        keyboardType: TextInputType.number,
                      ),
                    ),
                    5.pw,
                    AppInput(
                      labelText: 'Phone Number',
                      height: 46.h,
                      width: 285.w,
                      controller: phoneNumberController,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'pleas Enter your phone number';
                        }
                        if (v.length < 10) {
                          return 'Pleas the number must be 10 number';
                        }
                        return null;
                      },
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
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Pleas Enter your password';
                    }
                    if (v.length < 6) {
                      return 'Pleas the password must be 6 numbers';
                    }
                    return null;
                  },
                ),
                11.ph,
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
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
                        buttonText: 'Login',
                        onTap: () {
                          login();
                        },
                      ),
                86.ph,
                GestureDetector(
                  onTap: () {
                    goTo(page: CreateAccountView(), canPop: true);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 13.sp,
                      ),
                      children: [
                        TextSpan(
                          text: "Register",
                          style: TextStyle(
                            color: AppColors.buttonColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
