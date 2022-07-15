import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableStopbangAll extends StatelessWidget {
  const TableStopbangAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(20),
        child: Table(
          defaultColumnWidth: FixedColumnWidth(120.0),
          border: TableBorder.all(
              color: Colors.black, style: BorderStyle.solid, width: 2),
          children: [
            TableRow(children: [
              Column(children: [
                Text('Website', style: TextStyle(fontSize: 20.0))
              ]),
              Column(children: [
                Text('Tutorial', style: TextStyle(fontSize: 20.0))
              ]),
              Column(
                  children: [Text('Review', style: TextStyle(fontSize: 20.0))]),
            ]),
            TableRow(children: [
              Column(children: [Text('Javatpoint')]),
              Column(children: [Text('Flutter')]),
              Column(children: [Text('5*')]),
            ]),
            TableRow(children: [
              Column(children: [Text('Javatpoint')]),
              Column(children: [Text('MySQL')]),
              Column(children: [Text('5*')]),
            ]),
            TableRow(children: [
              Column(children: [Text('Javatpoint')]),
              Column(children: [Text('ReactJS')]),
              Column(children: [Text('5*')]),
            ]),
          ],
        ),
      ),
    ]);
  }
}
