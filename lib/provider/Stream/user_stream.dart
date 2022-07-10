import 'dart:async';

import 'package:mod_do_an/models/bleModel.dart';

class MyStream {
  BluetoothModel bluetoothS = BluetoothModel(bluetoothDevice: null);

  StreamController<BluetoothModel> BLEController =
      new StreamController<BluetoothModel>.broadcast();

  Stream<BluetoothModel> get userStream => BLEController.stream;

  void setBle(BluetoothModel deviceBle) {
    BLEController.sink.add(deviceBle);
  }

  void clearBle() {
    BLEController.sink.add(BluetoothModel(bluetoothDevice: null));
  }

  void dispose() {
    BLEController.close();
  }
}
