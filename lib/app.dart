import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mod_do_an/blocs/authentication/authentication_bloc.dart';
import 'package:mod_do_an/blocs/authentication/authentication_state.dart';
import 'package:mod_do_an/config/constants.dart';
import 'package:mod_do_an/ui/auth/login.screen.dart';
import 'package:mod_do_an/ui/auth/onboarding/onboarding_screen.dart';
import 'package:mod_do_an/ui/auth/register.screem.dart';

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
                    home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        if (state is AuthenticationAuthenticatedState) {
                          print(state);
                          return const OnboardingScreen();
                        } else {
                          return const OnboardingScreen();
                        }
                      },
                    ),
                    routes: {
                      Constants.onboardingScreen: (context) =>
                          const OnboardingScreen(),
                      Constants.login: (context) => const LoginScreen(),
                    },
                  ),
                )));
  }
}
