import 'package:cosmetics/core/exeptions/spacing.dart';
import 'package:cosmetics/core/logic/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SnackBar appSnack(errorMsg) {
  return SnackBar(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppColors.buttonColor,
    content: FittedBox(
      child: Row(
        children: [
          const Icon(CupertinoIcons.info, color: Colors.white),
          10.pw,
          Text(
            errorMsg,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
