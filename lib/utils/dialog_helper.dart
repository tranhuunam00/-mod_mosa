import 'package:flutter/material.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:mod_do_an/component/dialog/dialog_check_option.dart';
import 'package:mod_do_an/component/dialog/dialog_select_option.dart';
import 'package:mod_do_an/models/stateModel.dart';

class DialogHelper {
  static Future<dynamic> showNotify(
      {required BuildContext context,
      required String message,
      String? title}) async {
    return await showOkAlertDialog(
      context: context,
      title: title ?? "MOSA",
      message: message,
    );
  }

  static Future<dynamic> showUpdateProfileSuccess(
      {required BuildContext context,
      required String message,
      String? title}) async {
    return await showOkAlertDialog(
      context: context,
      title: title ?? "MOSA",
      message: message,
    );
  }

  static Future<dynamic> showSelectDialog({
    required BuildContext context,
    required List<StateModel> items,
    required String title,
    required StateModel itemSelected,
  }) async {
    return await showDialog(
        context: context,
        builder: (context) => DialogSelectOption(
              title: title,
              items: items,
              itemSelected: itemSelected,
            ));
  }

  static Future<dynamic> showCheckedDialog(
      {required BuildContext context,
      required List<StateModel> items,
      required String title,
      required List<StateModel> selectedItems}) async {
    return await showDialog(
        context: context,
        builder: (context) => DialogCheckOption(
              title: title,
              items: items,
              checkSelected: selectedItems,
            ));
  }
}
