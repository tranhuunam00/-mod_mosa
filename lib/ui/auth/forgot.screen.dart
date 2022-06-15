import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/blocs/forgot/forgot.state.dart';
import 'package:mod_do_an/blocs/forgot/forgot_bloc.dart';
import 'package:mod_do_an/blocs/forgot/forgot_event.dart';
import 'package:mod_do_an/component/button/button_material.dart';
import 'package:mod_do_an/component/input_field/text_input_label.dart';
import 'package:mod_do_an/component/text/text_bold.dart';
import 'package:mod_do_an/component/text/text_normal.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/translations/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/utils/validator.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController _emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotBloc, ForgotState>(
        listener: (context, state) {},
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: AppColors.bgPrimaryColor,
                appBar: AppBar(
                  backgroundColor: AppColors.bgPrimaryColor,
                  elevation: 0,
                  leading: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.jPrimaryColor.withOpacity(0.7),
                    ),
                  ),
                  title: TextBold(
                    title: LocaleKeys.forgot_password,
                    size: 18.sp,
                    colors: AppColors.jPrimaryColor.withOpacity(0.7),
                  ),
                ),
                body: SafeArea(
                  minimum: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: TextInputLabel(
                            label: true,
                            controller: _emailController,
                            labelText: LocaleKeys.email,
                            hintText: LocaleKeys.email,
                            validator: (str) => Validator.validateEmail(str),
                            onChanged: (a) {
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        ButtonMaterial(
                          enable: true,
                          color: _validate()
                              ? AppColors.jPrimaryColor
                              : AppColors.jPrimaryColor.withOpacity(0.5),
                          child: TextNormal(
                            size: 15.sp,
                            title: LocaleKeys.forgot_password,
                            color: _validate()
                                ? AppColors.kPrimaryColor
                                : AppColors.kPrimaryColor.withOpacity(0.7),
                          ),
                          onPressed: _validate()
                              ? () {
                                  BlocProvider.of<ForgotBloc>(context)
                                      .add(ForgotWithEmailEvent(
                                    email: _emailController.text,
                                  ));
                                }
                              : null,
                        ),
                        Spacer(flex: 3),
                      ]),
                ))));
  }

  _validate() {
    if (RegExp(Validator.REGEX_EMAIL).hasMatch(_emailController.text.trim())) {
      return true;
    } else {
      return false;
    }
  }
}
