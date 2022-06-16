import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/component/text/text_normal.dart';
import 'package:mod_do_an/config/colors.dart';

class DialogLogout extends StatelessWidget {
  const DialogLogout({required this.onPressedContinue, Key? key})
      : super(key: key);

  final VoidCallback onPressedContinue;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.kPrimaryColor,
      title: TextNormal(
        title: "Thiên Sơn",
        size: 20.sp,
        maxLines: 1,
        textAlign: TextAlign.left,
        color: AppColors.primaryColor,
      ),
      content: TextNormal(
        title: "Bạn có chắc chắn muốn đăng xuất khỏi Udic Edu không?",
        size: 18.sp,
        maxLines: 3,
        textAlign: TextAlign.left,
        color: AppColors.grey500,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: TextNormal(
            title: "HỦY",
            size: 16.sp,
            maxLines: 1,
            textAlign: TextAlign.left,
            color: AppColors.jPrimaryColor,
          ),
        ),
        TextButton(
          onPressed: onPressedContinue,
          child: TextNormal(
            title: "TIẾP TỤC",
            size: 16.sp,
            maxLines: 1,
            textAlign: TextAlign.left,
            color: AppColors.jPrimaryColor,
          ),
        ),
      ],
    );
  }
}
