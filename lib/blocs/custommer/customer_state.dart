import 'package:equatable/equatable.dart';
import 'package:mod_do_an/models/user/user.dart';

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

class AddUserOtherSuccess extends CustomerState {}

class AddUserOtherFail extends CustomerState {
  final String message;

  const AddUserOtherFail({required this.message});
}

class GetUserOtherSuccess extends CustomerState {
  final List<ProfileUser> listUser;
  const GetUserOtherSuccess({required this.listUser});
}

class GetUserOtherFail extends CustomerState {
  final String message;

  const GetUserOtherFail({required this.message});
}
