import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/colors.dart';

class InputFieldPassword extends StatefulWidget {
  final String hintText;
  final bool passwordVisible;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  bool readOnly;
  final Color? colorBorderSide;

  InputFieldPassword({
    Key? key,
    this.colorBorderSide,
    this.readOnly = false,
    required this.passwordVisible,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.onSaved,
  }) : super(key: key);

  @override
  _InputFieldPasswordState createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  @override
  void initState() {
    setState(() {
      widget.controller.text.isNotEmpty;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, //
      child: TextFormField(
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr, //
        obscureText: widget.passwordVisible,
        autofocus: false,
        onChanged: (value) {
          setState(() {});
        },
        controller: widget.controller,
        validator: widget.validator,
        onSaved: widget.onSaved,
        cursorColor: AppColors.jPrimaryColor,
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 15.sp,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
          fontFamily: 'Montserrat',
          fontStyle: FontStyle.normal,
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
            fontSize: 15.sp,
            fontWeight: FontWeight.w300,
            fontFamily: 'Montserrat',
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
                      ? AppColors.jPrimaryColor
                      : AppColors.jPrimaryColor),
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
      ),
    );
  }
}
