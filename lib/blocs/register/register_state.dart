import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateStudentInitialState extends RegisterState {}

class CreateStudentLoadingState extends RegisterState {}

class CreateStudentSuccess extends RegisterState {}

class CreateStudentFail extends RegisterState {
  final String message;

  const CreateStudentFail({required this.message});
}


