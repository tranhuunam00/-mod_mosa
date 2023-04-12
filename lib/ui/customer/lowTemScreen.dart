import 'package:flutter/material.dart';
import 'package:mod_do_an/component/styles/appbar.dart';

class lowTemScreen extends StatefulWidget {
  const lowTemScreen({Key? key}) : super(key: key);
  @override
  _lowTemScreenState createState() => _lowTemScreenState();
}

class _lowTemScreenState extends State<lowTemScreen> {
  double _temperature = 30.0;
  final double _minTemperature = 30.0;
  final double _maxTemperature = 45.0;
  final double _step = 0.1;

  @override
  Widget build(BuildContext context) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(
      initialItem: ((_temperature - _minTemperature) ~/ _step).toInt(),
    );

    return Scaffold(
      appBar: appBarStyle("Giá trị nhiệt độ thấp"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ListWheelScrollView
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              child: ListWheelScrollView(
                controller: scrollController,
                itemExtent: 60,
                children: _buildItems(),
                onSelectedItemChanged: (index) {
                  setState(() {
                    _temperature = _minTemperature + (index * _step);
                  });
                },
              ),
            ),
          ),
          // Nút chọn
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Bạn sẽ nhận được thông báo khi nhiệt đô đo thấp hơn giá trị này",
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                  onTap: () async {
                    print('Selected temperature: $_temperature');
                    //  await _showDefaultNotification();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 81, 187, 161),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Text("OK"),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildItems() {
    List<Widget> items = [];

    for (double temperature = _minTemperature;
        temperature <= _maxTemperature;
        temperature += _step) {
      items.add(_buildItem(temperature.toStringAsFixed(1)));
    }

    return items;
  }

  Widget _buildItem(String temperature) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: MediaQuery.of(context).size.width - 200,
        height: 50,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 101, 213, 185),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            temperature,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
