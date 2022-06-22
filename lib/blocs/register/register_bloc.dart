import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/blocs/register/register_event.dart';
import 'package:mod_do_an/blocs/register/register_state.dart';
import 'package:mod_do_an/models/response/base_response.dart';
import 'package:mod_do_an/repositories/authentication_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required this.authenticationRepository})
      : super(CreateUserInitialState());
  final AuthenticationRepository authenticationRepository;

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is CreateUserEvent) {
      yield* _mapCreateRegisterToState(event);
    }
  }

  Stream<RegisterState> _mapCreateRegisterToState(
      CreateUserEvent event) async* {
    yield CreateUserLoadingState();
    print(event.register.phone);
    try {
      final res = await authenticationRepository.creatUser(event.register);
      if (res.statusCode == HttpStatus.created) {
        yield CreateUserSuccess();
      } else {
        yield CreateUserFail(
            message: BaseResponse.fromJson(jsonDecode(res.body)).message);
      }
    } catch (e) {
      debugPrint("CreateRegister: error -> ${e.toString()}");
      yield CreateUserFail(message: e.toString());
    }
  }
}
