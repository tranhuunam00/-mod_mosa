import 'dart:async';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mod_do_an/component/styles/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({Key? key}) : super(key: key);

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  static final ListColorByTemp = [
    [
      Color.fromARGB(255, 27, 103, 162),
      Color.fromARGB(255, 132, 140, 200),
      Color.fromARGB(255, 30, 142, 39),
    ],
    [
      Color.fromARGB(255, 147, 243, 123),
      Color.fromARGB(255, 194, 229, 161),
      Color.fromARGB(255, 30, 142, 39),
    ],
    [
      Color.fromARGB(255, 182, 156, 38),
      Color.fromARGB(255, 196, 154, 47),
      Color.fromARGB(255, 159, 76, 35),
    ],
    [
      Color.fromARGB(255, 176, 18, 18),
      Color.fromARGB(255, 196, 154, 47),
      Color.fromARGB(255, 159, 76, 35),
    ]
  ];
  double temp = 0;
  double maxTemp = 0;
  double abnormalTime = 0;

  List<Color> colorsBg = ListColorByTemp[1];
  List<Data> _data = [];

  @override
  void initState() {
    super.initState();
    _startRandomData();
  }

  List<Color> checkTemp(double temp) {
    if (temp <= 35.5) return ListColorByTemp[0];
    if (temp >= 38 && temp <= 39) return ListColorByTemp[2];
    if (temp > 39) return ListColorByTemp[3];
    return ListColorByTemp[1];
  }

  void _startRandomData() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        double data = _getRandomTemperature();
        _data.add(Data(DateTime.now(), _getRandomTemperature()));
        if (_data.length > 30) {
          _data.removeAt(0);
        }
        if (data > maxTemp) maxTemp = data;
        temp = data;
        colorsBg = checkTemp(data);
        if (temp < 35.5 || temp >= 38) abnormalTime = abnormalTime + 2;
      });
    });
  }

  double _getRandomTemperature() {
    return 38 + Random().nextInt(3) - 0;
  }

  @override
  Widget build(BuildContext context) {
    List<String> labels = ['0', '20', '40', '60', '80', '100'];
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: appBarStyle("Đo nhiệt độ"),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colorsBg,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  temp.toString() + "°C",
                  style: TextStyle(fontSize: 60.w),
                ),
                SizedBox(
                  height: 50.w,
                ),
                Container(
                  child: SfCartesianChart(
                    backgroundColor: Colors.white,
                    plotAreaBackgroundColor: Colors.white,
                    primaryXAxis: DateTimeAxis(
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      intervalType: DateTimeIntervalType.seconds,
                      dateFormat: DateFormat.Hm(),
                      majorGridLines: MajorGridLines(
                        color: Colors.grey[200],
                      ),
                    ),
                    primaryYAxis: NumericAxis(
                      minimum: 34,
                      maximum: 43,
                      interval: 1,
                      axisLine: AxisLine(
                        color: Colors.grey[200],
                      ),
                      majorTickLines: MajorTickLines(
                        color: Colors.grey[200],
                      ),
                      minorTickLines: MinorTickLines(
                        color: Colors.grey[200],
                      ),
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    series: <ChartSeries>[
                      LineSeries<Data, DateTime>(
                        dataSource: _data,
                        xValueMapper: (Data data, _) => data.time,
                        yValueMapper: (Data data, _) => data.temperature,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.w,
                ),
                Row(
                  children: [
                    Text(
                      "0",
                      style: TextStyle(fontSize: 20.w),
                    ),
                    Expanded(
                      child: SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 16.w,
                          showValueIndicator: ShowValueIndicator.always,
                          // Thiết lập chiều rộng của slider
                        ),
                        child: Slider(
                          value: 30,
                          onChanged: (newValue) {},
                          activeColor: Colors.blue,
                          inactiveColor: Colors.grey,
                          min: 0,
                          label:
                              'Value: ${30}', // Hiển thị giá trị bên cạnh thanh trượt
                          divisions: 5,
                          max: 100,
                          semanticFormatterCallback: (double value) {
                            return labels[(value ~/ 20)];
                          },
                        ),
                      ),
                    ),
                    Text(
                      "100 phút ",
                      style: TextStyle(fontSize: 20.w),
                    ),
                  ],
                ),
                Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder
                        .all(), // Allows to add a border decoration around your table
                    children: [
                      TableRow(
                        children: [
                          Container(
                            height: 60.h,
                            color: Color.fromARGB(255, 157, 213, 241),
                            child: Text(
                              'Max 1h',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.h),
                            ),
                          ),
                          Container(
                            height: 60.h,
                            color: Color.fromARGB(255, 157, 213, 241),
                            child: Text(
                              'Abnormal time',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.h),
                            ),
                          ),
                        ],
                      ),
                      TableRow(children: [
                        Text(
                          maxTemp.toString(),
                          style: TextStyle(fontSize: 20.h),
                        ),
                        Text(
                          abnormalTime.toString(),
                          style: TextStyle(fontSize: 20.h),
                        ),
                      ]),
                    ]),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class Data {
  final DateTime time;
  final double temperature;

  Data(this.time, this.temperature);
}
