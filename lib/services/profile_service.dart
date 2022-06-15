import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/models/response/base_response.dart';
import 'package:mod_do_an/models/user/user.dart';

class ProfileService {
  static const String userRoute = 'users/';
  Future<ProfileUser> getProfile() async {
    var header = await Constants.requestHeadersToken();

    final response = await http.get(
        Uri.parse('${Constants.baseUrl}${userRoute}profile'),
        headers: header);
    debugPrint(response.body);
    if (response.statusCode == HttpStatus.ok) {
      final body = jsonDecode(response.body)['data']['profile'];
      return ProfileUser.fromJson(body);
    }
    print(response.statusCode);
    throw Exception(BaseResponse.fromJson(jsonDecode(response.body)).message);
  }

  Future<dynamic> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final header = await Constants.requestHeadersToken();
    final res = await http.put(
        Uri.parse("${Constants.baseUrl}${userRoute}password"),
        headers: header,
        body: jsonEncode(
            {"currentPassword": currentPassword, "newPassword": newPassword}));
    debugPrint(res.body);
    return res;
  }

  Future<dynamic> updateProfile(
      ProfileUser profileUser, String? imagePath) async {
    var header = await Constants.requestHeadersToken();
    final response = http.MultipartRequest(
      "PUT",
      Uri.parse("${Constants.baseUrl}${userRoute}profile"),
    );
    response.headers.addAll(header);
    print(profileUser.toJson());
    response.fields.addAll(profileUser.toJson());

    if (imagePath != null) {
      var a = await http.MultipartFile.fromPath('avatar', imagePath,
          contentType: MediaType('image', 'jpg'));
      response.files.add(a);
    }

    http.Response responses =
        await http.Response.fromStream(await response.send());
    return responses;
  }
}
