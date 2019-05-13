import 'package:flutter_todo/login/login_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class Login extends LoginEvent {
  final LoginModel model;
  Login({this.model}) : super([model]);
}
