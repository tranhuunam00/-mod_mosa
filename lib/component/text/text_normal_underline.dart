import 'package:flutter/material.dart';

class TextNormalUnderLine extends StatelessWidget {
  final String title;
  final double size;
  final Color colors;

  const TextNormalUnderLine({
    Key? key,
    required this.title,
    required this.size,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      style: TextStyle(
        decoration: TextDecoration.underline,
        color: colors,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: 'Montserrat',
        fontSize: size,
      ),
    );
  }
}
