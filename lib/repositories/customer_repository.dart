import 'package:mod_do_an/models/user/stopBang.dart';
import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/services/customer_service.dart';
import 'package:mod_do_an/services/profile_service.dart';

class CustomerRepository {
  final CustomerService customerService = CustomerService();

  Future<dynamic> createStopbang(StopBangModel stopbang) async {
    return await customerService.createStopbang(stopbang);
  }

  Future<dynamic> getStopbang() async {
    return await customerService.getStopbang();
  }
}
