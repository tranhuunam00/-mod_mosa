import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mod_do_an/config/images.dart';
import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/provider/Chatbot.provider.dart';
import 'package:mod_do_an/storage/secure_storge.dart';
import 'package:mod_do_an/ui/chatbot/component/backArrow.dart';
import 'package:mod_do_an/ui/chatbot/component/inputText.dart';
import 'package:mod_do_an/ui/chatbot/component/replyText.dart';
import 'package:mod_do_an/ui/chatbot/component/sendText.dart';
import 'package:mod_do_an/ui/chatbot/component/skipContext.dart';
import 'package:mod_do_an/ui/chatbot/helper/component_for_chat.dart';
import 'package:mod_do_an/ui/chatbot/interface/message.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({Key? key}) : super(key: key);

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();

  List<MessageModel> listMessageInit = [
    new MessageModel(type: TypeMessage.bot, text: "Xin chào bạn?"),
    new MessageModel(type: TypeMessage.bot, text: "Bạn cần giúp đỡ gì không?"),
  ];
  List<MessageModel> listMessage = [
    new MessageModel(type: TypeMessage.bot, text: "Xin chào bạn?"),
    new MessageModel(type: TypeMessage.bot, text: "Bạn cần giúp đỡ gì không?"),
  ];
  int x = 6;
  Socket socket = io("http://3.95.239.60:5003", <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": true,
  });

  Widget Component = Container();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final chatbotProvider =
          Provider.of<ChatbotProvider>(context, listen: false);
      socket.connect();
      _scrollController.animateTo(
          _scrollController.position.maxScrollExtent +
              WidgetsBinding.instance.window.viewInsets.bottom,
          duration: Duration(milliseconds: 100),
          curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    socket.emit('disconnect');

    // socket.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    final chatbotProvider = Provider.of<ChatbotProvider>(context, listen: true);
    listMessage = chatbotProvider.chatbotList;

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

    Function sendMessage =
        (Socket socket, String value, Function onChangeInput) async {
      ProfileUser userP = await SecureStorage().getUser();
      socket.emit("messageBot",
          jsonEncode({"text": value, "context": userP.customerId}));
      onChangeInput(value);
    };

    Function onTapComponent = (value) async {
      await sendMessage(socket, value, onChangeInput);
    };

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

    Component = ComponentForText(listMessage, context, onTapComponent);
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
                        SkipContextBtn(
                          ontap: () {
                            chatbotProvider.clearChatbotList();
                          },
                        )
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
                    itemCount: listMessage.length + 1,
                    itemBuilder: ((context, index) {
                      if (index == listMessage.length) return Component;
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
                  await sendMessage(socket, value, onChangeInput);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
