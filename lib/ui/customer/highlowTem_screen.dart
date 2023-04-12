import 'package:flutter/material.dart';
import 'package:mod_do_an/component/styles/appbar.dart';

import '../../config/constants.dart';

class highlowTemScreen extends StatefulWidget {
  const highlowTemScreen({Key? key}) : super(key: key);

  @override
  State<highlowTemScreen> createState() => _highlowTemScreenState();
}

class _highlowTemScreenState extends State<highlowTemScreen> {
  @override
  Widget build(BuildContext context) {
    // List<String> labels = ['0', '20', '40', '60', '80', '100'];
    //final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appBarStyle("Cài đặt nhiệt độ cao/thấp"),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.green,
                  // width: 200,
                  height: 1,
                ), //dấu gạch ngang
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      print("ấn vào");
                      Navigator.of(context)
                        ..pushNamed(
                          Constants.highTemScreen,
                        );
                    },
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: CircleAvatar(
                                  backgroundColor:
                                      Colors.red, // Đặt màu nền cho icon
                                  radius: 20, // Đặt bán kính của hình tròn
                                  child: Icon(
                                    Icons
                                        .create, // Icon hiển thị bên trong hình tròn
                                    color: Colors.white, // Đặt màu cho icon
                                    size: 20, // Đặt kích thước cho icon
                                  ),
                                ),
                              ),
                              Text(
                                'Giá trị báo động nhiệt độ cao',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                          Container(
                            child: Row(children: [
                              Text(
                                'Mặc định',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 138, 112, 112),
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_right,
                                  color: Color.fromARGB(255, 138, 112, 112),
                                  size: 24)
                            ]),
                          )
                        ]),
                  ),
                ),
                Container(
                  color: Colors.green,
                  // width: 200,
                  height: 1,
                ), //dấu gạch ngang

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      print("ấn vào");
                      Navigator.of(context)
                        ..pushNamed(
                          Constants.lowTemScreen,
                        );
                    },
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: CircleAvatar(
                                  backgroundColor:
                                      Colors.blue, // Đặt màu nền cho icon
                                  radius: 20, // Đặt bán kính của hình tròn
                                  child: Icon(
                                    Icons
                                        .create, // Icon hiển thị bên trong hình tròn
                                    color: Colors.white, // Đặt màu cho icon
                                    size: 20, // Đặt kích thước cho icon
                                  ),
                                ),
                              ),
                              Text(
                                'Giá trị báo động nhiệt độ thấp',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                          Container(
                            child: Row(children: [
                              Text(
                                'Mặc định',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 138, 112, 112),
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_right,
                                  color: Color.fromARGB(255, 138, 112, 112),
                                  size: 24)
                            ]),
                          )
                        ]),
                  ),
                ),
                Container(
                  color: Colors.green,
                  // width: 200,
                  height: 1,
                ), //dấu gạch ngang
              ]),
        ));
  }
}
