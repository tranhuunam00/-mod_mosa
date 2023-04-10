import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/component/button/button_material.dart';
import 'package:mod_do_an/component/text/text_normal.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/storage/secure_storge.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: PageView.builder(
                  itemCount: Constants.contentsOnboarding.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 80.h, bottom: 70.h, left: 20.w, right: 20.w),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                              Constants.contentsOnboarding[i].image,
                            ),
                            height: 300.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                Constants.contentsOnboarding.length,
                (index) => buildDot(index, context),
              ),
            ),
            Container(
              height: 40.h,
              margin: EdgeInsets.symmetric(horizontal: 56.w, vertical: 24.h),
              child: ButtonMaterial(
                  enable: true,
                  color: AppColors.pPrimaryColor.withOpacity(0.7),
                  child: TextNormal(
                    size: 15.sp,
                    fontWeight: FontWeight.w600,
                    title: "Sử dụng không cần lưu",
                    color: AppColors.kPrimaryColor,
                  ),
                  onPressed: () async {
                    await SecureStorage().saveIsSaveData(isSaveData: "false");
                    Navigator.pushReplacementNamed(
                        context, Constants.dashBoardCustomer);
                  }),
            ),
            Container(
              height: 50.h,
              margin: EdgeInsets.symmetric(horizontal: 56.w, vertical: 24.h),
              child: ButtonMaterial(
                  enable: true,
                  color: AppColors.jPrimaryColor.withOpacity(0.7),
                  child: TextNormal(
                    size: 15.sp,
                    title: "Đăng nhập",
                    color: AppColors.kPrimaryColor,
                  ),
                  onPressed: () => {
                        Navigator.pushReplacementNamed(
                            context, Constants.login),
                      }),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 64.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextNormal(
                    textAlign: TextAlign.left,
                    title: 'Bạn đã có tài khoản?',
                    color: AppColors.grey400,
                    size: 15.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  InkWell(
                    onTap: () {
                      print("hihi");
                      Navigator.pushReplacementNamed(
                          context, Constants.register);
                    },
                    child: TextNormal(
                      textAlign: TextAlign.left,
                      title: ' Đăng Ký',
                      color: AppColors.jPrimaryColor,
                      size: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.h,
      width: 10.w,
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: currentIndex == index
            ? AppColors.jPrimaryColor
            : AppColors.jPrimaryColor.withOpacity(0.3),
      ),
    );
  }
}
