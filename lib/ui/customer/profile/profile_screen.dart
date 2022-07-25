import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mod_do_an/blocs/profile/profile_bloc.dart';
import 'package:mod_do_an/blocs/profile/profile_event.dart';
import 'package:mod_do_an/blocs/profile/profile_state.dart';
import 'package:mod_do_an/component/button/button_material.dart';
import 'package:mod_do_an/component/input_field/text_input_label.dart';
import 'package:mod_do_an/component/input_field/text_password_label.dart';
import 'package:mod_do_an/component/text/text_bold.dart';
import 'package:mod_do_an/component/text/text_normal.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/translations/locale_keys.g.dart';
import 'package:mod_do_an/ui/components/bottom_sheet/bsh_pick_image.dart';
import 'package:mod_do_an/ui/components/full_screen_image/full_screen_image.dart';
import 'package:mod_do_an/utils/loading_helper.dart';
import 'package:mod_do_an/utils/picker_helper.dart';
import 'package:mod_do_an/utils/validator.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  ProfileUser? profileUser;
  String? image;
  DateTime selectedDate = DateTime.now();
  bool isFetch = false;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as ProfileUser;
    if (!isFetch) {
      _firstNameController.text = arguments.firstName;
      _lastNameController.text = arguments.lastName;
      _emailController.text = arguments.email;
      _phoneController.text = arguments.phone;
      _dobController.text = arguments.dob;

      if (arguments.gender == "MALE") {
        _genderController.text = LocaleKeys.male.tr();
      } else {
        _genderController.text = LocaleKeys.female.tr();
      }
      isFetch = true;
    }
    return Scaffold(
      backgroundColor: AppColors.bgPrimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.jPrimaryColor,
        elevation: 0,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: AppColors.kPrimaryColor,
          ),
        ),
        title: TextBold(
          title: LocaleKeys.profile.tr(),
          size: 17.sp,
          colors: Colors.white,
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16.h),
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            print(state);
            if (state is UpdateProfileLoadingState) {
              LoadingHelper.showLoading(context);
            } else if (state is UpdateProfileSuccessState) {
              LoadingHelper.hideLoading(context);
              BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
              // DialogHelper.showUpdateProfileSuccess(
              //   title: LocaleKeys.profile.tr(),
              //   context: context,
              //   message: LocaleKeys.secsess_profile.tr(),
              // );
            } else if (state is UpdateProfileErrorState) {
              LoadingHelper.hideLoading(context);
              // DialogHelper.showGenericErrorDialog(
              //   context: context,
              //   message: state.message,
              // );
              print("error: " + state.message);
            }
          },
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          height: 120.w,
                          width: 120.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  image != null || arguments.avatarUrl != null
                                      ? Colors.white
                                      : Colors.red.withOpacity(0.7),
                              width:
                                  image != null || arguments.avatarUrl != null
                                      ? 0.w
                                      : 2.w,
                            ),
                            shape: BoxShape.circle,
                          ),
                          // child: FullScreenWidget(
                          //   profile: "profile",
                          //   child: image != null
                          //       ? Image.file(
                          //           File(image!),
                          //           width: 120.w,
                          //           height: 120.w,
                          //           fit: BoxFit.cover,
                          //         )
                          //       : arguments.avatarUrl != null
                          //           ? CachedNetworkImage(
                          //               fit: BoxFit.cover,
                          //               imageUrl: arguments.avatarUrl!,
                          //               placeholder: (context, url) => SizedBox(
                          //                 height: 20.w,
                          //                 width: 20.w,
                          //                 child: const Center(
                          //                   child: CircularProgressIndicator(),
                          //                 ),
                          //               ),
                          //               // errorWidget: (context, url, error) =>
                          //               //     Image.asset(AppImages.imgAvatar1),
                          //             )
                          //           : Container(),
                          // ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () async {
                              var a = await showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0.r),
                                ),
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return const BottomSheetPickImage();
                                },
                              );
                              setState(() {
                                image = a;
                              });
                            },
                            child: Container(
                              height: 30.w,
                              width: 30.w,
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                    color: AppColors.qSecondaryColor),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: AppColors.qSecondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: TextInputLabel(
                      label: true,
                      controller: _lastNameController,
                      labelText: LocaleKeys.surname.tr(),
                      hintText: LocaleKeys.surname.tr(),
                      onChanged: (a) {
                        setState(() {});
                      },
                    ),
                  ),
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
                    child: TextInputPasswordLabel(
                      // onTap: () => Navigator.pushNamed(
                      //   context,
                      //   Constants.passwordScreen,
                      //   arguments: profileUser,
                      // ),
                      controller: _passwordController,
                      labelText: LocaleKeys.password.tr(),
                      hintText: LocaleKeys.password.tr(),
                      readOnly: true,
                      obscureText: true,
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
                    child: TextInputPasswordLabel(
                      onTap: () async {
                        var result = await showDialog(
                          context: context,
                          builder: (context) {
                            return Container();
                            // return DialogGender(
                            //   gender: _genderController.text.trim(),
                            // );
                          },
                        );
                        if (result != null) {
                          setState(() {
                            _genderController.text = result;
                          });
                        }
                      },
                      label: true,
                      controller: _genderController,
                      labelText: LocaleKeys.gender.tr(),
                      hintText: LocaleKeys.gender.tr(),
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
                  SizedBox(
                    height: 25.h,
                  ),
                  ButtonMaterial(
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
                            BlocProvider.of<ProfileBloc>(context).add(
                              UpdateProfileEvent(
                                imagePath: image,
                                profileUser: ProfileUser(
                                    dob: _dobController.text.trim(),
                                    gender:
                                        _genderController.text.trim() == "Nam"
                                            ? "MALE"
                                            : "FEMALE",
                                    firstName: _firstNameController.text.trim(),
                                    lastName: _lastNameController.text.trim(),
                                    email: _emailController.text.trim(),
                                    phone: _phoneController.text.trim(),
                                    id: "",
                                    customerId: "",
                                    nationality: ""),
                              ),
                            );
                          }
                        : null,
                    enable: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _validate() {
    if (_firstNameController.text.trim().isNotEmpty &&
        _lastNameController.text.trim().isNotEmpty &&
        RegExp(Validator.REGEX_EMAIL).hasMatch(_emailController.text.trim()) &&
        _phoneController.text.trim().length == 12 &&
        _genderController.text.trim().isNotEmpty &&
        _dobController.text.trim().isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
