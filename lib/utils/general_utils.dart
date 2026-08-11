import 'package:another_flushbar/another_flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GeneralUtils {
  static toastmessage(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG);
  }

  static flushbarerrormessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        title: 'SAD',
        message: message,
        duration: Duration(seconds: 2),
        positionOffset: 20,

        flushbarPosition: FlushbarPosition.TOP,
        reverseAnimationCurve: Curves.easeInCubic,
        forwardAnimationCurve: Curves.easeIn,
        margin: EdgeInsets.all(20),
        titleColor: Colors.black,
        messageColor: Colors.black,
        padding: EdgeInsets.all(20),
        icon: Icon(Icons.error, size: 30, color: Colors.red),
        backgroundColor: Colors.white12,
        animationDuration: Duration(microseconds: 10),
      )..show(context),
    );
  }

  static void Focusnode(
    BuildContext context,
    FocusNode currentfocus,
    FocusNode nextFocus,
  ) {
    currentfocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
