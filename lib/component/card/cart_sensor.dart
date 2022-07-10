import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/component/text/text_bold.dart';

class CartSensor extends StatelessWidget {
  const CartSensor(
      {Key? key, required this.onPress, required this.lable, required this.img})
      : super(key: key);
  final Function onPress;
  final String lable;
  final String img;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50.w)),
            child: Container(
                alignment: Alignment.center,
                color: Color.fromARGB(255, 213, 226, 247),
                width: 80.w,
                height: 80.w,
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextBold(
            title: lable,
            size: 13.sp,
          )
        ],
      ),
    );
  }
}
