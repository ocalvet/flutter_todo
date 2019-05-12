import 'package:bloc/bloc.dart';
import 'package:flutter_todo/login/login_events.dart';
import 'package:flutter_todo/login/login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => InitialLogin();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) {
    // TODO: implement mapEventToState
    return null;
  }
}
