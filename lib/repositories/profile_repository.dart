import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/services/profile_service.dart';

class ProfileRepository {
  final ProfileService profileService = ProfileService();

  Future<ProfileUser> getProfile() async {
    ProfileUser profileUser = await profileService.getProfile();
    return profileUser;
  }

  Future<dynamic> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await profileService.changePassword(
        currentPassword: currentPassword, newPassword: newPassword);
  }

  Future<dynamic> updateProfile(
      ProfileUser profileUser, String? imagePath) async {
    final res = await profileService.updateProfile(profileUser, imagePath);
    return res;
  }
}
