import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/images.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Stack(children: [
      Container(
        width: size.width,
        height: size.height,
        child: Image.asset(
          "assets/images/backgroundDefault.jpg",
          color: Color.fromRGBO(255, 255, 255, 0.3),
          colorBlendMode: BlendMode.softLight,
          fit: BoxFit.cover,
        ),
      ),
      child
    ]));
  }
}
