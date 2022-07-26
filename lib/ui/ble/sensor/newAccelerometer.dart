import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:mod_do_an/component/card/cart_sensor.dart';
import 'package:mod_do_an/component/styles/border.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/config/images.dart';
import 'package:mod_do_an/models/sensor/accelerometer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccelerometerDashBoard extends StatefulWidget {
  const AccelerometerDashBoard({Key? key, required this.device})
      : super(key: key);
  final BluetoothDevice device;

  @override
  State<AccelerometerDashBoard> createState() => _AccelerometerDashBoardState();
}

class _AccelerometerDashBoardState extends State<AccelerometerDashBoard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    bool isService = false;
    BluetoothService? accelerometerService;
    BluetoothCharacteristic? acclerometerCharacter;
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70))),
          title: Text(widget.device.name),
          actions: <Widget>[
            StreamBuilder<BluetoothDeviceState>(
              stream: widget.device.state,
              initialData: BluetoothDeviceState.connecting,
              builder: (c, snapshot) {
                VoidCallback? onPressed;
                String text;
                switch (snapshot.data) {
                  case BluetoothDeviceState.connected:
                    onPressed = () => widget.device.disconnect();
                    text = 'DISCONNECT';
                    break;
                  case BluetoothDeviceState.disconnected:
                    onPressed = () => widget.device.connect();
                    text = 'CONNECT';
                    break;
                  default:
                    onPressed = null;
                    text = snapshot.data.toString().substring(21).toUpperCase();
                    break;
                }
                return Text("");
              },
            )
          ],
        ),
        body: StreamBuilder<bool>(
            stream: widget.device.isDiscoveringServices,
            initialData: false,
            builder: (c, snapshot) {
              if (!isService) {
                widget.device.discoverServices();
              }

              return StreamBuilder<List<BluetoothService>>(
                  stream: widget.device.services,
                  initialData: [],
                  builder: (c, snapshot) {
                    if (snapshot.data!.length > 0) {
                      isService = true;
                    }
                    BluetoothService serviceAcclerometer;
                    if (snapshot.data == null || snapshot.data!.length == 0) {
                      return Text("Please contact customer Service");
                    }
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      if (snapshot.data![i].uuid.toString() ==
                          Constants.ACCLEROMETER_SERVICE) {
                        accelerometerService = snapshot.data![i];
                      }
                    }
                    if (accelerometerService == null) {
                      return Text("Please contact customer Service 2");
                    }

                    return Container();
                    return StreamBuilder<List<int>>(
                        stream: acclerometerCharacter!.value,
                        initialData: acclerometerCharacter!.lastValue,
                        builder: (c, snapshot) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    decoration: borderStyle,
                                    margin: new EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    height: 350.h,
                                    child: SfCartesianChart(
                                        title: ChartTitle(
                                            text: 'Biểu đồ giá trị 3 trục'),
                                        onZooming: ((zoomingArgs) =>
                                            {print(zoomingArgs)}),
                                        legend: Legend(
                                            isVisible: true,
                                            alignment: ChartAlignment.center,
                                            position: LegendPosition.bottom),

                                        // Initialize category axis
                                        primaryXAxis: DateTimeAxis(
                                            autoScrollingMode:
                                                AutoScrollingMode.end,
                                            visibleMinimum: listAccX.length > 50
                                                ? listAccX[listAccX.length - 50]
                                                    .time
                                                : null,
                                            // edgeLabelPlacement: EdgeLabelPlacement.shift,
                                            majorGridLines:
                                                const MajorGridLines(width: 0),
                                            name: "Thời gian",
                                            isVisible: true,
                                            title: AxisTitle(
                                                text: "Thời gian (s)",
                                                alignment: ChartAlignment.far)),
                                        series: <
                                            LineSeries<AccelerometerChartModel,
                                                DateTime>>[
                                          LineSeries<AccelerometerChartModel,
                                                  DateTime>(
                                              onRendererCreated:
                                                  (ChartSeriesController
                                                      controller) {
                                                _chartSeriesControllerX =
                                                    controller;
                                              },
                                              // Bind data source
                                              dataSource: listAccX,
                                              color: Colors.greenAccent,
                                              yValueMapper:
                                                  (AccelerometerChartModel
                                                              accValue,
                                                          _) =>
                                                      accValue.value,
                                              xValueMapper:
                                                  (AccelerometerChartModel
                                                              accValue,
                                                          _) =>
                                                      (accValue.time)),
                                          LineSeries<AccelerometerChartModel,
                                                  DateTime>(
                                              onRendererCreated:
                                                  (ChartSeriesController
                                                      controller) {
                                                _chartSeriesControllerY =
                                                    controller;
                                              },
                                              color: Colors.amber,
                                              // Bind data source
                                              dataSource: listAccY,
                                              yValueMapper:
                                                  (AccelerometerChartModel
                                                              accValue,
                                                          _) =>
                                                      accValue.value,
                                              xValueMapper:
                                                  (AccelerometerChartModel
                                                              accValue,
                                                          _) =>
                                                      (accValue.time)),
                                          LineSeries<AccelerometerChartModel,
                                                  DateTime>(
                                              onRendererCreated:
                                                  (ChartSeriesController
                                                      controller) {
                                                _chartSeriesControllerZ =
                                                    controller;
                                              },
                                              // Bind data source
                                              dataSource: listAccZ,
                                              yValueMapper:
                                                  (AccelerometerChartModel
                                                              accValue,
                                                          _) =>
                                                      accValue.value,
                                              xValueMapper:
                                                  (AccelerometerChartModel
                                                              accValue,
                                                          _) =>
                                                      (accValue.time))
                                        ])),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      decoration: borderStyle,
                                      height: 150.h,
                                      width: 150.h,
                                      child: SfCartesianChart(
                                          title: ChartTitle(
                                              text: 'THời gian vs tư thế',
                                              textStyle:
                                                  TextStyle(fontSize: 8.sp)),
                                          primaryXAxis: CategoryAxis(),
                                          series: <
                                              ChartSeries<PositionCountModal,
                                                  String>>[
                                            // Renders column chart
                                            ColumnSeries<PositionCountModal,
                                                    String>(
                                                dataSource: positions,
                                                xValueMapper:
                                                    (PositionCountModal data,
                                                            _) =>
                                                        data.name,
                                                yValueMapper:
                                                    (PositionCountModal data,
                                                            _) =>
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                            ),
                          );
                        });
                  });
            }));
  }
}
