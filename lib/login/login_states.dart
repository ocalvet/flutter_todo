import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  LoginState([props = const []]) : super(props);
}

class InitialLogin extends LoginState {
  toString() => 'InitialLogin';
}

class LoggingIn extends LoginState {
  toString() => 'LoggingIn';
}

class LoggedIn extends LoginState {
  final String token;
  LoggedIn({this.token}) : super([token]);
  toString() => 'LoggedIn token: ${this.token}';
}

class LoginFailed extends LoginState {
  final String error;
  LoginFailed({this.error}) : super([error]);
  toString() => 'LoginFailed';
}
