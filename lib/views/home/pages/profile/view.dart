import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:cosmetics/core/logic/helper_method.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/network/api_error.dart';
import 'package:cosmetics/network/api_service.dart';
import 'package:cosmetics/utils/pref_helper.dart';
import 'package:cosmetics/views/auth/data/model/user_model.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/home/pages/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
part 'components/header.dart';
part 'components/item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ApiService apiService = ApiService();
  @override
  void initState() {
    super.initState();
    getData();
    updateData();
  }

  /// Logout
  Future<void> logout() async {
    try {
      final res = await apiService.post('/api/Auth/logout', {});

      /// Delete chaching(token)
      await PrefHelper.clearToken();
      goTo(page: LoginView(), canPop: false);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  /// Get Profile data
  Future<void> getData() async {
    final res = await apiService.get('/api/Auth/profile');

    /// same model
    final model = UserModel.fromJson(res);
    setState(() {});

    // await PrefHelper.saveUserData(model);
  }

  /// update profile data
  /// /api/Auth/profile
  Future<void> updateData() async {
    final res = await apiService.put('/api/Auth/profile', {});

    /// same model
    final model = UserModel.fromJson(res);
    setState(() {});

    // await PrefHelper.saveUserData(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _Header(),
          53.ph,
          Text(
            '',
            // PrefHelper.name ?? 'Visetor',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),

          40.ph,
          _Item(iconPath: 'assets/icons/edit_info.svg', text: 'Edit Info'),
          40.ph,
          _Item(
            iconPath: 'assets/icons/order_history.svg',
            text: 'Order History',
            onTap: () {
              goTo(page: CheckoutPage());
            },
          ),
          42.ph,
          _Item(iconPath: 'assets/icons/wallet.svg', text: 'Wallet'),
          42.ph,
          _Item(iconPath: 'assets/icons/settings.svg', text: 'Settings'),

          42.ph,
          _Item(iconPath: 'assets/icons/voucher.svg', text: 'Voucher'),
          30.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            child: Row(
              children: [
                Icon(Icons.logout, color: Colors.red.shade700),

                TextButton(
                  onPressed: logout,
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// For Testing
          // AppButton(
          //   onTap: updateData,
          //   text: 'Update Data',
          //   width: 190.w,
          //   height: 20.h,
          // ),

          // // AppButton(
          // //   onTap: getData,
          // //   text: 'Get Profile Data',
          // //   width: 190.w,
          // //   height: 20.h,
          // // ),
        ],
      ),
    );
  }
}
