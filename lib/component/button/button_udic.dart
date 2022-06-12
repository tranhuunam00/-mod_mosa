import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/colors.dart';

class ButtonUdic extends StatefulWidget {
  final double width;
  final String title;
  final GestureTapCallback onTap;
  final bool? blueOutline;
  final Color? color;
  final double? height;

  const ButtonUdic(
      {Key? key,
      required this.width,
      required this.title,
      required this.onTap,
      this.blueOutline,
      this.color,
      this.height})
      : super(key: key);

  @override
  _ButtonUdicState createState() => _ButtonUdicState();
}

class _ButtonUdicState extends State<ButtonUdic> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: widget.onTap,
      onHighlightChanged: (val) {
        setState(() {
          pressed = val;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height ?? 64.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: pressed
                ? AppColors.jPrimaryColor.withOpacity(0.7)
                : widget.color ?? Colors.transparent,
            border: Border.all(
                color: pressed
                    ? AppColors.jPrimaryColor.withOpacity(0.7)
                    : (widget.blueOutline != null
                        ? AppColors.jPrimaryColor.withOpacity(0.7)
                        : AppColors.jPrimaryColor.withOpacity(0.7)),
                width: 1)),
        child: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14.sp,
            height: 1.2.h,
          ),
        ),
      ),
    );
  }
}
