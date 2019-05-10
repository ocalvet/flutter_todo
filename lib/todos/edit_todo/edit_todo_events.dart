import 'package:flutter_todo/todos/todo.dart';
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

class UpdateTodoField extends EditTodoEvent {
  final String field;
  final String value;
  UpdateTodoField({
    @required this.field,
    @required this.value,
  }) : super([
          field,
          value,
        ]);
  toString() =>
      'UpdateTodoField field "${this.field}" and value "${this.value}"';
}
