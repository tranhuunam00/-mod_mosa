import 'dart:ffi';

class AccelerometerModel {
  final double x;
  final double y;
  final double z;
  final DateTime time;
  AccelerometerModel(
      {required this.x, required this.y, required this.z, required this.time});
}

class AccelerometerChartModel {
  final double value;
  final DateTime time;
  AccelerometerChartModel({required this.value, required this.time});
}

class PositionCountModal {
  final int value;
  final String name;
  PositionCountModal({required this.value, required this.name});
}
