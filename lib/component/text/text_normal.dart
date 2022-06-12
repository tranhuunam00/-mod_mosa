import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextNormal extends StatelessWidget {
  final String title;
  final double? size;
  final double? height;
  final FontWeight? fontWeight;
  Color? color;
  TextAlign? textAlign;
  int? maxLines;
  TextOverflow? overflow;
  final TextDecoration? textDecoration;

  TextNormal({
    Key? key,
    this.maxLines,
    this.textAlign,
    required this.title,
    this.size,
    this.height,
    this.color,
    this.overflow,
    this.fontWeight,
    this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      softWrap: false,
      style: TextStyle(
        decoration: textDecoration,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: 'Montserrat',
        fontSize: size ?? 17.sp,
        height: height ?? 1.3.h,
      ),
    );
  }
}
