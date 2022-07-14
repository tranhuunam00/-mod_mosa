import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/blocs/sensor/sensor_event.dart';
import 'package:mod_do_an/blocs/sensor/sensor_state.dart';
import 'package:mod_do_an/models/response/base_response.dart';
import 'package:mod_do_an/repositories/sensor_repository.dart';

class SensorBloc extends Bloc<SensorEvent, SensorState> {
  final SensorRepository sensorRepository;

  SensorBloc({required this.sensorRepository}) : super(SensorInitState());

  @override
  Stream<SensorState> mapEventToState(SensorEvent event) async* {
    if (event is CreateSensorAccelerometerEvent) {
      yield* _createAccelerometer(event);
    }
  }

  // create stopbang
  Stream<SensorState> _createAccelerometer(
      CreateSensorAccelerometerEvent event) async* {
    yield SensorLoadingState();
    try {
      final res = await sensorRepository.createAccelerometer(event.acc);
      if (res.statusCode == HttpStatus.created) {
        yield CreateSensorAccelerometerSuccess();
      } else {
        yield CreateSensorAccelerometerFail(
            message: BaseResponse.fromJson(jsonDecode(res.body)).message);
      }
    } catch (e) {
      debugPrint("CreateRegister: error -> ${e.toString()}");
      yield CreateSensorAccelerometerFail(message: e.toString());
    }
  }
}
