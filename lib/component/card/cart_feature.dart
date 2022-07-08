import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/config/icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardFeature extends StatelessWidget {
  const CardFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 53, 38, 37),
              Color.fromARGB(255, 90, 164, 225),
              Color.fromARGB(255, 223, 209, 80)
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
          Navigator.pushNamed(context, Constants.register);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              child: Icon(FontAwesomeIcons.userPlus, size: 40.w),
            ),
            Text("Thêm người dùng")
          ],
        ),
      ),
    );
  }
}
