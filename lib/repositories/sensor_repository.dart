import 'package:mod_do_an/models/sensor/accelerometer.dart';
import 'package:mod_do_an/services/profile_service.dart';
import 'package:mod_do_an/services/sensor_service.dart';

class SensorRepository {
  final SensorService sensorService = new SensorService();

  Future<dynamic> createAccelerometer(CreateAccelerometerModel acc) async {
    return await sensorService.createAccelerometer(acc);
  }
}
