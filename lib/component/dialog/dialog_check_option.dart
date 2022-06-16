import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/colors.dart';

import '../../../models/stateModel.dart';
import '../../../translations/locale_keys.g.dart';

class DialogCheckOption extends StatefulWidget {
  List<StateModel> items;
  String title;
  List<StateModel> checkSelected;

  DialogCheckOption({
    Key? key,
    required this.items,
    required this.title,
    required this.checkSelected,
  }) : super(key: key);

  @override
  State<DialogCheckOption> createState() => _DialogCheckOptionState();
}

class _DialogCheckOptionState extends State<DialogCheckOption> {
  late List<StateModel> selectedItems;
  late List<StateModel> items;
  @override
  void initState() {
    selectedItems = widget.checkSelected;
    items = widget.items;
    for (var x in items) {
      for (var y in selectedItems) {
        if (x.name == y.name) {
          x.isCheck = y.isCheck;
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      //this right here
      child: SizedBox(
        height: 250.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60.h,
              decoration: BoxDecoration(
                color: AppColors.jPrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              child: Center(
                  child: Text(
                widget.title,
                style: TextStyle(fontSize: 24.sp, color: Colors.white),
              )),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(8.w),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = items[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          item.isCheck = !item.isCheck;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: item.isCheck
                                    ? AppColors.jPrimaryColor
                                    : Colors.black),
                          ),
                          const Spacer(),
                          Checkbox(
                              value: item.isCheck,
                              onChanged: (bool? value) {
                                setState(() {
                                  item.isCheck = value!;
                                });
                              })
                        ],
                      ),
                    );
                  }),
            ),
            const Divider(color: AppColors.jPrimaryColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    LocaleKeys.cancel.tr(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print("items " + items.toString());
                    var result =
                        items.where((element) => element.isCheck).toList();
                    Navigator.pop(context, result);
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
