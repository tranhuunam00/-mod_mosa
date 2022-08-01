import 'package:equatable/equatable.dart';
import 'package:mod_do_an/models/register/register.dart';
import 'package:mod_do_an/models/user/stopBang.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object> get props => [];
}

class CreateStopBangEvent extends CustomerEvent {
  final StopBangModel stopbang;

  const CreateStopBangEvent({required this.stopbang});
}

class GetStopBangEvent extends CustomerEvent {
  const GetStopBangEvent();
}

class AddUserOtherEvent extends CustomerEvent {
  final RegisterCustomerOther otherUser;

  const AddUserOtherEvent({required this.otherUser});
}
