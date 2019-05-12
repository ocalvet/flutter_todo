import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_todo/login/login_events.dart';
import 'package:flutter_todo/login/login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => InitialLogin();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is Login) {
      try {
        yield LoggingIn();
        print(event.model.username);
        print(event.model.password);
        yield LoggedIn(token: 'skj34hdjkfhdjk42fhdkjsfhjkf');
      } catch (e) {
        print('ERROR');
        print(e);
        yield LoginFailed(error: 'Some error');
      }
    }
    ;
  }
}
