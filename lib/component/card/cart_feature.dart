import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardFeature extends StatelessWidget {
  const CardFeature(
      {Key? key,
      required this.onPress,
      this.textCard = "",
      this.iconCard = const Icon(
        FontAwesomeIcons.userPlus,
        size: 40,
        color: Color.fromARGB(255, 55, 15, 199),
      )})
      : super(key: key);
  final Function onPress;
  final String? textCard;
  final Icon? iconCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.w,
      constraints: BoxConstraints(minWidth: 120, maxWidth: 150),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 208, 248, 179),
              Color.fromARGB(255, 255, 240, 231),
              Color.fromARGB(255, 222, 244, 255),
              Color.fromARGB(255, 255, 250, 209)
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
              child: iconCard,
            ),
            Text(
              textCard!,
              textAlign: TextAlign.center,
              style: TextStyle(),
            )
          ],
        ),
      ),
    );
  }
}
