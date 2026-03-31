import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_snack.dart';
import 'package:cosmetics/network/api_error.dart';
import 'package:cosmetics/views/auth/data/repo/auth_repo.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/auth/verify.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_input.dart';

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
  final countryNumberController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthRepo authRepo = AuthRepo();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    nameController.text = 'well123';
    emailController.text = 'wm5984814@gmail.com';
    countryNumberController.text = '+20';
    phoneNumberController.text = '01273228660';
    passwordController.text = '12345679999';
    confirmPasswordController.text = '12345679999';
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    countryNumberController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  /// Register
  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      try {
        final user = await authRepo.register(
          nameController.text.trim(),
          countryNumberController.text.trim(),
          phoneNumberController.text.trim(),
          emailController.text.trim(),
          passwordController.text.trim(),
        );

        if (user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const VerifyView(isRegister: true),
            ),
          );
        }
        setState(() => isLoading = false);
      } catch (e) {
        setState(() => isLoading = false);
        String errorMsg = 'Error In Register';

        if (e is ApiError) {
          errorMsg = e.message;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          appSnack('The Register process failed Please try again later'),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    path: 'assets/images/splash_image.png',
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
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Bro Please Enter Your Name';
                    }
                    return null;
                  },
                ),

                37.ph,

                AppInput(
                  labelText: 'Email',
                  controller: emailController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Please Fill Your Email ya Bro';
                    }

                    if (v.length < 6) {
                      return 'Please The Email Should be 6 Characters';
                    }

                    if (!v.endsWith('@gmail.com')) {
                      return 'Email must end with @gmail.com';
                    }

                    return null;
                  },
                ),

                33.ph,

                Row(
                  children: [
                    SizedBox(
                      width: 72.w,
                      height: 46.h,
                      child: AppInput(
                        labelText: '+20',
                        controller: countryNumberController,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Add Country Code';
                          }
                          return null;
                        },
                      ),
                    ),

                    10.pw,

                    AppInput(
                      labelText: 'Phone Number',
                      width: 266.w,
                      controller: phoneNumberController,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Please Add Your Number';
                        }

                        if (v.length < 10) {
                          return 'The Phone Number Should be 10 numbers';
                        }

                        return null;
                      },
                    ),
                  ],
                ),

                16.ph,

                AppInput(
                  controller: passwordController,
                  hintText: 'Create your password',
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Fill Password';
                    }

                    if (v.length < 6) {
                      return 'The Password Should be 6 numbers';
                    }

                    return null;
                  },
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColors.labelColor,
                  ),
                ),

                20.ph,

                AppInput(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Please Add Your Confirm Password';
                    }

                    if (v != passwordController.text) {
                      return 'Password not match';
                    }

                    return null;
                  },
                  suffixIcon: Icon(
                    Icons.visibility_off_outlined,
                    color: AppColors.labelColor,
                  ),
                ),

                16.ph,

                isLoading
                    ? CupertinoActivityIndicator(color: AppColors.buttonColor)
                    : AppButton(
                        buttonText: 'Next',
                        onTap: () async {
                          await register();
                        },
                      ),

                40.ph,

                GestureDetector(
                  onTap: () {
                    goTo(page: LoginView());
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => const VerifyView(isRegister: true),
                    //   ),
                    // );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Have an account? ",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 13.sp,
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: AppColors.buttonColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
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
