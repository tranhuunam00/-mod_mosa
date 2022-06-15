import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/component/text/text_normal.dart';
import 'package:mod_do_an/config/colors.dart';

class BottomSheetPickImage extends StatefulWidget {
  const BottomSheetPickImage({Key? key}) : super(key: key);

  @override
  _BottomSheetPickImageState createState() => _BottomSheetPickImageState();
}

class _BottomSheetPickImageState extends State<BottomSheetPickImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.r),
          topLeft: Radius.circular(12.r),
        ),
      ),
      padding: EdgeInsets.all(16.h),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              // var a = await PickImageHelper.pickerFromGallery();
              // if (a != null) {
              //   Navigator.pop(context, a);
              // }
            },
            child: Row(
              children: [
                const Icon(
                  Icons.photo,
                  color: AppColors.grey500,
                ),
                SizedBox(
                  width: 30.w,
                ),
                TextNormal(title: "Photos"),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              // var a = await PickImageHelper.pickerFromCamera();
              // if (a != null) {
              //   Navigator.pop(context, a);
              // }
            },
            child: Row(
              children: [
                const Icon(
                  Icons.camera,
                  color: AppColors.grey500,
                ),
                SizedBox(
                  width: 30.w,
                ),
                TextNormal(title: "Camera"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
