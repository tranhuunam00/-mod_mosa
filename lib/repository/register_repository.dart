import 'package:mod_do_an/models/register/register.dart';
import 'package:mod_do_an/services/register_service.dart';

class RegisterRepository {
  final RegisterService registerService = RegisterService();

  Future<dynamic> createStudent(Register register) async {
    final res = await registerService.createStudent(register);
    return res;
  }
}
