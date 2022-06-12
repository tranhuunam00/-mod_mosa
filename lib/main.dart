import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/app.dart';

import 'package:flutter/material.dart';
import 'package:mod_do_an/blocs/authentication/authentication_bloc.dart';
import 'package:mod_do_an/blocs/authentication/authentication_event.dart';
import 'package:mod_do_an/blocs/login/login_bloc.dart';
import 'package:mod_do_an/repository/authentication_repository.dart';

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
      MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) => AuthenticationBloc(
                authenticationRepository: authenticationRepository)
              ..add(AppLoadedEvent())),
        BlocProvider(
            create: (context) =>
                LoginBloc(authenticationRepository: authenticationRepository)),
      ], child: const DoAnApp()),
    );
  }, (error, stackTrace) {});
}
