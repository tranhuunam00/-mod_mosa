import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/component/text/text_normal.dart';
import 'package:mod_do_an/config/colors.dart';

class TextInputPasswordLabel extends StatefulWidget {
  TextInputPasswordLabel({
    Key? key,
    this.maxLines,
    this.onChanged,
    this.paddingLeft,
    this.size,
    this.subSize,
    this.fontWeight,
    this.colorBorderSide,
    this.inputFormatter,
    this.keyboardType,
    this.colorTextField,
    this.textColor,
    this.hintText = '',
    required this.controller,
    this.validator,
    this.onSaved,
    required this.labelText,
    this.readOnly = false,
    this.subLabelText = '',
    this.suffix,
    this.obscureText,
    this.label,
    this.onTap,
  }) : super(key: key);
  final String hintText;
  final String labelText;
  final Color? textColor;
  final Color? colorTextField;
  final FontWeight? fontWeight;
  final Color? colorBorderSide;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  List<TextInputFormatter>? inputFormatter;
  TextInputType? keyboardType;
  Widget? suffix;
  bool? obscureText;
  bool readOnly;
  final double? size;
  final double? paddingLeft;
  final ValueChanged<String>? onChanged;
  final String? subLabelText;
  final double? subSize;
  int? maxLines;
  bool? label;
  VoidCallback? onTap;

  @override
  _TextInputPasswordLabelState createState() => _TextInputPasswordLabelState();
}

class _TextInputPasswordLabelState extends State<TextInputPasswordLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextNormal(
              title: widget.readOnly || widget.label!
                  ? widget.labelText
                  : (widget.controller.text.isEmpty ? "" : widget.labelText),
              color: widget.textColor ?? AppColors.primaryColor,
              size: widget.size ?? 15.sp,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            TextNormal(
              title: widget.subLabelText!,
              color: AppColors.primaryColor,
              size: widget.subSize ?? 14.sp,
              height: 1.h,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          onTap: widget.onTap,
          obscureText: widget.obscureText!,
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          controller: widget.controller,
          autofocus: false,
          validator: widget.validator,
          keyboardAppearance: Brightness.dark,
          onSaved: widget.onSaved,
          inputFormatters: widget.inputFormatter,
          onChanged: widget.onChanged ??
              (a) {
                setState(() {});
              },
          maxLines: widget.maxLines ?? 1,
          cursorColor: AppColors.primaryColor.withOpacity(1),
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: widget.colorTextField ??
                (widget.readOnly
                    ? AppColors.primaryColor
                    : AppColors.primaryColor),
            fontSize: 14.sp,
            fontWeight: widget.fontWeight ?? FontWeight.w300,
            fontStyle: FontStyle.normal,
          ),
          decoration: InputDecoration(
            errorText: widget.validator != null
                ? widget.validator!(widget.controller.text)
                : null,
            filled: true,
            contentPadding: EdgeInsets.only(
                left: 24.w, top: 12.h, bottom: 12.h, right: 12.w),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: widget.readOnly
                  ? AppColors.primaryColor
                  : AppColors.primaryColor,
              fontSize: 14.sp,
              fontWeight: widget.fontWeight ?? FontWeight.w300,
              fontFamily: 'Montserrat',
              fontStyle: FontStyle.normal,
            ),
            suffixIcon: widget.suffix,
            isDense: true,
            suffixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17.r),
                borderSide:
                    const BorderSide(width: 1, color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17.r),
                borderSide:
                    const BorderSide(width: 1, color: Colors.transparent)),
            fillColor: AppColors.kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
