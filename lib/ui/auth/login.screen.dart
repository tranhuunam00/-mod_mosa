import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/blocs/login/login_bloc.dart';
import 'package:mod_do_an/blocs/login/login_event.dart';
import 'package:mod_do_an/blocs/login/login_state.dart';
import 'package:mod_do_an/component/button/button_material.dart';
import 'package:mod_do_an/component/input_field/text_input_label.dart';
import 'package:mod_do_an/component/input_field/text_password_label.dart';
import 'package:mod_do_an/component/text/text_bold.dart';
import 'package:mod_do_an/component/text/text_normal.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/config/http_responses.dart';
import 'package:mod_do_an/services/toast.service.dart';
import 'package:mod_do_an/translations/locale_keys.g.dart';
import 'package:mod_do_an/utils/dialog_helper.dart';
import 'package:mod_do_an/utils/loading_helper.dart';
import 'package:mod_do_an/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            LoadingHelper.showLoading(context);
          }
          if (state is LoginSuccessState ||
              state is LoginErrorState ||
              state is LoginFailState) {
            LoadingHelper.hideLoading(context);
          }
          if (state is LoginSuccessState) {
            ToastService.showToast(
              msg: HttpResponse.SUCCESS,
            );
            if (state.role == "CUSTOMER") {
              Navigator.pushReplacementNamed(
                  context, Constants.dashBoardCustomer);
            }
          }
          if (state is LoginFailState) {
            ToastService.showToast(
                msg: state.message, backgroundColor: AppColors.pPrimaryColor);
            // DialogHelper.showGenericErrorDialog(
            //     context: context, message: state.message);
          }
        },
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
                  title: LocaleKeys.log_in,
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
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: TextInputPasswordLabel(
                          label: true,
                          controller: _passwordController,
                          labelText: LocaleKeys.password,
                          hintText: LocaleKeys.password,
                          obscureText: _obscureText,
                          validator: (str) => Validator.validatePassWord(str),
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
                                color:
                                    !_obscureText ? Colors.indigoAccent : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () => Navigator.pushNamed(
                              context, Constants.forgotPassword),
                          child: TextNormal(
                            textAlign: TextAlign.center,
                            color: AppColors.jPrimaryColor,
                            size: 15.sp,
                            title: 'Quên mật khẩu?',
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
                            : AppColors.jPrimaryColor.withOpacity(0.5),
                        child: TextNormal(
                          size: 15.sp,
                          title: "Đăng nhập",
                          color: _validate()
                              ? AppColors.kPrimaryColor
                              : AppColors.kPrimaryColor.withOpacity(0.7),
                        ),
                        onPressed: _validate()
                            ? () {
                                BlocProvider.of<LoginBloc>(context).add(
                                    LoginWithEmailEvent(
                                        email: _emailController.text,
                                        password: _passwordController.text));
                              }
                            : null,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Center(
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () =>
                              Navigator.pushNamed(context, Constants.register),
                          child: TextNormal(
                              textAlign: TextAlign.center,
                              color: AppColors.jPrimaryColor,
                              size: 15.sp,
                              title: "Đăng kí"),
                        ),
                      ),
                    ]),
              ),
            )));
  }

  _validate() {
    if (RegExp(Validator.REGEX_EMAIL).hasMatch(_emailController.text.trim()) &&
        _passwordController.text.trim().isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
