import 'package:equatable/equatable.dart';
import 'package:mod_do_an/models/register/register.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateStudentInitialEvent extends RegisterEvent {}

class CreateUserEvent extends RegisterEvent {
  final Register register;

  const CreateUserEvent({required this.register});
}
