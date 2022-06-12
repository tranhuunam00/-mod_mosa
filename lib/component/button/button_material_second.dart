import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/component/text/text_normal.dart';

class MaterialButtonSecond extends StatelessWidget {
  const MaterialButtonSecond({
    required this.title,
    required this.onPressed,
    required this.colorText,
    required this.colorButton,
    required this.minWidth,
    Key? key,
  }) : super(key: key);

  final double minWidth;
  final String title;
  final Color colorButton;
  final Color colorText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: minWidth,
      color: colorButton,
      onPressed: onPressed,
      child: TextNormal(
        textAlign: TextAlign.center,
        size: 14.sp,
        color: colorText,
        title: title,
      ),
    );
  }
}
