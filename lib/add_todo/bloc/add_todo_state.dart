import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddTodoState extends Equatable {
  AddTodoState([List props = const []]) : super(props);
}

class InitialAddTodoState extends AddTodoState {}
