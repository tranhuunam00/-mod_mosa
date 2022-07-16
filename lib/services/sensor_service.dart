import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/models/response/base_response.dart';
import 'package:mod_do_an/models/sensor/accelerometer.dart';
import 'package:mod_do_an/models/user/stopBang.dart';
import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/storage/secure_storge.dart';

class SensorService {
  static const String sensorRoute = 'sensors/';
  Future<dynamic> createAccelerometer(CreateAccelerometerModel acc) async {
    var header = await Constants.requestHeadersToken();
    final response = await http.post(
      Uri.parse("${Constants.baseUrl}${sensorRoute}create_accelerometer"),
      headers: header,
      body: jsonEncode(
        acc.toJson(),
      ),
    );
    debugPrint(response.body);
    return response;
  }
}
