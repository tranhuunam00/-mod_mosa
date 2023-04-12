import 'package:flutter/material.dart';
import 'package:mod_do_an/component/styles/appbar.dart';

import '../../config/constants.dart';

class SettingTemScreen extends StatefulWidget {
  const SettingTemScreen({Key? key}) : super(key: key);

  @override
  State<SettingTemScreen> createState() => _SettingTemScreenState();
}

class _SettingTemScreenState extends State<SettingTemScreen> {
  @override
  Widget build(BuildContext context) {
    // List<String> labels = ['0', '20', '40', '60', '80', '100'];
    //final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appBarStyle("Cài đặt khác"),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Cài đặt chính',
                  style: TextStyle(
                    color: Color.fromARGB(255, 138, 112, 112),
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
                                      Colors.green, // Đặt màu nền cho icon
                                  radius: 20, // Đặt bán kính của hình tròn
                                  child: Icon(
                                    Icons
                                        .notifications, // Icon hiển thị bên trong hình tròn
                                    color: Colors.white, // Đặt màu cho icon
                                    size: 20, // Đặt kích thước cho icon
                                  ),
                                ),
                              ),
                              Text(
                                'Nhạc chuông',
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
                      Navigator.of(context)
                        ..pushNamed(
                          Constants.highlowScreen,
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
                                      Colors.purple, // Đặt màu nền cho icon
                                  radius: 20, // Đặt bán kính của hình tròn
                                  child: Icon(
                                    Icons
                                        .ac_unit, // Icon hiển thị bên trong hình tròn
                                    color: Colors.white, // Đặt màu cho icon
                                    size: 20, // Đặt kích thước cho icon
                                  ),
                                ),
                              ),
                              Text(
                                'Khoảng đo',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                          Container(
                            child: Row(children: [
                              Text(
                                ' ° C',
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
                                        .wifi, // Icon hiển thị bên trong hình tròn
                                    color: Colors.white, // Đặt màu cho icon
                                    size: 20, // Đặt kích thước cho icon
                                  ),
                                ),
                              ),
                              Text(
                                'Mạng',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                          Container(
                            child: Row(children: [
                              Text(
                                'Chỉ Wifi',
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
                                      Colors.grey, // Đặt màu nền cho icon
                                  radius: 20, // Đặt bán kính của hình tròn
                                  child: Icon(
                                    Icons
                                        .settings_input_component, // Icon hiển thị bên trong hình tròn
                                    color: Colors.white, // Đặt màu cho icon
                                    size: 20, // Đặt kích thước cho icon
                                  ),
                                ),
                              ),
                              Text(
                                'Thông tin phần cứng',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                          Container(
                            child: Row(children: [
                              Text(
                                '',
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
                                      Colors.pink, // Đặt màu nền cho icon
                                  radius: 20, // Đặt bán kính của hình tròn
                                  child: Icon(
                                    Icons
                                        .priority_high, // Icon hiển thị bên trong hình tròn
                                    color: Colors.white, // Đặt màu cho icon
                                    size: 20, // Đặt kích thước cho icon
                                  ),
                                ),
                              ),
                              Text(
                                'Thông tin phần mềm',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                          Container(
                            child: Row(children: [
                              Text(
                                'Phiên bản 1.0.0',
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
