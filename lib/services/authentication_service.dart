import 'dart:convert';

import '../config/constants.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  Future<dynamic> loginWithEmail(
      {required String email, required String password}) async {
    print(password);
    String uri = "${Constants.baseUrl}${Constants.userRoute}login";

    var response = await http.post(Uri.parse(uri),
        headers: Constants.requestHeaders,
        body: jsonEncode({"email": email, "password": password}));
    return response;
  }

  Future<dynamic> forgotWithEmail({required String email}) async {
    String uri = "${Constants.baseUrl}${Constants.userRoute}forgot-password";

    var response = await http.post(Uri.parse(uri),
        headers: Constants.requestHeaders, body: jsonEncode({"email": email}));
    return response;
  }
}
