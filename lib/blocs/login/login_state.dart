import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String role;

  LoginSuccessState({required this.role});

  @override
  List<Object> get props => [role];
}

class LoginFailState extends LoginState {
  final String message;

  const LoginFailState({required this.message});
}

class LoginErrorState extends LoginState {
  final String error;

  const LoginErrorState({required this.error});
}
