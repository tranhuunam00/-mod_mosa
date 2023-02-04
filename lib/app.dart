import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mod_do_an/blocs/authentication/authentication_bloc.dart';
import 'package:mod_do_an/blocs/authentication/authentication_state.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/ui/auth/forgot.screen.dart';
import 'package:mod_do_an/ui/auth/login.screen.dart';
import 'package:mod_do_an/ui/auth/onboarding/onboarding_screen.dart';
import 'package:mod_do_an/ui/auth/register.screen.dart';
import 'package:mod_do_an/ui/chatbot/chatbot.dart';
import 'package:mod_do_an/ui/chatbot/welcome/welcome_chatbot_screen.dart';
import 'package:mod_do_an/ui/customer/changeUser.dart';
import 'package:mod_do_an/ui/customer/profile/profile_screen.dart';
import 'package:mod_do_an/ui/customer/quiz/page_stopbang.dart';
import 'package:mod_do_an/ui/customer/quiz/quiz_screen.dart';
import 'package:mod_do_an/ui/customer/settings_screen.dart';
import 'package:mod_do_an/ui/dashboard_customer_screen.dart';
import 'package:mod_do_an/ui/home/home_screen.dart';
import 'app_navigator.dart';

class DoAnApp extends StatelessWidget {
  const DoAnApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (BuildContext context, child) => GlobalLoaderOverlay(
                  child: MaterialApp(
                    title: 'Đò án',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                    ),
                    navigatorKey: Appnavigator.navigatorKey,
                    home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        if (state is AuthenticationAuthenticatedState) {
                          return const WelcomeChatbotScreen();
                        } else {
                          return const WelcomeChatbotScreen();
                        }
                      },
                    ),
                    routes: {
                      Constants.onboardingScreen: (context) =>
                          const OnboardingScreen(),
                      Constants.login: (context) => const LoginScreen(),
                      Constants.register: (context) => const RegisterScreen(),
                      Constants.dashBoardCustomer: (context) =>
                          const DashboardCustomerScreen(),
                      Constants.forgotPassword: (context) =>
                          const ForgotScreen(),
                      Constants.myProfileSreen: (context) =>
                          const MyProfileScreen(),
                      Constants.quizScreen: (context) => const QuizScreen(),
                      Constants.stopbangAll: (context) =>
                          const PageStopbangScreen(),
                      Constants.settingScreen: (context) =>
                          const SettingsScreen(),
                      Constants.changeUSer: (context) =>
                          const ChangeUserScreen(),
                      Constants.chatbot: (context) => const Chatbot(),
                    },
                  ),
                )));
  }
}
