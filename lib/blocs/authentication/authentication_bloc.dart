import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/blocs/authentication/authentication_event.dart';
import 'package:mod_do_an/blocs/authentication/authentication_state.dart';
import 'package:mod_do_an/repository/authentication_repository.dart';
import 'package:mod_do_an/storage/secure_storge.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationBloc({required this.authenticationRepository})
      : super(AuthenticationInitialState());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppLoadedEvent) {
      yield* _mapAppLoadedToState(event);
    } else if (event is LoggedOutEvent) {
      yield* _mapLoggedOutToState(event);
    }
  }

  Stream<AuthenticationState> _mapAppLoadedToState(
      AppLoadedEvent event) async* {
    yield AuthenticationLoadingState();
    var token = await SecureStorage().getToken();
    if (token != null) {
      yield AuthenticationAuthenticatedState();
    } else {
      yield AuthenticationNotAuthenticatedState();
    }
  }

  Stream<AuthenticationState> _mapLoggedOutToState(
      LoggedOutEvent event) async* {
    yield AuthenticationLoadingState();
    await SecureStorage().deleteToken();
    yield AuthenticationAuthenticatedState();
  }
}
