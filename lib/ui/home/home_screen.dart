import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/provider/Chatbot.provider.dart';
import 'package:mod_do_an/repositories/profile_repository.dart';
import 'package:mod_do_an/storage/secure_storge.dart';
import 'package:mod_do_an/ui/chatbot/interface/message.dart';
import 'package:mod_do_an/ui/home/widget/courses_grid.dart';
import 'package:mod_do_an/ui/home/widget/planing_grid.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../component/side_menu/side_menu.dart';

class AnalyticScreen extends StatefulWidget {
  const AnalyticScreen({Key? key, required this.phoneNumber}) : super(key: key);
  final String phoneNumber;
  @override
  State<AnalyticScreen> createState() => _AnalyticScreenState();
}

class _AnalyticScreenState extends State<AnalyticScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final chatbotProvider =
          Provider.of<ChatbotProvider>(context, listen: false);
      Socket socket = io("http://3.95.239.60:5003", <String, dynamic>{
        "transports": ["websocket"],
        "autoConnect": true,
      });
      socket.on("returnBot", (data) {
        var jsonValue = json.decode(data);
        List<MessageModel> listMessage = chatbotProvider.chatbotList;
        setState(() {
          MessageModel newMessage = new MessageModel(
              type: TypeMessage.bot, text: jsonValue["value"]["response"]);
          chatbotProvider.addMessage(newMessage);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.grey, size: 28),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, right: 16, bottom: 5),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "http://drive.google.com/uc?export=view&id=1C_NsCEZlpWPBgIwlXrtAe4YA4MHh76xX"),
            ),
          )
        ],
      ),
      drawer: const SideMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Hello ",
                    style: TextStyle(color: AppColors.kDarkBlue, fontSize: 20),
                    children: [
                      TextSpan(
                        text: widget.phoneNumber,
                        style: TextStyle(
                            color: AppColors.kDarkBlue,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ", welcome !",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const PlaningGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
