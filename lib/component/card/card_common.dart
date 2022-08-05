import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mod_do_an/config/images.dart';

class CardCommon extends StatelessWidget {
  const CardCommon(
      {Key? key,
      required this.colorC,
      required this.heading,
      this.subHeading,
      this.backgroudC,
      required this.onPress,
      this.image})
      : super(key: key);

  final Color colorC;
  final Color? backgroudC;
  final String heading;
  final String? subHeading;
  final String? image;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress(context);
      },
      child: Container(
        // color: Colors.grey,
        decoration: BoxDecoration(
            color: backgroudC ?? Color.fromARGB(255, 251, 219, 219),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: colorC,
                          borderRadius: BorderRadius.circular(10)),
                      height: 55,
                      width: 55,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(image ?? AppImages.help),
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    heading,
                    style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subHeading != null ? subHeading! : "",
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
