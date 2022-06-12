import 'package:flutter/material.dart';

class ButtonElevated extends StatelessWidget {
  const ButtonElevated(
      {required this.backgroundColor,
        required this.child,
        required this.borderRadius,
        required this.onPressed,
        required this.padding,
        Key? key})
      : super(key: key);

  final Widget child;
  final double borderRadius;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}
