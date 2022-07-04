import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/config/images.dart';
import 'package:mod_do_an/ui/components/cart/cart_quiz.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController controllerPage = PageController();
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> circleHead = [];

    Constants.listStopBang.forEach((item) {
      int i = Constants.listStopBang.indexOf(item);
      print(i);
      print(_page);
      return circleHead.add(
        CircleAvatar(
          radius: i == _page ? 15.w : 5.w,
        ),
      );
    });
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
                children: const <Widget>[
                  CartQuiz(
                    value: true,
                    child: Center(),
                  ),
                  CartQuiz(
                    value: false,
                    child: Center(),
                  ),
                  CartQuiz(
                    child: Center(),
                  ),
                  CartQuiz(
                    child: Center(),
                  ),
                  CartQuiz(
                    child: Center(),
                  ),
                  CartQuiz(
                    child: Center(),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
