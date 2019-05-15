import 'package:flutter_todo/todos/todos.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class EditTodoState extends Equatable {
  EditTodoState([List props = const []]) : super([props]);
}

class InitialEditTodo extends EditTodoState {
  InitialEditTodo() : super([]);
  toString() => 'InitialEditTodo';
}

class EditingTodo extends EditTodoState {
  final Todo todo;
  EditingTodo({@required this.todo}) : super([todo]);
  toString() => 'EditingTodo';
}
