import 'package:equatable/equatable.dart';
import 'package:mod_do_an/models/sensor/accelerometer.dart';

abstract class SensorEvent extends Equatable {
  const SensorEvent();

  @override
  List<Object> get props => [];
}

class CreateSensorAccelerometerEvent extends SensorEvent {
  final CreateAccelerometerModel acc;

  const CreateSensorAccelerometerEvent({required this.acc});
}
