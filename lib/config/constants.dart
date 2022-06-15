import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mod_do_an/models/onboarding.dart';
import 'package:mod_do_an/storage/secure_storge.dart';

@immutable
class Constants {
  /* Routing Names */
  static const String login = '/login';
  static const String register = '/register';
  static const String onboardingScreen = '/onboarding';
  static const String baseUrl = "https://mosa-be.herokuapp.com/api/";
  static const String signUpScreen = 'sign_up';
  static const String userRoute = "users/";
  static const Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<Map<String, String>> requestHeadersToken() async {
    var token = await SecureStorage().getToken();
    Map<String, String> _requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': token!
    };
    return _requestHeaders;
  }

  static List<OnboardingContent> contentsOnboarding = [
    OnboardingContent(
        title: 'Sẵn sàng để nói một cách tự tin',
        image: 'assets/images/imgOnboarding1.jpg',
        description:
            "Tham gia các bài học được cá nhân hóa với chuyên gia gia sư và người bản ngữ"),
    OnboardingContent(
        title: 'Học với các gia sư trực tuyến tốt nhất',
        image: 'assets/images/imgOnboarding2.png',
        description:
            "Xem video, hồ sơ và đánh giá của gia sư để chọn gia sư hoàn hảo"),
    OnboardingContent(
        title: 'Giữ liên lạc',
        image: 'assets/images/imgOnboarding3.png',
        description:
            "Nhắn tin cho gia sư và nhận thông báo về bài học của bạn"),
  ];
}
