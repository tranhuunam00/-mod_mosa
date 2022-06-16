import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_do_an/component/text/text_normal.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/translations/locale_keys.g.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DialogLanguage extends StatelessWidget {
  const DialogLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 250.w,
        height: 180.h,
        padding:
            EdgeInsets.only(left: 30.w, right: 30.w, top: 40.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextNormal(
                title: LocaleKeys.language.tr(),
                size: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.jPrimaryColor,
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  await context.setLocale(const Locale('ja'));
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 14.w),
                      child: SizedBox(
                        // height: 24.h,
                        // width: 24.w,
                        child: SvgPicture.asset(
                          "assets/icons/ic_FlagJP_setting.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    TextNormal(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      title: LocaleKeys.japanese.tr(),
                      size: 15.sp,
                      height: 1.3.h,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  await context.setLocale(Locale('vi'));
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 14.w),
                      child: SizedBox(
                        // height: 24.h,
                        // width: 24.w,
                        child: SvgPicture.asset(
                            "assets/icons/ic_FlagVN_setting.svg",
                            fit: BoxFit.cover),
                      ),
                    ),
                    TextNormal(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      title: LocaleKeys.vietnamese.tr(),
                      size: 15.sp,
                      height: 1.3.h,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
