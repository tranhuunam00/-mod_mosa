import 'package:mod_do_an/models/register/register.dart';
import 'package:mod_do_an/models/user/stopBang.dart';
import 'package:mod_do_an/services/customer_service.dart';

class CustomerRepository {
  final CustomerService customerService = CustomerService();

  Future<dynamic> createStopbang(StopBangModel stopbang) async {
    return await customerService.createStopbang(stopbang);
  }

  Future<dynamic> getStopbang() async {
    return await customerService.getStopbang();
  }

  Future<dynamic> addUserOther(RegisterCustomerOther userOther) async {
    return await customerService.addUserOther(userOther);
  }

  Future<dynamic> getUserOther() async {
    return await customerService.getUserOther();
  }
}
