import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mod_do_an/config/images.dart';
import 'package:mod_do_an/ui/chatbot/component/backArrow.dart';
import 'package:mod_do_an/ui/chatbot/component/inputText.dart';
import 'package:mod_do_an/ui/chatbot/component/replyText.dart';
import 'package:mod_do_an/ui/chatbot/component/sendText.dart';
import 'package:mod_do_an/ui/chatbot/component/skipContext.dart';
import 'package:socket_io_client/socket_io_client.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({Key? key}) : super(key: key);

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  late Socket socket;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('socket');

    socket = io("https://25ac-27-72-62-195.ap.ngrok.io", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": true,
    });
    socket.connect();
    print(socket.connected);
    socket.onConnect((data) {
      print("hehe");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.chatbotBackground),
                fit: BoxFit.cover,
                opacity: 0.6),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(168, 229, 247, 254),
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackArrow(),
                        Image.asset(AppImages.chatbotImg),
                        SkipContextBtn()
                      ]),
                ),
              ),
              Container(
                height: 2,
                color: Colors.red,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 9,
                      itemBuilder: ((context, index) {
                        if (index % 2 == 0) return ReplyText();
                        return SendText();
                      }))),
              InputChat()
            ],
          ),
        ),
      ),
    );
  }
}
