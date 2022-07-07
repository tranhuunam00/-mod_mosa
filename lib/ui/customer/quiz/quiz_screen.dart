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
  List<String> valueAnswer = ["", "", "", "", "", "", ""];
  @override
  Widget build(BuildContext context) {
    List<Widget> circleHead = [];
    List<Widget> cartQuiz = [];

    // function handle change value choose
    void onChange(StopBangQuestionModel stopbang, String value) {
      int idx = Constants.listStopBang.indexOf(stopbang);
      valueAnswer[idx] = value;
      setState(() {});
    }

    void onChangePage(StopBangQuestionModel stopbang) {
      int idx = Constants.listStopBang.indexOf(stopbang);
      controllerPage.jumpToPage(idx + 1);
    }

    Constants.listStopBang.forEach((item) {
      int i = Constants.listStopBang.indexOf(item);
      Color backGroundColor = Color.fromARGB(255, 171, 210, 228);
      if ((valueAnswer[i] == "true" || valueAnswer[i] != "false") &&
          valueAnswer[i] != "") backGroundColor = AppColors.yesColor;
      if (valueAnswer[i] == "false") backGroundColor = AppColors.noColor;

      // add chấm tròn trên đầu
      circleHead.add(circle(i, _page, backGroundColor));

      // add children page view
      cartQuiz.add(CartQuiz(
        stopbang: item,
        value: valueAnswer[i],
        onChange: onChange,
        onChangePage: onChangePage,
      ));
    });

    // add thêm trang tổng hợp
    cartQuiz.add(
      TableStopBang(
        valueAnswer: valueAnswer,
      ),
    );

    // add  vòng tròn tổng hợp

    circleHead.add(circle(circleHead.length + 1, _page, AppColors.yesColor));

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

  Widget circle(int i, int _page, Color backGroundColor) {
    return InkWell(
      onTap: () {
        setState(() {
          controllerPage.jumpToPage(i);
        });
      },
      child: SizedBox(
        height: 30.w,
        width: 30.w,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: i == _page || i == 8 ? 16.w : 6.w,
          child: CircleAvatar(
            backgroundColor: backGroundColor,
            radius: i == _page || i == 8 ? 15.w : 5.w,
            child: Text(i == _page ? (i + 1).toString() : ""),
          ),
        ),
      ),
    );
  }
}
