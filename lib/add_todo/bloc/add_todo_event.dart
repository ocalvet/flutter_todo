import 'package:equatable/equatable.dart';
import 'package:flutter_todo/models/models.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddTodoEvent extends Equatable {
  AddTodoEvent([List props = const []]) : super(props);
}

class AddTodoSave extends AddTodoEvent {
  toString() => 'AddTodoSave';
}

class AddTodoUpdate extends AddTodoEvent {
  final Todo todo;
  AddTodoUpdate(this.todo) : super([todo]);
  toString() => 'AddTodoUpdate';
}
