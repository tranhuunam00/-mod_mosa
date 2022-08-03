import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/blocs/authentication/authentication_event.dart';
import 'package:mod_do_an/blocs/authentication/authentication_state.dart';
import 'package:mod_do_an/blocs/custommer/customer_event.dart';
import 'package:mod_do_an/blocs/custommer/customer_state.dart';
import 'package:mod_do_an/models/response/base_response.dart';
import 'package:mod_do_an/models/user/stopBang.dart';
import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/repositories/customer_repository.dart';
import 'package:mod_do_an/storage/secure_storge.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;

  CustomerBloc({required this.customerRepository}) : super(CustomerInitState());

  @override
  Stream<CustomerState> mapEventToState(CustomerEvent event) async* {
    if (event is CreateStopBangEvent) {
      yield* _createStopbang(event);
    }
    if (event is GetStopBangEvent) {
      yield* _getStopbang(event);
    }
    if (event is AddUserOtherEvent) {
      yield* _addUserOther(event);
    }

    if (event is GetUserOtherEvent) {
      yield* _getUserOther();
    }
  }

  // create stopbang
  Stream<CustomerState> _createStopbang(CreateStopBangEvent event) async* {
    yield CustomerLoadingState();
    try {
      print(event.stopbang.customer);
      ProfileUser user = await SecureStorage().getUser();
      StopBangModel newStopbang = StopBangModel(
          snoring: event.stopbang.snoring,
          tired: event.stopbang.tired,
          observed: event.stopbang.observed,
          height: event.stopbang.height,
          pressure: event.stopbang.pressure,
          customer: user.customerId,
          weight: event.stopbang.weight,
          necksize: event.stopbang.necksize);
      final res = await customerRepository.createStopbang(newStopbang);
      if (res.statusCode == HttpStatus.created) {
        yield CreateStopbangSuccess();
      } else {
        yield CreateStopbangFail(
            message: BaseResponse.fromJson(jsonDecode(res.body)).message);
      }
    } catch (e) {
      debugPrint("CreateRegister: error -> ${e.toString()}");
      yield CreateStopbangFail(message: e.toString());
    }
  }

  Stream<CustomerState> _getStopbang(GetStopBangEvent event) async* {
    print("getstopbang");
    yield CustomerLoadingState();
    print("getstopbang2");

    try {
      final res = await customerRepository.getStopbang();
      print(res.statusCode);
      if (res.statusCode == HttpStatus.created) {
        yield GetStopbangSuccess();
      } else {
        yield GetStopbangFail(
            message: BaseResponse.fromJson(jsonDecode(res.body)).message);
      }
    } catch (e) {
      debugPrint("GetRegister: error -> ${e.toString()}");
      yield GetStopbangFail(message: e.toString());
    }
  }

  Stream<CustomerState> _addUserOther(AddUserOtherEvent event) async* {
    yield CustomerLoadingState();
    try {
      final res = await customerRepository.addUserOther(event.otherUser);
      if (res.statusCode == HttpStatus.created) {
        yield AddUserOtherSuccess();
      } else {
        yield AddUserOtherFail(
            message: BaseResponse.fromJson(jsonDecode(res.body)).message);
      }
    } catch (e) {
      debugPrint("CreateRegister: error -> ${e.toString()}");
      yield AddUserOtherFail(message: e.toString());
    }
  }

  Stream<CustomerState> _getUserOther() async* {
    yield CustomerLoadingState();
    try {
      final res = await customerRepository.getUserOther();

      if (res.statusCode == HttpStatus.ok) {
        BaseResponse baseResponse = BaseResponse.fromJson(jsonDecode(res.body));
        List<ProfileUser> listProfile = [];
        final listUserApi = baseResponse.data!['listCustomer'];
        for (int i = 0; i < listUserApi.length; i++) {
          ProfileUser p = new ProfileUser(
              id: listUserApi[i]['user'],
              firstName: listUserApi[i]['firstName'],
              lastName: listUserApi[i]['lastName'],
              email: "",
              phone: listUserApi[i]['phoneNumber'],
              dob: listUserApi[i]['dob'],
              gender: listUserApi[i]['gender'],
              nationality: "",
              customerId: listUserApi[i]['_id']);
          listProfile.add(p);
        }
        yield GetUserOtherSuccess(listUser: listProfile);
      } else {
        yield GetUserOtherFail(
            message: BaseResponse.fromJson(jsonDecode(res.body)).message);
      }
    } catch (e) {
      debugPrint("CreateRegister: error -> ${e.toString()}");
      yield GetUserOtherFail(message: e.toString());
    }
  }
}
