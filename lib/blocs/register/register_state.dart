import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateUserInitialState extends RegisterState {}

class CreateUserLoadingState extends RegisterState {}

class CreateUserSuccess extends RegisterState {}

class CreateUserFail extends RegisterState {
  final String message;

  const CreateUserFail({required this.message});
}
