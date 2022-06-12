import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/colors.dart';

class EmailInputFiled extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;

  const EmailInputFiled(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.validator,
      this.onSaved})
      : super(key: key);

  @override
  _EmailInputFiledState createState() => _EmailInputFiledState();
}

class _EmailInputFiledState extends State<EmailInputFiled> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        textDirection: TextDirection.ltr,
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
          fontSize: 16.sp,
          letterSpacing: 0.5,
        ),
        decoration: InputDecoration(
          hintTextDirection: TextDirection.ltr,
          errorStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.pink,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.5,
          ),
          filled: true,
          fillColor: AppColors.oPrimaryColor,
          contentPadding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
            top: 5.h,
            bottom: 5.h,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColors.hintTextPrimaryColor,
            fontSize: 16.sp,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              0.r,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.jPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(
              0.r,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.pink,
            ),
            borderRadius: BorderRadius.circular(
              0.r,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.r),
            borderSide: BorderSide(
              color: widget.controller.text == ""
                  ? AppColors.lPrimaryColor
                  : AppColors.oPrimaryColor,
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
