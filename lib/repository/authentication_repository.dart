import 'package:mod_do_an/services/authentication_service.dart';

class AuthenticationRepository {
  Future<dynamic> loginWithEmail(
      {required String email, required String password}) async {
    return await AuthenticationService()
        .loginWithEmail(email: email, password: password);
  }
}
