import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/services/customer_service.dart';

class ProfileRepository {
  final CustomerService customerService = CustomerService();

  Future<ProfileUser> getProfile() async {
    ProfileUser profileUser = await customerService.getProfile();
    return profileUser;
  }
}
