import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/network/api_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePasswordView extends StatefulWidget {
  final bool isRegister;

  const CreatePasswordView({super.key, this.isRegister = false});

  @override
  State<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final ApiService apiService = ApiService();

  Future<void> getData() async {
    final res = await apiService.post('/api/Auth/reset-password', {
      "countryCode": '+20',
      "phoneNumber": "1234567890",
      "newPassword": "01030405060",
      "confirmPassword": "01030405060",
    });
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              120.ph,
              Center(
                child: AppImage(
                  image: 'assets/images/splash_image.png',
                  height: 57.sp,
                  width: 67.sp,
                ),
              ),
              40.ph,
              Text(
                'Create Password',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  fontFamily: 'Montserrat',
                ),
              ),
              30.ph,
              Text(
                'The password should have at least \n6 characters.',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              60.ph,
              AppInput(
                controller: newPasswordController,
                height: 46.w,
                hintText: 'New password',
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: AppColors.labelColor,
                ),
                validator: InputValidator.passwordValidator,
              ),
              20.ph,
              AppInput(
                controller: confirmPasswordController,
                height: 46.w,
                hintText: 'Confirm password',
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  color: AppColors.labelColor,
                ),
                validator: InputValidator.passwordValidator,
              ),

              70.ph,
              AppButton(
                text: 'Confirm',

                onTap: () {
                  getData();
                  showDialog(
                    context: context,
                    builder: (_) => const Dialog(
                      child: Center(),
                      //  AppDailog()
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
