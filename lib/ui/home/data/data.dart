import 'package:flutter/material.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/config/images.dart';
import 'package:mod_do_an/storage/secure_storge.dart';

class Course {
  final String text;
  final String lessons;
  final String imageUrl;
  final double percent;
  final String backImage;
  final Color color;
  final Function onTap;

  Course({
    required this.text,
    required this.lessons,
    required this.imageUrl,
    required this.percent,
    required this.backImage,
    required this.color,
    required this.onTap,
  });
}

class Planing {
  final String heading;
  final String subHeading;
  final String icon;
  final Color color;
  final Function onPress;

  Planing(
      {required this.heading,
      required this.subHeading,
      required this.icon,
      required this.color,
      required this.onPress});
}

final List<Course> course = [
  Course(
      onTap: (context) async {
        await SecureStorage().saveIsSaveData(isSaveData: "true");
        Navigator.pushNamed(context, Constants.dashBoardCustomer);
      },
      text: "Bắt Đầu",
      lessons: "Dung lượng pin",
      imageUrl: AppImages.welcome,
      percent: 60,
      backImage: AppImages.box3,
      color: AppColors.kGreen),
  Course(
      onTap: (context) {
        Navigator.pushNamed(context, Constants.myBg);
      },
      text: "Giấc ngủ",
      lessons: "26 bài đọc",
      imageUrl: AppImages.sleep,
      percent: 57,
      backImage: AppImages.box1,
      color: AppColors.kDarkBlue),
  Course(
      onTap: (context) {
        Navigator.pushNamed(context, Constants.myBg);
      },
      text: "Osa",
      lessons: "16 video và 12 bài báo",
      imageUrl: AppImages.osa,
      percent: 14,
      backImage: AppImages.box4,
      color: AppColors.kGreen),
];

final List<Planing> planing = [
  Planing(
      heading: "Theo dõi nhiệt độ",
      subHeading: "",
      onPress: (context) {
        Navigator.pushNamed(context, Constants.temperature);
      },
      color: AppColors.cSecondaryColor,
      icon: AppImages.met_moi_Img),
  Planing(
      heading: "Thiết bị theo dõi",
      subHeading: "",
      onPress: (context) {
        Navigator.pushNamed(context, Constants.findDeviceBle);
      },
      color: Color.fromARGB(255, 139, 166, 175),
      icon: AppImages.chieu_cao_Img),
  Planing(
      heading: "Chăm sóc khách hàng",
      subHeading: "",
      onPress: (context) {
        Navigator.pushNamed(context, Constants.chatbot);
      },
      color: AppColors.kLightBlue,
      icon: AppImages.cskh),
];
