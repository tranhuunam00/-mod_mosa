import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonMaterial extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final bool enable;
  final Color color;
  final double? width;
  final double? height;

  const ButtonMaterial(
      {Key? key,
      required this.color,
      required this.child,
      required this.onPressed,
      this.width,
      this.height,
      required this.enable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12.r),
      color: color,
      child: MaterialButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        minWidth: width ?? ScreenUtil().screenWidth,
        onPressed: enable ? onPressed : null,
        child: child,
      ),
    );
  }
}
