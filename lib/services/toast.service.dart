import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mod_do_an/config/colors.dart';

class ToastService {
  static showToast(
      {required String msg,
      ToastGravity? toastGravity,
      Color? textColor,
      Color? backgroundColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor ?? AppColors.zPrimaryColor,
        textColor: textColor ?? Colors.white,
        fontSize: 14.sp);
  }
}
