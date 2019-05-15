import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_todo/authentication/authentication.dart';
import 'package:flutter_todo/login/login.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;

  LoginBloc({@required this.authenticationBloc})
      : assert(authenticationBloc != null);

  @override
  LoginState get initialState => InitialLogin();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is Login) {
      try {
        yield LoggingIn();
        print(event.model.username);
        print(event.model.password);
        await Future.delayed(Duration(seconds: 2));
        String token = '123';
        this.authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginDone();
      } catch (e) {
        print('ERROR');
        print(e);
        yield LoginFailed(error: 'Some error');
      }
    }
    ;
  }
}
