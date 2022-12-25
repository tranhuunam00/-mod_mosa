import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputChat extends StatelessWidget {
  const InputChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 247, 230, 229),
      height: 65,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 12.0, right: 12, top: 0, bottom: 0),
        child: Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                style: TextStyle(),
                decoration:
                    InputDecoration(hintText: "Nhấn để nhập tin nhắn..."),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 28),
              child: Icon(Icons.voice_over_off),
            ),
            Icon(Icons.send, size: 30)
          ],
        ),
      ),
    );
  }
}
