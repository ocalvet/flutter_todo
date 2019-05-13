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

class LoginDone extends LoginState {
  toString() => 'LoginDone';
}

class LoginFailed extends LoginState {
  final String error;
  LoginFailed({this.error}) : super([error]);
  toString() => 'LoginFailed';
}
