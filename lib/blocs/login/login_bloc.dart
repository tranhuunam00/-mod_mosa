import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/blocs/login/login_event.dart';
import 'package:mod_do_an/blocs/login/login_state.dart';
import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/repositories/authentication_repository.dart';
import 'package:mod_do_an/models/response/base_response.dart';
import 'package:mod_do_an/storage/secure_storge.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository authenticationRepository;

  LoginBloc({required this.authenticationRepository})
      : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithEmailEvent) {
      yield* _mapLoginWithEmailToState(event);
    }
  }

  Stream<LoginState> _mapLoginWithEmailToState(
      LoginWithEmailEvent event) async* {
    yield LoginLoadingState();

    try {
      final response = await authenticationRepository.loginWithEmail(
          email: event.email, password: event.password);
      print(jsonDecode(response.body));
      BaseResponse baseResponse =
          BaseResponse.fromJson(jsonDecode(response.body));

      if (baseResponse.success) {
        ProfileUser user = ProfileUser.fromJson(baseResponse.data!['user']);

        SecureStorage().saveToken(token: baseResponse.data!['token']);
        SecureStorage().saveCustomer(user: user);

        yield LoginSuccessState(role: baseResponse.data!['user']['role']);
      } else {
        yield LoginFailState(message: baseResponse.message);
        //TODO
      }
    } catch (error) {
      debugPrint("LoginErrorState -> " + error.toString());
      yield LoginErrorState(error: error.toString());
    }
  }
}
