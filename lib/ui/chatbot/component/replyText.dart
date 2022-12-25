import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReplyText extends StatelessWidget {
  const ReplyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 45,
            ),
            child: Card(
              color: Color.fromARGB(255, 238, 241, 234),
              elevation: 1,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Color.fromARGB(255, 208, 241, 253),
                      width: 1,
                      strokeAlign: StrokeAlign.outside),
                  borderRadius: BorderRadius.circular(24)),

              margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 60, top: 05, bottom: 20),
                child: Text(
                    "reply text r32r4324444444444423432432222222222222222222222222222222222",
                    style: TextStyle(fontSize: 16)),
              ),
              // color: Color(0xffdcf8c6),),
            )));
  }
}
