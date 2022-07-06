import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/blocs/profile/profile_bloc.dart';
import 'package:mod_do_an/blocs/profile/profile_event.dart';
import 'package:mod_do_an/blocs/profile/profile_state.dart';
import 'package:mod_do_an/component/button/button_setting.dart';
import 'package:mod_do_an/component/text/text_bold.dart';
import 'package:mod_do_an/component/text/text_normal.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/config/images.dart';
import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/storage/secure_storge.dart';
import 'package:mod_do_an/translations/locale_keys.g.dart';
import 'package:mod_do_an/ui/components/background.dart';
import 'package:mod_do_an/utils/loading_helper.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late ProfileUser profileUser;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoadingState) {
            LoadingHelper.showLoading(context);
          } else if (state is ProfileLoadedState) {
            LoadingHelper.hideLoading(context);
            print("get profile success");
          } else if (state is ProfileErrorState) {
            LoadingHelper.hideLoading(context);
          }
        },
        buildWhen: (context, state) {
          return state is ProfileLoadingState ||
              state is ProfileLoadedState ||
              state is ProfileErrorState;
        },
        builder: (context, state) {
          if (state is ProfileLoadedState) {
            profileUser = state.profileUser;
            return Background(
              urlBackground: AppImages.backgroundDefault,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.jPrimaryColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(40.r))),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30.h),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, right: 24.w, top: 50.h),
                              child: Row(
                                children: [
                                  Container(
                                    width: 65.w,
                                    height: 65.w,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(65.w),
                                      child: FadeInImage.assetNetwork(
                                          placeholder: AppImages.avatarDefault,
                                          fit: BoxFit.fitWidth,
                                          image:
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy94eWBX3gQKPXUJKjErmQD_2ym2uLaMfkag&usqp=CAU"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextBold(
                                        title: profileUser.firstName +
                                            " " +
                                            profileUser.lastName,
                                        size: 20.sp,
                                        colors: AppColors.kPrimaryColor,
                                      ),
                                      TextNormal(
                                        title: LocaleKeys.student.tr(),
                                        color: AppColors.kPrimaryColor,
                                        size: 15,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24.w, right: 24.w),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.phone,
                                    color: AppColors.kPrimaryColor,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  TextNormal(
                                    title: profileUser.phone,
                                    color: AppColors.kPrimaryColor,
                                    size: 15.sp,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24.w, right: 24.w),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.mail_outline_outlined,
                                    color: AppColors.kPrimaryColor,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  TextNormal(
                                    title: profileUser.email,
                                    color: AppColors.kPrimaryColor,
                                    size: 15.sp,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ButtonSetting(
                        widget: Icon(Icons.favorite_border,
                            color: AppColors.jPrimaryColor.withOpacity(0.7)),
                        title: LocaleKeys.profile.tr(),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Constants.myProfileSreen,
                            arguments: profileUser,
                          );
                        },
                        color: AppColors.primaryColor),
                    ButtonSetting(
                        widget: Icon(Icons.contact_support_rounded,
                            color: AppColors.jPrimaryColor.withOpacity(0.7)),
                        title: LocaleKeys.support.tr(),
                        color: AppColors.primaryColor),
                    ButtonSetting(
                        onTap: () {
                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return const DialogLanguage();
                          //     });
                        },
                        widget: Icon(Icons.chat_outlined,
                            color: AppColors.jPrimaryColor.withOpacity(0.7)),
                        title: LocaleKeys.language.tr(),
                        color: AppColors.primaryColor),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5.w,
                            color: AppColors.grey400.withOpacity(0.5)),
                      ),
                    ),
                    ButtonSetting(
                        onTap: () async {
                          await SecureStorage().deleteToken();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            Constants.onboardingScreen,
                            (Route<dynamic> route) => false,
                          );
                        },
                        widget: const Icon(Icons.logout_outlined,
                            color: Colors.redAccent),
                        title: LocaleKeys.log_out.tr(),
                        color: Colors.redAccent),
                    ButtonSetting(
                        onTap: () async {
                          Navigator.of(context).pushNamed(
                            Constants.quizScreen,
                          );
                        },
                        widget: const Icon(Icons.logout_outlined,
                            color: Colors.white),
                        title: "stop_bang",
                        color: Colors.white),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
