import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mod_do_an/config/images.dart';
import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/storage/secure_storge.dart';
import 'package:mod_do_an/ui/chatbot/component/backArrow.dart';
import 'package:mod_do_an/ui/chatbot/component/inputText.dart';
import 'package:mod_do_an/ui/chatbot/component/replyText.dart';
import 'package:mod_do_an/ui/chatbot/component/sendText.dart';
import 'package:mod_do_an/ui/chatbot/component/skipContext.dart';
import 'package:mod_do_an/ui/chatbot/interface/message.dart';
import 'package:socket_io_client/socket_io_client.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({Key? key}) : super(key: key);

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  List<MessageModel> listMessage = [];
  int x = 6;
  late Socket socket;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    socket = io("https://e480-27-72-62-195.ap.ngrok.io", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": true,
    });
    socket.connect();
    socket.onConnect((data) {
      print("connect");
      socket.on('returnBot', (value) {
        var jsonValue = json.decode(value);

        setState(() {
          MessageModel newMessage = new MessageModel(
              type: TypeMessage.bot, text: jsonValue["value"]["response"]);
          listMessage.add(newMessage);
        });
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    socket.emit("disconnect");
  }

  @override
  Widget build(BuildContext context) {
    // check sự kiện bàn phím
    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      setState(() {
        _scrollController.animateTo(
            _scrollController.position.maxScrollExtent +
                WidgetsBinding.instance.window.viewInsets.bottom,
            duration: Duration(milliseconds: 100),
            curve: Curves.ease);
      });
    } else {
      // Keyboard is not visible.
    }
    Function onChangeInput = (value) {
      MessageModel newMessage =
          new MessageModel(type: TypeMessage.owner, text: value);
      setState(() {
        listMessage.add(newMessage);
        _scrollController.animateTo(
            _scrollController.position.maxScrollExtent + 75,
            duration: Duration(milliseconds: 100),
            curve: Curves.ease);
      });
    };
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: listMessage.length,
                    itemBuilder: ((context, index) {
                      if (listMessage[index].type == TypeMessage.bot)
                        return ReplyText(
                          message: listMessage[index],
                        );
                      return SendText(
                        message: listMessage[index],
                      );
                    })),
              )),
              InputChat(
                onChange: (value) async {
                  ProfileUser userP = await SecureStorage().getUser();
                  socket.emit("messageBot",
                      jsonEncode({"text": value, "context": userP.customerId}));
                  onChangeInput(value);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
