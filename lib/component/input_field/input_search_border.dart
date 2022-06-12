import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/colors.dart';

class InputSearchBorder extends StatelessWidget {
  final double? height;
  final ValueChanged<String>? onChanged;

  const InputSearchBorder({Key? key, this.height, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: height ?? 40.h,
      child: TextFormField(
        onChanged: onChanged,
        style: TextStyle(
            fontFamily: 'Source Sans Pro',
            color: AppColors.primaryColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            height: 1.2.h),
        decoration: InputDecoration(
          filled: true,
          contentPadding:
              EdgeInsets.only(left: 10.w, top: 12.h, bottom: 12.h, right: 12.w),
          hintText: "Search for people",
          fillColor: Colors.transparent,
          hintStyle: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              height: 1.2.h),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          isDense: true,
          prefixIcon: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: const Icon(Icons.search_outlined),
          ),
        ),
      ),
    );
  }
}
