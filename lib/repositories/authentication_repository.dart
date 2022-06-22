import 'package:mod_do_an/models/register/register.dart';
import 'package:mod_do_an/services/authentication_service.dart';

class AuthenticationRepository {
  Future<dynamic> loginWithEmail(
      {required String email, required String password}) async {
    return await AuthenticationService()
        .loginWithEmail(email: email, password: password);
  }

  Future<dynamic> forgotWithEmail({required String email}) async {
    return await AuthenticationService().forgotWithEmail(email: email);
  }

  Future<dynamic> creatUser(Register register) async {
    final res = await AuthenticationService().createUser(register);
    return res;
  }
}
