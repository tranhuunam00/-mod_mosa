import 'package:flutter/material.dart';
import 'package:mod_do_an/component/card/card_common.dart';
import 'package:mod_do_an/config/images.dart';
import 'package:mod_do_an/ui/home/data/data.dart';

class PlaningGrid extends StatefulWidget {
  const PlaningGrid({Key? key}) : super(key: key);

  @override
  State<PlaningGrid> createState() => _PlaningGridState();
}

class _PlaningGridState extends State<PlaningGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: planing.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 16 / 4, crossAxisCount: 1, mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return CardCommon(
              colorC: planing[index].color, heading: planing[index].heading);
        });
  }
}
