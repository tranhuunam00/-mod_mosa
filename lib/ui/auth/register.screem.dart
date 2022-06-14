import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mod_do_an/blocs/register/register_bloc.dart';
import 'package:mod_do_an/blocs/register/register_state.dart';
import 'package:mod_do_an/component/button/button_material.dart';
import 'package:mod_do_an/component/input_field/text_input_label.dart';
import 'package:mod_do_an/component/input_field/text_password_label.dart';
import 'package:mod_do_an/component/text/text_bold.dart';
import 'package:mod_do_an/component/text/text_normal.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/translations/locale_keys.g.dart';
import 'package:mod_do_an/utils/loading_helper.dart';
import 'package:mod_do_an/utils/picker_helper.dart';
import 'package:mod_do_an/utils/validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  bool _obscureText = true;
  int? selectedGender;
  int? selectedNationality;

  @override
  void initState() {
    super.initState();
    selectedGender = 1;
    selectedNationality = 1;
  }

  void _selectedGender(val) {
    setState(() {
      selectedGender = val;
    });
  }

  void _selectedNationality(val) {
    setState(() {
      selectedNationality = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
            title: LocaleKeys.registration.tr(),
            size: 18.sp,
            colors: AppColors.jPrimaryColor.withOpacity(0.7),
          ),
        ),
        body: SafeArea(
          minimum: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            bottom: 16.h,
          ),
          maintainBottomViewPadding: false,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              child: BlocListener<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is CreateStudentLoadingState) {
                    LoadingHelper.showLoading(context);
                  } else if (state is CreateStudentSuccess) {
                    LoadingHelper.hideLoading(context);
                    debugPrint("Create Register Success");
                    Navigator.pushReplacementNamed(
                        context, Constants.signUpScreen);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.jPrimaryColor,
                        content: TextNormal(
                          title:
                              LocaleKeys.successful_account_registration.tr(),
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else if (state is CreateStudentFail) {
                    LoadingHelper.hideLoading(context);
                    // DialogHelper.showGenericErrorDialog(
                    //     context: context, message: state.message);
                    // debugPrint("Create Register Fail");
                    print(state.message);
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextInputLabel(
                      label: true,
                      controller: _lastNameController,
                      labelText: LocaleKeys.surname.tr(),
                      hintText: LocaleKeys.surname.tr(),
                      onChanged: (a) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: TextInputLabel(
                        label: true,
                        controller: _firstNameController,
                        labelText: LocaleKeys.name.tr(),
                        hintText: LocaleKeys.name.tr(),
                        onChanged: (a) {
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 90.w,
                          child: TextNormal(
                            title: LocaleKeys.gender.tr(),
                            textAlign: TextAlign.start,
                            size: 15.sp,
                          ),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        SizedBox(
                          width: 100.w,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: Radio(
                                  value: 1,
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    _selectedGender(value);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              TextNormal(
                                textAlign: TextAlign.left,
                                title: LocaleKeys.male.tr(),
                                size: 15.sp,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: Radio(
                                value: 2,
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  _selectedGender(value);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            TextNormal(
                              textAlign: TextAlign.left,
                              title: LocaleKeys.female.tr(),
                              size: 15.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 90.w,
                          child: TextNormal(
                            title: LocaleKeys.nationality.tr(),
                            textAlign: TextAlign.start,
                            size: 15.sp,
                          ),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        SizedBox(
                          width: 100.w,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: Radio(
                                  value: 1,
                                  groupValue: selectedNationality,
                                  onChanged: (value) {
                                    _selectedNationality(value);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              TextNormal(
                                textAlign: TextAlign.left,
                                title: "VN",
                                size: 15.sp,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: Radio(
                                value: 2,
                                groupValue: selectedNationality,
                                onChanged: (value) {
                                  _selectedNationality(value);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            TextNormal(
                              textAlign: TextAlign.left,
                              title: "JP",
                              size: 15.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: TextInputPasswordLabel(
                        onTap: () async {
                          var result = await PickerHelper.selectDate(
                              context, selectedDate);
                          if (result != null) {
                            setState(() {
                              _dobController.text =
                                  DateFormat('dd/MM/yyyy').format(result);
                            });
                          }
                        },
                        label: true,
                        controller: _dobController,
                        labelText: LocaleKeys.date_of_birth.tr(),
                        hintText: LocaleKeys.date_of_birth.tr(),
                        readOnly: true,
                        obscureText: false,
                        onChanged: (a) {
                          setState(() {});
                        },
                        suffix: Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: const RotatedBox(
                            quarterTurns: 2,
                            child: Icon(Icons.arrow_back_ios),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: TextInputLabel(
                        label: true,
                        controller: _emailController,
                        labelText: LocaleKeys.email.tr(),
                        hintText: LocaleKeys.email.tr(),
                        validator: (str) => Validator.validateEmail(str),
                        onChanged: (a) {
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: TextInputLabel(
                        label: true,
                        controller: _phoneController,
                        labelText: LocaleKeys.phone_number.tr(),
                        hintText: LocaleKeys.phone_number.tr(),
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                          PhoneInputFormatter(),
                        ],
                        keyboardType: TextInputType.phone,
                        onChanged: (a) {
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: TextInputPasswordLabel(
                        label: true,
                        controller: _passwordController,
                        labelText: LocaleKeys.password.tr(),
                        hintText: LocaleKeys.password.tr(),
                        obscureText: _obscureText,
                        onChanged: (a) {
                          setState(() {});
                        },
                        suffix: Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              Icons.remove_red_eye,
                              color: !_obscureText ? Colors.indigoAccent : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    ButtonMaterial(
                        enable: true,
                        color: _validate()
                            ? AppColors.jPrimaryColor
                            : AppColors.jPrimaryColor.withOpacity(0.7),
                        child: TextNormal(
                          size: 15.sp,
                          title: LocaleKeys.registration.tr(),
                          color: _validate()
                              ? AppColors.kPrimaryColor
                              : AppColors.kPrimaryColor.withOpacity(0.7),
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _validate() {
    if (RegExp(Validator.REGEX_EMAIL).hasMatch(_emailController.text.trim()) &&
        _firstNameController.text.trim().isNotEmpty &&
        _lastNameController.text.trim().isNotEmpty &&
        _dobController.text.trim().isNotEmpty &&
        _emailController.text.trim().isNotEmpty &&
        _phoneController.text.trim().length == 12 &&
        _passwordController.text.trim().isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
