import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginWithEmailEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginWithEmailEvent({required this.email, required this.password});
}

class LoginTestEvent extends LoginEvent {}
