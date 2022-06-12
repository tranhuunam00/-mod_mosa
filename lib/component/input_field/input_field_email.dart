import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/colors.dart';

class InputFieldEmail extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  bool readOnly;
  final Color? colorBorderSide;

  InputFieldEmail(
      {Key? key,
      this.colorBorderSide,
      this.readOnly = false,
      required this.hintText,
      required this.controller,
      this.validator,
      this.onSaved})
      : super(key: key);

  @override
  _InputFieldEmailState createState() => _InputFieldEmailState();
}

class _InputFieldEmailState extends State<InputFieldEmail> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr, //
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      autofocus: false,
      validator: widget.validator,
      onSaved: widget.onSaved,
      cursorColor: AppColors.jPrimaryColor,
      onChanged: (value) {
        setState(() {});
      },
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 17.sp,
        letterSpacing: 0.5,
      ),
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.only(bottom: 10.h),
        hintText: widget.hintText,
        fillColor: Colors.transparent,
        hintStyle: TextStyle(
          color: widget.readOnly
              ? AppColors.primaryColor.withOpacity(0.7)
              : AppColors.primaryColor.withOpacity(0.7),
          fontSize: 17.sp,
          fontWeight: FontWeight.w300,
          fontFamily: 'Source Sans Pro',
          fontStyle: FontStyle.normal,
        ),
        isDense: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.colorBorderSide ??
                (widget.readOnly
                    ? AppColors.tSecondaryColor.withOpacity(0.16)
                    : AppColors.tSecondaryColor.withOpacity(0.16)),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.colorBorderSide ??
                (widget.readOnly
                    ? AppColors.jPrimaryColor.withOpacity(0.5)
                    : AppColors.jPrimaryColor.withOpacity(0.5)),
          ),
        ),
        errorStyle: TextStyle(fontSize: 0.sp, height: 0),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.venuesSecondBorderSideColor.withOpacity(0.6),
            width: 0.w,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.venuesSecondBorderSideColor.withOpacity(0.6),
            width: 0.w,
          ),
        ),
      ),
    );
  }
}
