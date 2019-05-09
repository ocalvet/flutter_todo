import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_todo/authentication/authentication_event.dart';
import 'package:flutter_todo/authentication/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  get initialState => AuthenticationUnauthenticated();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      // TODO add logic here
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      // await userRepository.persistToken(event.token);
      await Future.delayed(Duration(seconds: 2));
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      // await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
