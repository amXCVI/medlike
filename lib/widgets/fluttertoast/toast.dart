import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medlike/themes/colors.dart';

class AppToast {
  static showAppToast({required String msg}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 6,
        backgroundColor: AppColors.lightRed,
        textColor: Colors.white,
        fontSize: 14.0
    );
    // showToast(
    //   msg,
    //   borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    //   backgroundColor: AppColors.mainText,
    //   textStyle: const TextStyle(
    //     fontFamily: 'Muller',
    //     fontSize: 14.0,
    //     fontWeight: FontWeight.w400,
    //     height: 1.42,
    //     letterSpacing: 0.25,
    //     color: Colors.white,
    //   ),
    //   fullWidth: true,
    //   duration: const Duration(seconds: 10),
    //   animation: StyledToastAnimation.slideToBottom,
    // );
  }
}
