import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:mod_do_an/component/card/cart_sensor.dart';
import 'package:mod_do_an/component/styles/border.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/config/images.dart';
import 'package:mod_do_an/models/sensor/accelerometer.dart';
import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/repositories/sensor_repository.dart';
import 'package:mod_do_an/storage/secure_storge.dart';
import 'package:mod_do_an/ui/components/background.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccelerometerScreen extends StatefulWidget {
  const AccelerometerScreen({Key? key, required this.server}) : super(key: key);
  final BluetoothDevice server;

  @override
  State<AccelerometerScreen> createState() => _AccelerometerScreenState();
}

class _AccelerometerScreenState extends State<AccelerometerScreen> {
  static final clientID = 0;
  BluetoothConnection? connection;
  bool isConnecting = true;
  bool get isConnected => (connection?.isConnected ?? false);
  bool isDisconnecting = false;
  String _messageBuffer = '';
  List<AccelerometerChartModel> listAccX =
      List<AccelerometerChartModel>.empty(growable: true);
  List<AccelerometerChartModel> listAccY =
      List<AccelerometerChartModel>.empty(growable: true);
  List<AccelerometerChartModel> listAccZ =
      List<AccelerometerChartModel>.empty(growable: true);
  late ChartSeriesController _chartSeriesControllerX;
  late ChartSeriesController _chartSeriesControllerY;
  late ChartSeriesController _chartSeriesControllerZ;
  List<PositionCountModal> positions = [
    PositionCountModal(value: 4, name: "ngửa"),
    PositionCountModal(value: 2, name: "sấp"),
    PositionCountModal(value: 5, name: "trái"),
    PositionCountModal(value: 7, name: "phải"),
  ];

