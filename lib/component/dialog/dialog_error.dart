import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/component/button/button_material.dart';
import 'package:mod_do_an/component/text/text_normal.dart';
import 'package:mod_do_an/config/colors.dart';

class DialogError extends StatelessWidget {
  final String message;

  const DialogError({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 250.w,
        height: 200.h,
        padding:
            EdgeInsets.only(left: 30.w, right: 30.w, top: 40.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: TextNormal(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                title: message,
                size: 15.sp,
                height: 1.3.h,
              ),
            ),
            const Spacer(),
            Center(
              child: ButtonMaterial(
                child: TextNormal(
                  title: "OK",
                  color: AppColors.kPrimaryColor,
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                color: AppColors.jPrimaryColor,
                enable: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
