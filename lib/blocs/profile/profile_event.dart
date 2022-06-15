import 'package:equatable/equatable.dart';
import 'package:mod_do_an/models/user/user.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final ProfileUser profileUser;
  final String? imagePath;

  const UpdateProfileEvent(
      {required this.profileUser, required this.imagePath});
}

class UpdatePasswordEvent extends ProfileEvent {
  final String currentPassword;
  final String newPassword;

  const UpdatePasswordEvent(
      {required this.currentPassword, required this.newPassword});
}
