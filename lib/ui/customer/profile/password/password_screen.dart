import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/blocs/profile/profile_bloc.dart';
import 'package:mod_do_an/blocs/profile/profile_state.dart';
import 'package:mod_do_an/component/button/button_material.dart';
import 'package:mod_do_an/component/input_field/text_password_label.dart';
import 'package:mod_do_an/component/text/text_bold.dart';
import 'package:mod_do_an/component/text/text_normal.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/translations/locale_keys.g.dart';
import 'package:mod_do_an/utils/loading_helper.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  bool _obscureCurrentPW = true;
  bool _obscureNewPW = true;
  bool _obscureConfirmPW = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.bgPrimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.jPrimaryColor.withOpacity(0.7),
        elevation: 0,
        leading: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: AppColors.kPrimaryColor,
          ),
        ),
        title: TextBold(
          title: LocaleKeys.change_the_password.tr(),
          size: 18.sp,
          colors: Colors.white,
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16.h),
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) async {
            if (state is UpdatePasswordLoadingState) {
              LoadingHelper.showLoading(context);
            } else if (state is UpdatePasswordSuccessState) {
              LoadingHelper.hideLoading(context);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.white,
                  content: TextNormal(
                    title: LocaleKeys.change_password_successfully.tr(),
                  ),
                ),
              );
            } else if (state is UpdatePasswordErrorState) {
              LoadingHelper.hideLoading(context);
              // DialogHelper.showGenericErrorDialog(
              //     context: context, message: state.message);
              print(state.message);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: TextInputPasswordLabel(
                  label: true,
                  controller: _currentPassword,
                  labelText: LocaleKeys.current_password.tr(),
                  hintText: LocaleKeys.current_password.tr(),
                  obscureText: _obscureCurrentPW,
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
                          _obscureCurrentPW = !_obscureCurrentPW;
                        });
                      },
                      child: Icon(
                        !_obscureCurrentPW
                            ? Icons.visibility_off
                            : Icons.remove_red_eye,
                        color: !_obscureCurrentPW ? Colors.indigoAccent : null,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: TextInputPasswordLabel(
                  label: true,
                  controller: _newPassword,
                  labelText: LocaleKeys.new_password.tr(),
                  hintText: LocaleKeys.new_password.tr(),
                  obscureText: _obscureNewPW,
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
                          _obscureNewPW = !_obscureNewPW;
                        });
                      },
                      child: Icon(
                        !_obscureNewPW
                            ? Icons.visibility_off
                            : Icons.remove_red_eye,
                        color: !_obscureNewPW ? Colors.indigoAccent : null,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: TextInputPasswordLabel(
                  label: true,
                  controller: _confirmPassword,
                  labelText: LocaleKeys.confirm_new_password.tr(),
                  hintText: LocaleKeys.confirm_new_password.tr(),
                  obscureText: _obscureConfirmPW,
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
                          _obscureConfirmPW = !_obscureConfirmPW;
                        });
                      },
                      child: Icon(
                        !_obscureConfirmPW
                            ? Icons.visibility_off
                            : Icons.remove_red_eye,
                        color: !_obscureConfirmPW ? Colors.indigoAccent : null,
                      ),
                    ),
                  ),
                ),
              ),
              _confirmPassword.text != _newPassword.text
                  ? Text(
                      LocaleKeys.new_password_does_not_match.tr(),
                      style: TextStyle(color: Colors.red, fontSize: 12.sp),
                    )
                  : const SizedBox(),
              const Spacer(),
              ButtonMaterial(
                enable: true,
                color: _validate()
                    ? AppColors.jPrimaryColor
                    : AppColors.jPrimaryColor.withOpacity(0.7),
                child: TextNormal(
                  title: LocaleKeys.save_changes.tr(),
                  color: _validate()
                      ? AppColors.kPrimaryColor
                      : AppColors.kPrimaryColor.withOpacity(0.7),
                ),
                onPressed: _validate()
                    ? () {
                        // BlocProvider.of<ProfileBloc>(context).add(
                        //   UpdatePasswordEvent(
                        //     currentPassword: _currentPassword.text.trim(),
                        //     newPassword: _newPassword.text.trim(),
                        //   ),
                        // );
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validate() {
    if (_currentPassword.text.trim().length >= 6 &&
        _newPassword.text.trim().length >= 6 &&
        _confirmPassword.text.length >= 6 &&
        _newPassword.text.trim() == _confirmPassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }
}
