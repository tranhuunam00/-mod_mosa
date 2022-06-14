import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/models/register/register.dart';

class RegisterService {
  static const String registerRoute = 'students/';
  Future<dynamic> createStudent(Register register) async {
    var header = Constants.requestHeaders;
    final response = await http.post(
      Uri.parse("${Constants.baseUrl}${registerRoute}register"),
      headers: header,
      body: jsonEncode(
        register.toJson(),
      ),
    );
    debugPrint(response.body);
    return response;
  }
}
