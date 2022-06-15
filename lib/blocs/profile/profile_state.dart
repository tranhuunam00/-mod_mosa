import 'package:equatable/equatable.dart';
import 'package:mod_do_an/models/user/user.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final ProfileUser profileUser;

  const ProfileLoadedState({required this.profileUser});
}

class ProfileErrorState extends ProfileState {
  final String message;

  const ProfileErrorState({required this.message});
}

class UpdateProfileLoadingState extends ProfileState {}

class UpdateProfileSuccessState extends ProfileState {}

class UpdateProfileErrorState extends ProfileState {
  final String message;

  const UpdateProfileErrorState({required this.message});
}

class UpdatePasswordLoadingState extends ProfileState {}

class UpdatePasswordSuccessState extends ProfileState {}

class UpdatePasswordErrorState extends ProfileState {
  final String message;

  const UpdatePasswordErrorState({required this.message});
}
