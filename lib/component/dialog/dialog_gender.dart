import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/component/text/text_normal.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/translations/locale_keys.g.dart';

class DialogGender extends StatefulWidget {
  const DialogGender({required this.gender, Key? key}) : super(key: key);
  final String gender;

  @override
  _DialogGenderState createState() => _DialogGenderState();
}

class _DialogGenderState extends State<DialogGender> {
  int? selectedRadio;

  @override
  void initState() {
    super.initState();
    if (widget.gender == "Nam") {
      selectedRadio = 1;
    } else {
      selectedRadio = 2;
    }
  }

  void _selectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.kPrimaryColor,
      title: TextNormal(
        title: LocaleKeys.gender.tr(),
        size: 20.sp,
        maxLines: 1,
        textAlign: TextAlign.left,
        color: AppColors.primaryColor,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                height: 24.h,
                width: 24.w,
                child: Radio(
                  value: 1,
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    _selectedRadio(value);
                  },
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              TextNormal(
                textAlign: TextAlign.left,
                title: LocaleKeys.male.tr(),
                size: 14.sp,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                height: 24.h,
                width: 24.w,
                child: Radio(
                  value: 2,
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    _selectedRadio(value);
                  },
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              TextNormal(
                textAlign: TextAlign.left,
                title: LocaleKeys.female.tr(),
                size: 14.sp,
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: TextNormal(
            title: LocaleKeys.cancel.tr(),
            size: 16.sp,
            maxLines: 1,
            textAlign: TextAlign.left,
            color: AppColors.jPrimaryColor,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, selectedRadio == 1 ? "Nam" : "Nữ");
          },
          child: TextNormal(
            title: "TIẾP TỤC",
            size: 16.sp,
            maxLines: 1,
            textAlign: TextAlign.left,
            color: AppColors.jPrimaryColor,
          ),
        ),
      ],
    );
  }
}
