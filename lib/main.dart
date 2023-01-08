import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/app.dart';

import 'package:flutter/material.dart';
import 'package:mod_do_an/blocs/authentication/authentication_bloc.dart';
import 'package:mod_do_an/blocs/authentication/authentication_event.dart';
import 'package:mod_do_an/blocs/custommer/customer_bloc.dart';
import 'package:mod_do_an/blocs/forgot/forgot_bloc.dart';
import 'package:mod_do_an/blocs/login/login_bloc.dart';
import 'package:mod_do_an/blocs/profile/profile_bloc.dart';
import 'package:mod_do_an/blocs/register/register_bloc.dart';
import 'package:mod_do_an/provider/Chatbot.provider.dart';
import 'package:mod_do_an/provider/bluetooth.provider.dart';
import 'package:mod_do_an/repositories/authentication_repository.dart';
import 'package:mod_do_an/repositories/customer_repository.dart';
import 'package:mod_do_an/repositories/profile_repository.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  WidgetsFlutterBinding.ensureInitialized();

  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  HttpOverrides.global = MyHttpOverrides();
  runZonedGuarded(() {
    runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => AuthenticationBloc(
                    authenticationRepository: authenticationRepository)
                  ..add(AppLoadedEvent())),
            BlocProvider(
                create: (context) => LoginBloc(
                    authenticationRepository: authenticationRepository)),
            BlocProvider(
              create: (context) => RegisterBloc(
                authenticationRepository: authenticationRepository,
              ),
            ),
            BlocProvider(
              create: (context) => ForgotBloc(
                authenticationRepository: authenticationRepository,
              ),
            ),
            BlocProvider(
              create: (context) => ProfileBloc(
                profileRepository: ProfileRepository(),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  CustomerBloc(customerRepository: CustomerRepository()),
            ),
          ],
          child: MultiProvider(providers: [
            ChangeNotifierProvider(create: (context) {
              return BluetoothProvider();
            }),
            ChangeNotifierProvider(create: (context) {
              return ChatbotProvider();
            }),
          ], child: const DoAnApp())),
    );
  }, (error, stackTrace) {});
}
