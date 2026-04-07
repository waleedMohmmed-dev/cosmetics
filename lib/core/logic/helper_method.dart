import 'dart:async';

import 'package:cosmetics/core/exeptions/spacing.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();

void goTo({required Widget page, bool canPop = true, int? delaySeconds}) {
  action() {
    Navigator.pushAndRemoveUntil(
      navKey.currentContext!,
      MaterialPageRoute(builder: (_) => page),
      (_) => canPop,
    );
  }

  if (delaySeconds != null) {
    Timer(Duration(seconds: delaySeconds), () {
      action();
    });
  } else {
    action();
  }
}

// void showMsg(String msg) {
//   if (msg.isNotEmpty) {
//     ScaffoldMessenger.of(
//       navKey.currentContext!,
//     ).showSnackBar(SnackBar(content: Text(msg)));
//   }
// }
void showMsg(String msg, {bool isErorr = false}) {
  if (msg.isNotEmpty) {
    ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
      //
      SnackBar(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        backgroundColor: isErorr ? Colors.red : Colors.green,
        content: FittedBox(
          child: Row(
            children: [
              const Icon(CupertinoIcons.info, color: Colors.white),
              10.pw,
              Text(
                msg,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
