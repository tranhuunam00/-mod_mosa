import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/blocs/forgot/forgot.state.dart';
import 'package:mod_do_an/blocs/forgot/forgot_event.dart';

import 'package:mod_do_an/models/response/base_response.dart';
import 'package:mod_do_an/repositories/authentication_repository.dart';
import 'package:mod_do_an/storage/secure_storge.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> {
  final AuthenticationRepository authenticationRepository;

  ForgotBloc({required this.authenticationRepository})
      : super(ForgotInitialState());

  @override
  Stream<ForgotState> mapEventToState(ForgotEvent event) async* {
    if (event is ForgotWithEmailEvent) {
      yield* _mapForgotWithEmailToState(event);
    }
  }

  Stream<ForgotState> _mapForgotWithEmailToState(
      ForgotWithEmailEvent event) async* {
    yield ForgotLoadingState();

    try {
      final response =
          await authenticationRepository.forgotWithEmail(email: event.email);
      print(jsonDecode(response.body));
      BaseResponse baseResponse =
          BaseResponse.fromJson(jsonDecode(response.body));

      if (baseResponse.success) {
        SecureStorage().saveToken(token: baseResponse.data!['token']);
        yield ForgotSuccessState();
      } else {
        yield ForgotFailState(message: baseResponse.message);
        //TODO
      }
    } catch (error) {
      debugPrint("ForgotErrorState -> " + error.toString());
      yield ForgotErrorState(error: error.toString());
    }
  }
}
