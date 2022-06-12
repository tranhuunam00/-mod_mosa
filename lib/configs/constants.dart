import 'package:flutter/material.dart';
import 'package:mod_do_an/storage/secure_storge.dart';

@immutable
class Constants {
  /* Routing Names */
  static const String splashScreen = '/splash';
  static const String dashboardScreen = '/dashboard';
  static const String onboardingScreen = '/onboarding';
  static const String searchScreen = '/tutor';
  static const String scheduleScreen = '/schedule';
  static const String chatScreen = '/chat';
  static const String chatScreenLogout = '/chat_logout';
  static const String tutorDetailScreen = '/courses_detail';
  static const String reviewsScreen = '/reviews';
  static const String selectScheduleScreen = '/select_schedule';
  static const String studentScreen = '/student';
  static const String homeScreen = '/home';
  static const String coursesScreen = '/courses';
  static const String promotionScreen = '/promotion';
  static const String coursesDetailScreen = '/profile_tutor_screen';
  static const String dashboardStudentScreen = '/dashboard_student_screen';
  static const String flexibleLessonsDetailScreen =
      '/flexible_lessons_detail_screen';
  static const String fixedCourseDetailScreen = '/fixed_course_detail_screen';
  static const String promotionDetailScreen = '/promotion_detail_screen';
  static const String bottomSheetSignIn = '/bottom_sheet_sign_in';
  static const String eWalletScreen = '/e_wallet_screen';
  static const String myPointScreen = '/my_point_screen';
  static const String myPaymentMethod = '/my_payment_method_screen';
  static const String paymentHistoryScreen = '/payment_history_screen';
  static const String bottomSheetSignInScreen = '/bottom_sheet_sign_in_screen';
  static const String myProfileScreen = '/my_profile_screen';
  static const String studiedTeacherScreen = '/studied_teacher_screen';
  static const String passwordScreen = '/password_screen';
  static const String flexibleLessonsScreen = '/flexible_lessons_screen';
  static const String fixedCourseScreen = '/fixed_course_screen';
  static const String courseRegisDetailScreen = '/course_regis_detail_screen';
  static const String lessonRegisDetailScreen = '/lesson_regis_detail_screen';
  static const String abstractScreen = '/abstract_screen';
  static const String basicPackageScreen = '/basic_package_screen';
  static const String baseUrl = "https://vietlesson4u.com/api/";
  static const String userRoute = "users/";
  static const String coursesRoute = '/courses/by-student';
  static const String tutorRoute = 'tutors/by-student';
  static const String tutorLearned = 'students/tutors-learned';
  static const String lessonsRoute = 'lessons/flexible/by-student';
  static const String signInScreen = 'sign_sin';
  static const String signUpScreen = 'sign_up';
  static const String calendarScreen = 'calendar_screen';
  static const String courseLessonRegisteredScreen =
      'course_lesson_registered_screen';
  static const String paypalWebScreen = 'paypal-web-screen';

  static const String studentRole = "STUDENT";

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

  static List<String> sortFilter = [
    'Sort by relevance',
    'Popularity',
    'Price: highest first',
    'Price: lowest first',
    'Reviews',
    'Rating',
  ];
}
