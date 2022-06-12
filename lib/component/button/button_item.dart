import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/component/text/text_normal.dart';

class ButtonItem extends StatefulWidget {
  final Color color;
  final String title;
  final Widget widget;
  final GestureTapCallback? onTap;

  const ButtonItem(
      {Key? key,
      required this.color,
      required this.title,
      required this.widget,
      this.onTap})
      : super(key: key);

  @override
  _ButtonItemState createState() => _ButtonItemState();
}

class _ButtonItemState extends State<ButtonItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: 45.w,
            height: 45.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: widget.color.withOpacity(0.7)),
            child: Center(
              child: widget.widget,
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        TextNormal(
          title: widget.title,
          size: 9.sp,
        )
      ],
    );
  }
}
