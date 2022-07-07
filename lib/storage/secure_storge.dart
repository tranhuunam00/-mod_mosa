import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = new FlutterSecureStorage();

  static const _tokenKey = 'TOKEN';

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
}
