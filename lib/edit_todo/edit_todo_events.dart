import 'package:flutter_todo/todos/todos.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class EditTodoEvent extends Equatable {
  EditTodoEvent([List props = const []]) : super([props]);
}

class EditTodo extends EditTodoEvent {
  final Todo todo;
  EditTodo({
    @required this.todo,
  }) : super([todo]);
  toString() => 'EditTodo ${todo.id}';
}

class UpdateEditingTodo extends EditTodoEvent {
  final Todo todo;
  UpdateEditingTodo({
    @required this.todo,
  }) : super([todo]);
  toString() =>
      'UpdateEditingTodo with title "${this.todo.title}" and description "${this.todo.description}"';
}
