import 'package:flutter_todo/todos/todo.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class EditTodoState extends Equatable {
  EditTodoState([List props = const []]) : super([props]);
}

class InitialEditTodo extends EditTodoState {
  InitialEditTodo() : super([]);
  toString() => 'InitialEditTodo';
}
