import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/models/register/register.dart';
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

  Future<dynamic> getStopbang() async {
    var header = await Constants.requestHeadersToken();
    ProfileUser userP = await SecureStorage().getUser();
    final response = await http.get(
      Uri.parse(
          "${Constants.baseUrl}${customerRoute}stopbang/${userP.customerId}"),
      headers: header,
    );

    return response;
  }

  Future<dynamic> addUserOther(RegisterCustomerOther otherUser) async {
    var header = await Constants.requestHeadersToken();
    final response = await http.post(
      Uri.parse("${Constants.baseUrl}${customerRoute}other"),
      headers: header,
      body: jsonEncode(
        otherUser.toJson(),
      ),
    );
    debugPrint(response.body);
    return response;
  }

  Future<dynamic> getUserOther() async {
    var header = await Constants.requestHeadersToken();
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}${customerRoute}other"),
      headers: header,
    );
    debugPrint(response.body);
    return response;
  }

  Future<ProfileUser> getProfile() async {
    var header = await Constants.requestHeadersToken();
    ProfileUser userStore = await SecureStorage().getUser();
    final response = await http.get(
        Uri.parse(
            '${Constants.baseUrl}${customerRoute}${userStore.customerId}'),
        headers: header);
    debugPrint(response.body);
    if (response.statusCode == HttpStatus.ok) {
      final body = jsonDecode(response.body)['data'];
      ProfileUser p = new ProfileUser(
          id: body['user']['_id'],
          firstName: body['firstName'],
          lastName: body['lastName'],
          email: body['user']['email'],
          phone: body['phoneNumber'],
          dob: body['phoneNumber'],
          gender: body['gender'],
          nationality: body['nationality'] ?? "",
          customerId: body['_id']);

      await SecureStorage().saveCustomer(user: p);
      // ProfileUser a = ProfileUser.fromJson(body);
      return p;
    }

    throw Exception(BaseResponse.fromJson(jsonDecode(response.body)).message);
  }
}
