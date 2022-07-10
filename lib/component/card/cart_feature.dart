import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardFeature extends StatelessWidget {
  const CardFeature({Key? key, required this.onPress}) : super(key: key);
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 112, 182, 228),
              Color.fromARGB(255, 82, 145, 175),
              Color.fromARGB(255, 184, 179, 136)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.green,
                blurRadius: 15.w,
                blurStyle: BlurStyle.outer)
          ],
          border:
              Border.all(color: Colors.blueAccent, style: BorderStyle.solid)),
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          onPress();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              child: Icon(
                FontAwesomeIcons.userPlus,
                size: 40.w,
                color: Color.fromARGB(255, 245, 252, 187),
              ),
            ),
            Text("Thêm người dùng")
          ],
        ),
      ),
    );
  }
}
