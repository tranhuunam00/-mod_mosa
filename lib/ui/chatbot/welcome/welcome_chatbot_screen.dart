import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/storage/secure_storge.dart';
import 'package:mod_do_an/ui/home/home_screen.dart';

class WelcomeChatbotScreen extends StatefulWidget {
  const WelcomeChatbotScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeChatbotScreen> createState() => WelcomeChatbotScreenState();
}

class WelcomeChatbotScreenState extends State<WelcomeChatbotScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  double _opacity = 0;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 132, 255, 183),
                Color.fromARGB(255, 255, 207, 145),
              ],
            ),
          ),
          child: Center(
            child: AnimatedOpacity(
              duration: Duration(seconds: 3),
              opacity: _opacity,
              child: Container(
                width: 240.w,
                height: 300.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: Colors.white,
                ),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "MOSA",
                          style: TextStyle(
                              fontSize: 24.h, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        TextFormField(
                          controller: phoneController,
                          decoration:
                              InputDecoration(labelText: 'Số điện thoại'),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Vui lòng nhập số điện thoại';
                            }
                            return null;
                          },
                        ),
                        TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await SecureStorage().savePhoneNumber(
                                  phoneNumber: phoneController.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AnalyticScreen(
                                            phoneNumber: phoneController.text,
                                          )));
                            }
                          },
                          child: Text(
                            'Tiếp tục',
                            style: TextStyle(
                                fontSize: 18.w, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
