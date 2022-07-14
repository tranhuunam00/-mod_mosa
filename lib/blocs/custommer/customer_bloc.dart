import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/blocs/authentication/authentication_event.dart';
import 'package:mod_do_an/blocs/authentication/authentication_state.dart';
import 'package:mod_do_an/blocs/custommer/customer_event.dart';
import 'package:mod_do_an/blocs/custommer/customer_state.dart';
import 'package:mod_do_an/models/response/base_response.dart';
import 'package:mod_do_an/repositories/customer_repository.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;

  CustomerBloc({required this.customerRepository}) : super(CustomerInitState());

  @override
  Stream<CustomerState> mapEventToState(CustomerEvent event) async* {
    if (event is CreateStopBangEvent) {
      yield* _createStopbang(event);
    }
  }

  // create stopbang
  Stream<CustomerState> _createStopbang(CreateStopBangEvent event) async* {
    yield CustomerLoadingState();
    try {
      print(event.stopbang.customer);
      final res = await customerRepository.createStopbang(event.stopbang);
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
}
