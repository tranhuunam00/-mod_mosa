import 'package:equatable/equatable.dart';

abstract class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object> get props => [];
}

class CustomerInitState extends CustomerState {}

class CustomerLoadingState extends CustomerState {}

class CreateStopbangSuccess extends CustomerState {}

class CreateStopbangFail extends CustomerState {
  final String message;

  const CreateStopbangFail({required this.message});
}

class GetStopbangSuccess extends CustomerState {}

class GetStopbangFail extends CustomerState {
  final String message;

  const GetStopbangFail({required this.message});
}
