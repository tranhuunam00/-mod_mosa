import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/blocs/custommer/customer_bloc.dart';
import 'package:mod_do_an/blocs/custommer/customer_event.dart';
import 'package:mod_do_an/blocs/custommer/customer_state.dart';
import 'package:mod_do_an/blocs/profile/profile_event.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/models/response/base_response.dart';
import 'package:mod_do_an/models/user/stopBang.dart';
import 'package:mod_do_an/repositories/customer_repository.dart';
import 'package:mod_do_an/repositories/sensor_repository.dart';
import 'package:mod_do_an/services/toast.service.dart';
import 'package:mod_do_an/ui/components/table/table_stopbang.dart';
import 'package:mod_do_an/utils/loading_helper.dart';

class TableStopbangAll extends StatefulWidget {
  const TableStopbangAll({Key? key}) : super(key: key);

  @override
  State<TableStopbangAll> createState() => _TableStopbangAllState();
}

class _TableStopbangAllState extends State<TableStopbangAll> {
  CustomerRepository customerRepository = new CustomerRepository();
  List<StopBangModel> stopbangs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.sync(() async {
      LoadingHelper.showLoading(context);

      final res = await customerRepository.getStopbang();
      if (res.statusCode == HttpStatus.ok) {
        BaseResponse baseResponse = BaseResponse.fromJson(jsonDecode(res.body));
        if (baseResponse.success) {
          List listData = baseResponse.data!["stopbang"];
          List<StopBangModel> stopbangsApi = [];
          for (int i = 0; i < listData.length; i++) {
            StopBangModel sb = StopBangModel(
                customer: listData[i]["customer"].toString(),
                createdAt: listData[i]["createdAt"].toString(),
                snoring: listData[i]["snoring"].toString(),
                tired: listData[i]["tired"].toString(),
                observed: listData[i]["observed"].toString(),
                height: listData[i]["height"].toString(),
                pressure: listData[i]["pressure"].toString(),
                weight: listData[i]["weight"].toString(),
                necksize: listData[i]["necksize"].toString());
            stopbangsApi.add(sb);
          }
          setState(() {
            stopbangs = stopbangsApi;
          });
        }
      }
      LoadingHelper.hideLoading(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DataRow> listRow = [];
    int i = 0;
    stopbangs.forEach((item) {
      i++;

      listRow.add(DataRow(cells: [
        DataCell(Text((i + 1).toString())),
        DataCell(Text(item.createdAt!.substring(0, 10))),
        DataCell(InkWell(
          onTap: () {
            List<String> values = [
              item.snoring,
              item.tired,
              item.pressure,
              item.observed,
              item.height,
              item.height,
              item.weight,
              item.necksize
            ];
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TableStopBang(
                        valueAnswer: values,
                        isDetail: true,
                      )),
            );
          },
          child: Text(
            "Chi tiết",
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
                fontStyle: FontStyle.italic),
          ),
        )),
      ]));
    });
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(20),
        child: DataTable(columns: [
          DataColumn(
              label: Text('Index',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Created-At',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Detail',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ], rows: listRow),
      ),
    ]);
  }
}
