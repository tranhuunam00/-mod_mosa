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
    }
    if (event is UpdateProfileEvent) {
      yield* _updateProfile(event);
    }
  }

  Stream<ProfileState> _mapGetProfileToState(GetProfileEvent event) async* {
    yield ProfileLoadingState();

    try {
      final data = await profileRepository.getProfile();

      yield ProfileLoadedState(profileUser: data);
    } catch (e) {
      debugPrint("UpdateProfile: error -> ${e.toString()}");
      yield ProfileErrorState(message: e.toString());
    }
  }

  Stream<ProfileState> _updateProfile(UpdateProfileEvent event) async* {
    yield UpdateProfileLoadingState();

    try {
      print(event.profileUser);
      final userUpdate =
          await profileRepository.updateProfile(event.profileUser);
      print("update success");
      yield UpdateProfileSuccessState();
    } catch (e) {
      debugPrint("UpdateProfile: error -> ${e.toString()}");
      yield UpdateProfileErrorState(message: e.toString());
    }
  }
}
