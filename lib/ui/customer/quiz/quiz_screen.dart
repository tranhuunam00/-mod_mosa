import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/config/images.dart';
import 'package:mod_do_an/models/user/stopBang.dart';
import 'package:mod_do_an/services/toast.service.dart';
import 'package:mod_do_an/ui/components/button/inkwell_custom.dart';
import 'package:mod_do_an/ui/components/cart/cart_quiz.dart';
import 'package:mod_do_an/ui/components/table/table_stopbang.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController controllerPage = PageController();
  int _page = 0;
  List<bool?> valueAnswer = [null, null, null, null, null, null, null];
  @override
  Widget build(BuildContext context) {
    List<Widget> circleHead = [];
    List<Widget> cartQuiz = [];

    // function handle change value choose
    void onChange(stopbang, value) {
      int idx = Constants.listStopBang.indexOf(stopbang);
      valueAnswer[idx] = value;
      setState(() {});
    }

    Constants.listStopBang.forEach((item) {
      int i = Constants.listStopBang.indexOf(item);
      Color backGroundColor = Colors.white;
      if (valueAnswer[i] == true) backGroundColor = AppColors.yesColor;
      if (valueAnswer[i] == false) backGroundColor = AppColors.noColor;

      circleHead.add(
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: i == _page ? 16.w : 6.w,
          child: CircleAvatar(
            backgroundColor: backGroundColor,
            radius: i == _page ? 15.w : 5.w,
            child: Text(i == _page ? (i + 1).toString() : ""),
          ),
        ),
      );
      cartQuiz.add(CartQuiz(
        stopbang: item,
        value: valueAnswer[i],
        onChange: onChange,
      ));
    });

    cartQuiz.add(Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TableStopBang(
            valueAnswer: valueAnswer,
          ),
        ),
        InkwellStyle(
            label: "Submit",
            onTap: () {
              ToastService.showToast(
                  msg: "Please confirm data to be submitted",
                  backgroundColor: AppColors.errorBackgroundColor);
            })
      ],
    ));

    return Scaffold(
        appBar: AppBar(
          title: Text('Stop_Bang'),
          flexibleSpace: Image(
            image: AssetImage(AppImages.backgroundImageAppbar),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 70.h,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: circleHead,
                ),
              )),
            ),
            Expanded(
              flex: 1,
              child: PageView(
                  controller: controllerPage,
                  onPageChanged: (page) {
                    setState(() {
                      _page = page;
                    });
                  },
                  children: cartQuiz),
            ),
          ],
        ));
  }
}
