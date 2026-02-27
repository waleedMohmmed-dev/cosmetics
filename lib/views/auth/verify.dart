// import 'package:cosmetics/core/constans/app_colors.dart';
// import 'package:cosmetics/root.dart';
// import 'package:cosmetics/shared/costum_button.dart';
// import 'package:cosmetics/shared/costum_dailog.dart';
// import 'package:cosmetics/shared/costum_text.dart';
// import 'package:cosmetics/views/auth/login.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:gap/gap.dart';

// class VerifyView extends StatefulWidget {
//   bool isRegister = false;
//   const VerifyView({super.key, this.isRegister});

//   @override
//   State<VerifyView> createState() => _VerifyViewState();
// }

// class _VerifyViewState extends State<VerifyView> {
//   final formKey = GlobalKey<FormState>();
//   late TextEditingController pinCodeController;

//   @override
//   void initState() {
//     super.initState();
//     pinCodeController = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondaryColor,
//       body: Column(
//         children: [
//           Gap(120),
//           Center(
//             child: Image.asset(
//               'assets/images/splash_image.png',
//               height: 67.sp,
//               width: 62.sp,
//             ),
//           ),
//           Gap(40),
//           Text(
//             'Verify Code',
//             style: TextStyle(
//               fontSize: 22.sp,
//               fontWeight: FontWeight.bold,
//               color: AppColors.primaryColor,
//               fontFamily: 'Montserrat',
//             ),
//           ),
//           Gap(40),

//           RichText(
//             text: TextSpan(
//               text: 'We just sent a 4-digit verification code to\n \n  ',
//               style: TextStyle(
//                 color: AppColors.primaryColor,
//                 fontSize: 14.sp,
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.w400,
//               ),

//               children: [
//                 TextSpan(
//                   text: "+20 1022658997",
//                   style: TextStyle(
//                     color: AppColors.primaryColor,
//                     fontSize: 14.sp,
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 TextSpan(
//                   text: 'Enter the code in the box \n \n below to continue.  ',
//                   style: TextStyle(
//                     color: AppColors.primaryColor,
//                     fontSize: 14.sp,
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Gap(40),

//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 13),
//             child: Align(
//               alignment: AlignmentGeometry.centerLeft,
//               child: Text(
//                 'Edit the number',
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   fontFamily: 'Montserrat',
//                   color: AppColors.buttonColor,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//           Gap(20),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 44),
//             child: PinCodeTextField(
//               appContext: context,
//               length: 4,
//               controller: pinCodeController,
//               obscureText: false,
//               enableActiveFill: true,
//               keyboardType: TextInputType.number,
//               textStyle: TextStyle(
//                 color: AppColors.primaryColor,
//                 fontSize: 22.sp,
//                 fontWeight: FontWeight.w600,
//                 fontFamily: 'Montserrat',
//               ),

//               pinTheme: PinTheme(
//                 selectedBorderWidth: 1,
//                 fieldWidth: 66.w,
//                 fieldHeight: 60.h,
//                 shape: PinCodeFieldShape.box,
//                 borderRadius: BorderRadius.circular(8.r),
//                 selectedColor: Color(0xffD75D72),
//                 selectedFillColor: AppColors.secondaryColor,
//                 activeColor: Color(0xffD75D72),
//                 activeFillColor: AppColors.secondaryColor,
//                 inactiveColor: Color(0xff8989925C),
//                 inactiveFillColor: AppColors.secondaryColor,
//               ),
//               onChanged: (value) {
//                 print("pin value:$value");
//               },
//               onCompleted: (value) {},
//             ),
//           ),
//           Gap(43),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 14.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     text: 'Didn’t receive a code?',
//                     style: TextStyle(
//                       color: AppColors.primaryColor,
//                       fontSize: 12.sp,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                     ),

//                     children: [
//                       TextSpan(
//                         text: " Resend",
//                         style: TextStyle(
//                           color: Colors.red,
//                           fontSize: 12.sp,
//                           fontFamily: 'Montserrat',
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   '0:36',
//                   style: TextStyle(
//                     fontSize: 12.sp,
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Gap(113),
//           CostumButton(
//             width: 268.sp,
//             height: 65.h,
//             buttonText: 'Done',
//             bordersRadius: 60,
//             buttonColor: AppColors.buttonColor,
//             onTap: () {
//               isRegster
//                   ? showDialog(
//                       context: context,
//                       builder: (_) => CostumDailog(
//                         title: 'Account Activated!',
//                         description:
//                             'Congratulations! Your account has been successfully activated',
//                         buttonText: 'Go to home',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (_) => Root()),
//                           );
//                         },
//                       ),
//                     )
//                   : showDialog(
//                       context: context,
//                       builder: (_) => CostumDailog(
//                         title: 'Password Changed!',
//                         description:
//                             'Your new password has been set successfully.',
//                         buttonText: 'Login Now',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (_) => LoginView()),
//                           );
//                         },
//                       ),
//                     );

//               // showDialog(
//               //   context: context,
//               //   barrierDismissible: false,
//               //   builder: (context) {
//               //     return Dialog(
//               //       backgroundColor: AppColors.secondaryColor,
//               //       child: CostumDailog(
//               //         title: '',
//               //         description: '',
//               //         buttonText: '',
//               //       ),
//               //     );
//               //   },
//               // );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cosmetics/core/constans/app_colors.dart';
import 'package:cosmetics/root.dart';
import 'package:cosmetics/shared/costum_button.dart';
import 'package:cosmetics/shared/costum_dailog.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:gap/gap.dart';

class VerifyView extends StatefulWidget {
  final bool isRegister;
  const VerifyView({super.key, this.isRegister = false});

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController pinCodeController;

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        children: [
          Gap(120),
          Center(
            child: Image.asset(
              'assets/images/splash_image.png',
              height: 67.sp,
              width: 62.sp,
            ),
          ),
          Gap(40),
          Text(
            'Verify Code',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              fontFamily: 'Montserrat',
            ),
          ),
          Gap(40),
          RichText(
            text: TextSpan(
              text: 'We just sent a 4-digit verification code to\n \n  ',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  text: "+20 1022658997",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Enter the code in the box \n \n below to continue.  ',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Gap(40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Edit the number',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Montserrat',
                  color: AppColors.buttonColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Gap(20),
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
                fontFamily: 'Montserrat',
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
          Gap(43),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Didn’t receive a code?',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: " Resend",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '0:36',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Gap(113),
          CostumButton(
            width: 268.sp,
            height: 65.h,
            buttonText: 'Done',
            bordersRadius: 60,
            buttonColor: AppColors.buttonColor,
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return Dialog(
                    child: CostumDailog(
                      title: widget.isRegister
                          ? 'Account Activated!'
                          : 'Password Changed!',
                      description: widget.isRegister
                          ? 'Congratulations! Your account has been successfully activated'
                          : 'Congratulations! Your password has been successfully created',
                      buttonText: widget.isRegister
                          ? 'Go to home'
                          : 'Return to login',
                      onTap: () {
                        Navigator.pop(context);
                        if (widget.isRegister) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Root()),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => LoginView()),
                          );
                        }
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
