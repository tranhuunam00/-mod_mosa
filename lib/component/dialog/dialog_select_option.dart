import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/colors.dart';

import '../../../models/stateModel.dart';
import '../../../translations/locale_keys.g.dart';

class DialogSelectOption extends StatefulWidget {
  StateModel? itemSelected;
  List<StateModel> items;
  String title;

  DialogSelectOption({
    Key? key,
    this.itemSelected,
    required this.items,
    required this.title,
  }) : super(key: key);

  @override
  State<DialogSelectOption> createState() => _DialogSelectOptionState();
}

class _DialogSelectOptionState extends State<DialogSelectOption> {
  late StateModel selected;

  @override
  void initState() {
    if (widget.items != null) {
      selected =
          widget.itemSelected != null ? widget.itemSelected! : widget.items[0];
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
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                        height: 8.h,
                      ),
                  padding: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
                  itemCount: widget.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = widget.items[index];
                    bool isSelected = selected == item;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selected = item;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            widget.items[index].name,
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: isSelected
                                    ? AppColors.jPrimaryColor
                                    : Colors.black),
                          ),
                          const Spacer(),
                          isSelected
                              ? SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child: const Icon(Icons.check,
                                      color: AppColors.jPrimaryColor),
                                )
                              : const SizedBox(),
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
                    Navigator.pop(context, selected);
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
