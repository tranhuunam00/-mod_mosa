import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/colors.dart';

class InputFieldName extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final double? paddingLeft;
  final TextInputType? keyboardType;
  bool readOnly;
  final Color? colorBorderSide;
  final ValueChanged<String>? onChanged;
  final TextAlign? textAlign;
  final TextDirection textDirection;

  InputFieldName({
    Key? key,
    this.colorBorderSide,
    this.readOnly = false,
    this.paddingLeft,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.textDirection = TextDirection.ltr,
    this.validator,
    this.onChanged,
    this.textAlign,
    this.onSaved,
  }) : super(key: key);

  @override
  _InputFieldNameState createState() => _InputFieldNameState();
}

class _InputFieldNameState extends State<InputFieldName> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      textDirection: widget.textDirection,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      controller: widget.controller,
      autofocus: false,
      validator: widget.validator,
      onSaved: widget.onSaved,
      cursorColor: AppColors.jPrimaryColor,
      onChanged: widget.onChanged ??
          (value) {
            setState(() {});
          },
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
    );
  }
}
