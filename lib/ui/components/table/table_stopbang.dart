import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/services/toast.service.dart';
import 'package:mod_do_an/ui/components/button/inkwell_custom.dart';

class TableStopBang extends StatelessWidget {
  final List<String> valueAnswer;
  const TableStopBang({Key? key, required this.valueAnswer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(valueAnswer);
    List<DataRow> listRow = [];

    Constants.listStopBang.forEach((item) {
      int i = Constants.listStopBang.indexOf(item);
      String textValue = valueAnswer[i] == null ? "null" : valueAnswer[i];

      listRow.add(DataRow(cells: [
        DataCell(Text((i + 1).toString())),
        DataCell(Text(item.title)),
        DataCell(Text(textValue)),
      ]));
    });
    if (valueAnswer[5] != "" && valueAnswer[4] != "" && valueAnswer[4] != "0") {
      listRow.add(DataRow(cells: [
        DataCell(Text((listRow.length + 1).toString())),
        DataCell(Text("Chỉ số BMI")),
        DataCell(Text((int.parse(valueAnswer[5]) /
                int.parse(valueAnswer[4]) /
                int.parse(valueAnswer[4]) *
                10000)
            .toStringAsFixed(1))),
      ]));
    }

    listRow.add(DataRow(cells: [
      DataCell(Text((listRow.length + 1).toString())),
      DataCell(Text("Tuổi")),
      DataCell(Text(("18"))),
    ]));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DataTable(columns: [
            DataColumn(
                label: Text('Index',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Name',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Value',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          ], rows: listRow),
        ),
        InkwellStyle(
            label: "Submit",
            onTap: () {
              if (valueAnswer.indexOf("") > 0) {
                ToastService.showToast(
                    msg: "Please confirm data to be submitted",
                    backgroundColor: AppColors.errorBackgroundColor);
                return;
              }
            })
      ],
    );
  }
}
