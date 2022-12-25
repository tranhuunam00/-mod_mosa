import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SkipContextBtn extends StatelessWidget {
  const SkipContextBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Color.fromARGB(168, 201, 237, 252),
        child: InkWell(
          focusColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text(
                  "Bỏ qua",
                  style: TextStyle(fontSize: 18),
                ),
                Icon(
                  Icons.skip_next,
                  size: 26,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
