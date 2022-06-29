import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/images.dart';
import 'package:mod_do_an/ui/components/cart/cart_quiz.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController controllerPage = PageController();

  @override
  Widget build(BuildContext context) {
    int _page = 0;
    List<int> a = [1, 2, 3, 4, 5];
    List<Widget> list = [];

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
                  children: [
                    CircleAvatar(
                      radius: 5.w,
                    ),
                    CircleAvatar(
                      radius: 5.w,
                    ),
                    CircleAvatar(
                      radius: 15.w,
                    ),
                    CircleAvatar(
                      radius: 5.w,
                    )
                  ],
                ),
              )),
            ),
            Expanded(
              flex: 1,
              child: PageView(
                controller: controllerPage,
                onPageChanged: (page) {
                  print(page);
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
