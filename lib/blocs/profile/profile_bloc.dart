import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/blocs/profile/profile_event.dart';
import 'package:mod_do_an/blocs/profile/profile_state.dart';
import 'package:mod_do_an/models/response/base_response.dart';
import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/repositories/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.profileRepository}) : super(ProfileInitialState());
  final ProfileRepository profileRepository;

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is GetProfileEvent) {
      yield* _mapGetProfileToState(event);
    } else if (event is UpdateProfileEvent) {
      yield* _mapUpdateProfileToState(event);
    } else if (event is UpdatePasswordEvent) {
      yield* _mapUpdatePasswordToState(event);
    }
  }

  Stream<ProfileState> _mapGetProfileToState(GetProfileEvent event) async* {
    yield ProfileLoadingState();

    try {
      // final data = await profileRepository.getProfile();
      ProfileUser data = ProfileUser(
          id: "",
          customerId: "",
          nationality: "",
          gender: "",
          firstName: "Nam",
          lastName: "Trần",
          dob: "2022-12-12",
          email: "tranhuunam23022000@gmail.com",
          avatarUrl:
              "https://scontent.fhan2-2.fna.fbcdn.net/v/t39.30808-6/288069206_1742506939436615_9172659687668694776_n.jpg?stp=dst-jpg_s600x600&_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=F3McEvp_FvcAX-v2jLB&_nc_ht=scontent.fhan2-2.fna&oh=00_AT9zHlVucWu8q2jGQx1J7vAMo7yGe_y3ZV6o7Ude9DVMng&oe=62AE55C7",
          phone: "0961766816");
      yield ProfileLoadedState(profileUser: data);
    } catch (e) {
      debugPrint("UpdateProfile: error -> ${e.toString()}");
      yield ProfileErrorState(message: e.toString());
    }
  }

  Stream<ProfileState> _mapUpdateProfileToState(
      UpdateProfileEvent event) async* {
    yield UpdateProfileLoadingState();

    try {
      final res = await profileRepository.updateProfile(
          event.profileUser, event.imagePath);
      print(res.statusCode);
      if (res.statusCode == HttpStatus.ok) {
        yield UpdateProfileSuccessState();
      } else {
        yield UpdateProfileErrorState(
            message: BaseResponse.fromJson(jsonDecode(res.body)).message);
      }
    } catch (e) {
      debugPrint("UpdateProfile: error -> ${e.toString()}");
      yield UpdateProfileErrorState(message: e.toString());
    }
  }

  Stream<ProfileState> _mapUpdatePasswordToState(
      UpdatePasswordEvent event) async* {
    yield UpdatePasswordLoadingState();

    try {
      final res = await profileRepository.changePassword(
          currentPassword: event.currentPassword,
          newPassword: event.newPassword);
      if (res.statusCode == HttpStatus.ok) {
        yield UpdatePasswordSuccessState();
      } else {
        yield UpdatePasswordErrorState(
            message: BaseResponse.fromJson(jsonDecode(res.body)).message);
      }
    } catch (e) {
      yield UpdatePasswordErrorState(message: e.toString());
    }
  }
}
