import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mod_do_an/component/card/cart_feature.dart';
import 'package:mod_do_an/component/text/text_bold.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/config/images.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/ui/auth/register.screen.dart';
import 'package:mod_do_an/ui/components/background.dart';

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({Key? key}) : super(key: key);

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Background(
      urlBackground: AppImages.backgroundDefault,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(50),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: <Widget>[
          CardFeature(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterScreen(
                          otherUser: "otherUser",
                        )),
              );
            },
          ),
          CardFeature(
            onPress: () {},
          ),
          CardFeature(
            onPress: () {},
          ),
          CardFeature(
            onPress: () {},
          ),
        ],
      ),
    ));
  }
}
