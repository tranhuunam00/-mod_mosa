import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/component/text/text_bold.dart';

class ButtonSetting extends StatefulWidget {
  final Widget widget;
  final String title;
  final Color color;
  final GestureTapCallback? onTap;

  const ButtonSetting(
      {Key? key,
      required this.widget,
      required this.title,
      required this.color,
      this.onTap})
      : super(key: key);

  @override
  _ButtonSettingState createState() => _ButtonSettingState();
}

class _ButtonSettingState extends State<ButtonSetting> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            children: [
              widget.widget,
              SizedBox(
                width: 10.w,
              ),
              TextBold(
                title: widget.title,
                size: 13.sp,
                colors: widget.color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
