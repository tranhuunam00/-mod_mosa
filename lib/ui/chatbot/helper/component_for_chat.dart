import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mod_do_an/component/card/cart_feature.dart';
import 'package:mod_do_an/ui/chatbot/interface/message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget LayerParent(Widget children, BuildContext context) {
  return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 201, 240, 226).withOpacity(0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0, top: 50),
                child: children,
              ))));
}

Widget ComponentForText(
    List<MessageModel> listMessage, BuildContext context, Function onTap) {
  if (listMessage.length > 0 &&
      listMessage[listMessage.length - 1].text == "Bạn cần giúp đỡ gì không?") {
    return LayerParent(
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Lựa chọn của bạn (nếu có câu trả lời khác ngoài có hoặc không thì vui lòng nhập tin nhắn)",
                style: TextStyle(fontSize: 16.w),
              ),
            ),
            SizedBox(
              height: 30.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardFeature(
                  onPress: () {
                    onTap("Trợ giúp vấn đề sức khỏe");
                  },
                  textCard: "Trợ giúp vấn đề sức khỏe",
                  iconCard: Icon(
                    FontAwesomeIcons.heartPulse,
                    size: 40,
                    color: Color.fromARGB(255, 241, 68, 97),
                  ),
                ),
                CardFeature(
                  onPress: () {
                    onTap("Trợ giúp vấn đề sức khỏe");
                  },
                  textCard: "Trợ giúp vấn đề sức khỏe",
                  iconCard: Icon(
                    FontAwesomeIcons.phone,
                    size: 40,
                    color: Color.fromARGB(255, 39, 6, 228),
                  ),
                ),
              ],
            ),
          ],
        ),
        context);
  }

  // trả lời có hoặc không
  if (listMessage.length > 0 &&
      listMessage[listMessage.length - 1].text.indexOf("không?") != -1) {
    return LayerParent(
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Lựa chọn của bạn (nếu có câu trả lời khác ngoài có hoặc không thì vui lòng nhập tin nhắn)",
                style: TextStyle(fontSize: 16.w),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardFeature(
                  onPress: () {
                    onTap("Có");
                  },
                  textCard: "Có",
                  iconCard: Icon(
                    Icons.check,
                    size: 40,
                    color: Color.fromARGB(255, 17, 210, 14),
                  ),
                ),
                CardFeature(
                  onPress: () {
                    onTap("Không");
                  },
                  textCard: "Không",
                  iconCard: Icon(
                    Icons.radio_button_unchecked,
                    size: 40,
                    color: Color.fromARGB(255, 235, 16, 16),
                  ),
                )
              ],
            ),
          ],
        ),
        context);
  }

  return Container();
}
