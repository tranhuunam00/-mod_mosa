import 'package:flutter/material.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/config/images.dart';

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
  final Icon icon;
  final Color color;

  Planing({
    required this.heading,
    required this.subHeading,
    required this.icon,
    required this.color,
  });
}

final List<Course> course = [
  Course(
      onTap: (context) {
        Navigator.pushNamed(context, Constants.dashBoardCustomer);
      },
      text: "Bắt Đầu",
      lessons: "Dung lượng pin",
      imageUrl: AppImages.ngu_ngay_Img,
      percent: 60,
      backImage: AppImages.box3,
      color: AppColors.kGreen),
  Course(
      onTap: () {},
      text: "Giấc ngủ",
      lessons: "26 bài đọc",
      imageUrl: AppImages.quan_sat_ngay_Img,
      percent: 57,
      backImage: AppImages.box1,
      color: AppColors.kDarkBlue),
  Course(
      onTap: () {},
      text: "Osa",
      lessons: "16 video và 12 bài báo",
      imageUrl: AppImages.ngu_ngay_Img,
      percent: 14,
      backImage: AppImages.box3,
      color: AppColors.kGreen),
];

final List<Planing> planing = [
  Planing(
    heading: "Khám phá Mosa",
    subHeading: "8:00 AM - 10:00 AM",
    color: AppColors.kLightBlue,
    icon: const Icon(
      Icons.menu_book_outlined,
      color: AppColors.kDarkBlue,
    ),
  ),
  Planing(
    heading: "Chăm sóc khách hàng",
    subHeading: "8:00 AM - 10:00 AM",
    color: AppColors.kLightBlue,
    icon: const Icon(
      Icons.menu_book_outlined,
      color: AppColors.kDarkBlue,
    ),
  ),
];