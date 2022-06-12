import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/colors.dart';

class ButtonClasses extends StatefulWidget {
  const ButtonClasses({Key? key}) : super(key: key);

  @override
  _ButtonClassesState createState() => _ButtonClassesState();
}

class _ButtonClassesState extends State<ButtonClasses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 30.h,
      decoration: BoxDecoration(
          color: AppColors.jPrimaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8.r)),
      child: Center(
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 27.sp,
        ),
      ),
    );
  }
}
