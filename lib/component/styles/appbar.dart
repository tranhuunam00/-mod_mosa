import 'package:flutter/material.dart';

appBarStyle(String title) {
  return AppBar(
      title: Text(
        title,
      ),
      backgroundColor: Color.fromARGB(255, 88, 227, 215),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(70),
        // bottomLeft: Radius.circular(70)
      )));
}
