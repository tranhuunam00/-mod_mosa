import 'package:flutter/material.dart';

class PickerHelper {
  static Future<dynamic> selectDate(
      BuildContext context, DateTime dateTime) async {
    return await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryTextTheme: const TextTheme(
              caption: TextStyle(
                color: Colors.white,
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.white, // button text color
              ),
            ),
            dialogBackgroundColor: Colors.black,
            textTheme: const TextTheme(
              caption: TextStyle(
                color: Colors.white,
              ),
            ),
            errorColor: Colors.white,
            colorScheme: const ColorScheme.dark(
              onSecondary: Colors.white,
              secondary: Colors.white,
              onSurface: Colors.white,
              primary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    ).then((value) => value);
  }
}
