import 'package:equatable/equatable.dart';

abstract class SensorState extends Equatable {
  const SensorState();

  @override
  List<Object> get props => [];
}

class SensorInitState extends SensorState {}

class SensorLoadingState extends SensorState {}

class CreateSensorAccelerometerSuccess extends SensorState {}

class CreateSensorAccelerometerFail extends SensorState {
  final String message;

  const CreateSensorAccelerometerFail({required this.message});
}
