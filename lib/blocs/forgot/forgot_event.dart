import 'package:equatable/equatable.dart';

abstract class ForgotEvent extends Equatable {
  const ForgotEvent();

  @override
  List<Object> get props => [];
}

class ForgotWithEmailEvent extends ForgotEvent {
  final String email;

  const ForgotWithEmailEvent({required this.email});
}
