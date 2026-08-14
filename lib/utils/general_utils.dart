import 'package:another_flushbar/another_flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm/res/appcolors.dart';

class GeneralUtils {
  static toastmessage(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG);
  }

  static flushbarerrormessage(String message, BuildContext context) {
    Flushbar(
      message: message,
      duration: const Duration(seconds: 3),
      positionOffset: 20,
      flushbarPosition: FlushbarPosition.TOP,
      reverseAnimationCurve: Curves.easeInCubic,
      forwardAnimationCurve: Curves.easeIn,
      margin: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(40),
      padding: const EdgeInsets.all(20),
      icon: const Icon(Icons.error, size: 30, color: Colors.red),
      backgroundColor: Appcolors.ButtonColor,
      messageColor: Colors.white,
      animationDuration: const Duration(milliseconds: 400),
    ).show(context); // Using .show(context) directly
  }

  static void Focusnode(
    BuildContext context,
    FocusNode currentfocus,
    FocusNode nextFocus,
  ) {
    currentfocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void showdialoage(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 100,
          width: 400,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Text(message)),
        ),
      ),
    );
  }
}
