import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/ui/components/button/inkwell_custom.dart';

class CartQuiz extends StatelessWidget {
  final Widget child;
  final bool? value;

  const CartQuiz({Key? key, required this.child, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.center,
        child: Card(
          color: AppColors.darkTextPrimaryColor,
          elevation: 0.3,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: const SizedBox(
            height: 200,
            child: Center(child: Text('Outlined Card')),
          ),
        ),
      ),
      Spacer(),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkwellStyle(
                label: "YES",
                onTap: () {},
                color: (value == null || value == true)
                    ? AppColors.yesColor
                    : AppColors.gPrimaryColor,
                width: (value == true) ? 200 : 140,
                icon: (value == true) ? Icons.accessible : null),
            InkwellStyle(
                label: "NO",
                onTap: () {},
                color: (value == null || value == false)
                    ? AppColors.noColor
                    : AppColors.gPrimaryColor,
                width: (value == false) ? 200 : 140,
                icon: (value == false) ? Icons.accessible : null),
          ],
        ),
      ),
      Spacer(),
      Spacer(),
      Spacer(),
    ]);
  }
}
