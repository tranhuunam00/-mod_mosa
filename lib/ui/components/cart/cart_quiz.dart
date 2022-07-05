import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/component/input_field/text_input_label.dart';
import 'package:mod_do_an/component/text/text_bold.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/config/images.dart';
import 'package:mod_do_an/models/user/stopBang.dart';
import 'package:mod_do_an/ui/components/background.dart';
import 'package:mod_do_an/ui/components/button/inkwell_custom.dart';
import 'package:mod_do_an/utils/dismiss_keyboard.dart';

class CartQuiz extends StatelessWidget {
  final String value;
  final StopBangQuestionModel stopbang;
  final Function onChange;

  const CartQuiz(
      {Key? key,
      required this.value,
      required this.stopbang,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    // return Container();
    return DismissKeyboard(
      child: ListView(children: [
        Container(
          height: 400.h,
          alignment: Alignment.center,
          child: Card(
            color: AppColors.grey300,
            elevation: 0.3,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Background(
              urlBackground: stopbang.urlImg,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: TextBold(title: stopbang.title),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 300,
                      child: Center(
                          child: Text(
                        stopbang.content,
                        style: TextStyle(
                            backgroundColor: Colors.white,
                            letterSpacing: 0.4,
                            height: 2.h,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          child: stopbang.title != "Cân nặng" && stopbang.title != "Chiều cao"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkwellStyle(
                        label: "YES",
                        onTap: () {
                          onChange(stopbang, "true");
                        },
                        color: (value == "true")
                            ? AppColors.yesColor
                            : AppColors.yesColorOpa,
                        width: (value == "true") ? 200 : 140,
                        icon: (value == "true") ? Icons.accessible : null),
                    InkwellStyle(
                        label: "NO",
                        onTap: () {
                          onChange(stopbang, "false");
                        },
                        color: (value == "false")
                            ? AppColors.noColor
                            : AppColors.noColorOpa,
                        width: (value == "false") ? 200 : 140,
                        icon: (value == "false") ? Icons.accessible : null),
                  ],
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: SizedBox(
                      child: TextInputLabel(
                        controller: controller,
                        initialValue: value,
                        labelText: "Cân nặng",
                        colorBorderSide: Colors.black,
                        hintText: "Đơn vị cm ...",
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          print(text);
                          onChange(stopbang, text.toString());
                        },
                      ),
                    ),
                  ),
                ),
        ),
      ]),
    );
  }
}
