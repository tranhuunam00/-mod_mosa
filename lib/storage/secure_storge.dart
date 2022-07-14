import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mod_do_an/models/user/user.dart';

class SecureStorage {
  final _storage = new FlutterSecureStorage();

  static const _tokenKey = 'TOKEN';

  static const _user = 'USER';

  Future<void> saveToken({required String token}) async {
    print("Đã lưu token");
    print(token);
    await _storage.write(key: _tokenKey, value: "Bearer " + token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    return _storage.delete(key: _tokenKey);
  }

  Future<void> deleteAll() async {
    return _storage.deleteAll();
  }

  Future<void> saveCustomer({required ProfileUser user}) async {
    await _storage.write(key: _user, value: user.toString());
  }

  Future<ProfileUser> getUser() async {
    String? userString = await _storage.read(key: _user);

    if (userString != null) {
      ProfileUser user = ProfileUser.fromJson(jsonDecode(userString!));
      return user;
    }
    return new ProfileUser(
        id: "",
        firstName: "",
        lastName: "",
        email: "",
        phone: "",
        dob: "",
        gender: "",
        nationality: "",
        customerId: "");
  }
}
