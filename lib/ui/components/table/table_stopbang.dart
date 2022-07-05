import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mod_do_an/config/constants.dart';

class TableStopBang extends StatelessWidget {
  final List<bool?> valueAnswer;
  const TableStopBang({Key? key, required this.valueAnswer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataRow> listRow = [];

    Constants.listStopBang.forEach((item) {
      int i = Constants.listStopBang.indexOf(item);
      String textValue = "null";
      if (valueAnswer[i] == true) textValue = "yes";
      if (valueAnswer[i] == false) textValue = "no";

      listRow.add(DataRow(cells: [
        DataCell(Text((i + 1).toString())),
        DataCell(Text(item.title)),
        DataCell(Text(textValue)),
      ]));
    });
    listRow.add(DataRow(cells: [
      DataCell(Text((listRow.length + 1).toString())),
      DataCell(Text("Chỉ số BMI")),
      DataCell(Text(("18"))),
    ]));

    listRow.add(DataRow(cells: [
      DataCell(Text((listRow.length + 1).toString())),
      DataCell(Text("Tuổi")),
      DataCell(Text(("18"))),
    ]));

    return DataTable(columns: [
      DataColumn(
          label: Text('Index',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Value',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    ], rows: listRow);
  }
}
