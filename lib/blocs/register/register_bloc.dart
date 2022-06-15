import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/blocs/register/register_event.dart';
import 'package:mod_do_an/blocs/register/register_state.dart';
import 'package:mod_do_an/models/response/base_response.dart';
import 'package:mod_do_an/repositories/register_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required this.registerRepository})
      : super(CreateStudentInitialState());
  final RegisterRepository registerRepository;

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is CreateStudentEvent) {
      yield* _mapCreateRegisterToState(event);
    }
  }

  Stream<RegisterState> _mapCreateRegisterToState(
      CreateStudentEvent event) async* {
    yield CreateStudentLoadingState();

    try {
      final res = await registerRepository.createStudent(event.register);
      if (res.statusCode == HttpStatus.created) {
        yield CreateStudentSuccess();
      } else {
        yield CreateStudentFail(
            message: BaseResponse.fromJson(jsonDecode(res.body)).message);
      }
    } catch (e) {
      debugPrint("CreateRegister: error -> ${e.toString()}");
      yield CreateStudentFail(message: e.toString());
    }
  }
}