  SensorRepository sensorRepository = new SensorRepository();
  @override
  void initState() {
    super.initState();
    Future.sync(() async {
      try {
        print(widget.server.address);
        print(widget.server.isConnected);

        BluetoothConnection _connection =
            await BluetoothConnection.toAddress(widget.server.address);
        setState(() {
          isConnecting = false;
          isDisconnecting = false;
        });

        connection = _connection;

        connection!.input!.listen(_onDataReceived).onDone(() {
          if (isDisconnecting) {
            print('Disconnecting locally!');
          } else {
            print('Disconnected remotely!');
          }
          if (this.mounted) {
            setState(() {});
          }
        });
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and disconnect
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (listAccX.length == 100) {
      Future.sync(() async {
        String valueData = "";
        for (int i = 0; i < 100; i++) {
          valueData += listAccX[i].value.toString();
          valueData += "%";
          valueData += listAccY[i].value.toString();
          valueData += "%";
          valueData += listAccZ[i].value.toString();
          valueData += "@";
          valueData += listAccX[i].time.toString();
          if (i != 99) valueData += "/";
        }
        ProfileUser user = await SecureStorage().getUser();
        print(user.customerId);
        CreateAccelerometerModel acc = CreateAccelerometerModel(
            value: valueData, customer: user.customerId);
        final res = await sensorRepository.createAccelerometer(acc);
        if (res.statusCode == HttpStatus.created) {
          List<AccelerometerChartModel> newListAccX = listAccX;
          List<AccelerometerChartModel> newListAccY = listAccY;
          List<AccelerometerChartModel> newListAccZ = listAccZ;

          newListAccX.removeRange(0, 100);
          newListAccY.removeRange(0, 100);
          newListAccZ.removeRange(0, 100);
          setState(() {
            listAccX = newListAccX;
            listAccY = newListAccY;
            listAccZ = newListAccZ;
          });
        }
      });
    }

    print(listAccX.length);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 135, 178, 252),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70)))),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: borderStyle,
                margin: new EdgeInsets.symmetric(horizontal: 20.0),
                height: 350.h,
                child: SfCartesianChart(
                    title: ChartTitle(text: 'Biểu đồ giá trị 3 trục'),
                    onZooming: ((zoomingArgs) => {print(zoomingArgs)}),
                    legend: Legend(
                        isVisible: true,
                        alignment: ChartAlignment.center,
                        position: LegendPosition.bottom),

                    // Initialize category axis
                    primaryXAxis: DateTimeAxis(
                        autoScrollingMode: AutoScrollingMode.end,
                        visibleMinimum: listAccX.length > 50
                            ? listAccX[listAccX.length - 50].time
                            : null,
                        // edgeLabelPlacement: EdgeLabelPlacement.shift,
                        majorGridLines: const MajorGridLines(width: 0),
                        name: "Thời gian",
                        isVisible: true,
                        title: AxisTitle(
                            text: "Thời gian (s)",
                            alignment: ChartAlignment.far)),
                    series: <LineSeries<AccelerometerChartModel, DateTime>>[
                      LineSeries<AccelerometerChartModel, DateTime>(
                          onRendererCreated:
                              (ChartSeriesController controller) {
                            _chartSeriesControllerX = controller;
                          },
                          // Bind data source
                          dataSource: listAccX,
                          color: Colors.greenAccent,
                          yValueMapper: (AccelerometerChartModel accValue, _) =>
                              accValue.value,
                          xValueMapper: (AccelerometerChartModel accValue, _) =>
                              (accValue.time)),
                      LineSeries<AccelerometerChartModel, DateTime>(
                          onRendererCreated:
                              (ChartSeriesController controller) {
                            _chartSeriesControllerY = controller;
                          },
                          color: Colors.amber,
                          // Bind data source
                          dataSource: listAccY,
                          yValueMapper: (AccelerometerChartModel accValue, _) =>
                              accValue.value,
                          xValueMapper: (AccelerometerChartModel accValue, _) =>
                              (accValue.time)),
                      LineSeries<AccelerometerChartModel, DateTime>(
                          onRendererCreated:
                              (ChartSeriesController controller) {
                            _chartSeriesControllerZ = controller;
                          },
                          // Bind data source
                          dataSource: listAccZ,
                          yValueMapper: (AccelerometerChartModel accValue, _) =>
                              accValue.value,
                          xValueMapper: (AccelerometerChartModel accValue, _) =>
                              (accValue.time))
                    ])),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: borderStyle,
                  height: 150.h,
                  width: 150.h,
                  child: SfCartesianChart(
                      title: ChartTitle(
                          text: 'THời gian vs tư thế',
                          textStyle: TextStyle(fontSize: 8.sp)),
                      primaryXAxis: CategoryAxis(),
                      series: <ChartSeries<PositionCountModal, String>>[
                        // Renders column chart
                        ColumnSeries<PositionCountModal, String>(
                            dataSource: positions,
                            xValueMapper: (PositionCountModal data, _) =>
                                data.name,
                            yValueMapper: (PositionCountModal data, _) =>
                                data.value)
                      ]),
                ),
                Container(
                  decoration: borderStyle,
                  height: 150.h,
                  width: 150.h,
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CartSensor(
                  onPress: () {},
                  img: AppImages.met_moi_Img,
                  lable: "Phân tích 1",
                  size: 50.w,
                ),
                CartSensor(
                  onPress: () {},
                  img: AppImages.met_moi_Img,
                  lable: "Phân tích 1",
                  size: 50.w,
                ),
                CartSensor(
                  onPress: () {},
                  img: AppImages.met_moi_Img,
                  lable: "Phân tích 1",
                  size: 50.w,
                ),
                CartSensor(
                  onPress: () {},
                  img: AppImages.met_moi_Img,
                  lable: "Phân tích 1",
                  size: 50.w,
                ),
              ],
            ),
          ],
        ));
  }

  void _onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    // Create message if there is new line character
    String dataString = String.fromCharCodes(buffer);
    int index = buffer.indexOf(13);
    String valueData = "";
    if (~index != 0 && dataString != null) {
      valueData = backspacesCounter > 0
          ? _messageBuffer.substring(
              0, _messageBuffer.length - backspacesCounter)
          : _messageBuffer + dataString.substring(0, index);
      print(valueData);
      List values = valueData.split("%");

      setState(() {
        DateTime nowD = DateTime.now();

        _messageBuffer = dataString.substring(index);
        if (values.length == 3) {
          listAccX.add(AccelerometerChartModel(
              value: double.parse(values[0]), time: nowD));
          listAccY.add(AccelerometerChartModel(
              value: double.parse(values[1]), time: nowD));
          listAccZ.add(AccelerometerChartModel(
              value: double.parse(values[2]), time: nowD));
          _chartSeriesControllerX.updateDataSource(
              addedDataIndex: listAccX.length - 1);
        }
      });
    } else {
      _messageBuffer = (backspacesCounter > 0
          ? _messageBuffer.substring(
              0, _messageBuffer.length - backspacesCounter)
          : _messageBuffer + dataString);
    }
  }
}
