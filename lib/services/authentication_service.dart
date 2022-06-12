import 'dart:convert';

import '../configs/constants.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  Future<dynamic> loginWithEmail(
      {required String email, required String password}) async {
    String uri = "${Constants.baseUrl}${Constants.userRoute}login";

    var response = await http.post(Uri.parse(uri),
        headers: Constants.requestHeaders,
        body: jsonEncode({"email": email, "password": password}));
    return response;
  }
}
