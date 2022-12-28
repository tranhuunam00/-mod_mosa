import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputChat extends StatefulWidget {
  const InputChat({Key? key, required this.onChange}) : super(key: key);

  final Function onChange;

  @override
  State<InputChat> createState() => _InputChatState();
}

class _InputChatState extends State<InputChat> {
  final TextEditingController _controller = TextEditingController();
  Color colorSendBtn = Colors.grey;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            Flexible(
              child: TextField(
                onChanged: ((value) {
                  setState(() {
                    if (value != "")
                      colorSendBtn = Colors.blueAccent;
                    else
                      colorSendBtn = Colors.grey;
                  });
                }),
                controller: _controller,
                style: TextStyle(),
                decoration:
                    InputDecoration(hintText: "Nhấn để nhập tin nhắn..."),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 28),
              child: Icon(Icons.voice_over_off),
            ),
            InkWell(
                onTap: () {
                  if (_controller.text != "") {
                    widget.onChange(_controller.text);
                    _controller.text = "";
                  }
                },
                child: Icon(Icons.send, size: 30, color: colorSendBtn))
          ],
        ),
      ),
    );
  }
}
