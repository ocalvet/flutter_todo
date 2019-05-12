import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  LoginState([props = const []]) : super(props);
}

class InitialLogin extends LoginState {
  toString() => 'InitialLogin';
}
