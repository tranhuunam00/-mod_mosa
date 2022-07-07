import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/models/response/base_response.dart';
import 'package:mod_do_an/models/user/stopBang.dart';
import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/storage/secure_storge.dart';

class CustomerService {
  static const String customerRoute = 'customers/';
  Future<dynamic> createStopbang(StopBangModel stopbang) async {
    var header = await Constants.requestHeadersToken();
    final response = await http.post(
      Uri.parse("${Constants.baseUrl}${customerRoute}stopbang"),
      headers: header,
      body: jsonEncode(
        stopbang.toJson(),
      ),
    );
    debugPrint(response.body);
    return response;
  }
}
