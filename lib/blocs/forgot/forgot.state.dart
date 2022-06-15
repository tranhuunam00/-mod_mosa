import 'package:equatable/equatable.dart';

abstract class ForgotState extends Equatable {
  const ForgotState();

  @override
  List<Object> get props => [];
}

class ForgotInitialState extends ForgotState {}

class ForgotLoadingState extends ForgotState {}

class ForgotSuccessState extends ForgotState {
  ForgotSuccessState();

  @override
  List<Object> get props => [];
}

class ForgotFailState extends ForgotState {
  final String message;

  const ForgotFailState({required this.message});
}

class ForgotErrorState extends ForgotState {
  final String error;

  const ForgotErrorState({required this.error});
}
