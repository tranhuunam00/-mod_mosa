import 'package:flutter/material.dart';

import 'package:mod_do_an/component/card/card_common.dart';
import 'package:mod_do_an/component/styles/appbar.dart';

class ChangeUserScreen extends StatefulWidget {
  const ChangeUserScreen({Key? key}) : super(key: key);

  @override
  State<ChangeUserScreen> createState() => _ChangeUserScreenState();
}

class _ChangeUserScreenState extends State<ChangeUserScreen> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    print(hover);
    return Scaffold(
      appBar: appBarStyle("Danh sách người dùng"),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView.builder(
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 16 / 4,
                crossAxisCount: 1,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return Material(
                color: Colors.amber,
                child: InkWell(
                  onHover: (hovering) {
                    setState(() => hover = hovering);
                  },
                  onTap: () {
                    print("tap");
                  },
                  // child: CardCommon(colorC: Colors.black, heading: "Bà nội")
                ),
              );
            }),
      ),
    );
  }
}
