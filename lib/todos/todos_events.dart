import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_todo/models/models.dart';

@immutable
abstract class TodosEvent extends Equatable {
  TodosEvent([List props = const []]) : super(props);
}

class LoadTodos extends TodosEvent {
  @override
  String toString() => 'LoadTodos';
}

class AddTodo extends TodosEvent {
  final Todo todo;

  AddTodo(this.todo) : super([todo]);

  @override
  String toString() => 'AddTodo { todo: $todo }';
}

class UpdateTodo extends TodosEvent {
  final Todo todo;

  UpdateTodo(this.todo) : super([todo]);

  @override
  String toString() => 'UpdateTodo { todo: $todo }';
}

class DeleteTodo extends TodosEvent {
  final Todo todo;

  DeleteTodo(this.todo) : super([todo]);

  @override
  String toString() => 'DeleteTodo { todo: $todo }';
}

class ToggleCompleted extends TodosEvent {
  @override
  String toString() => 'ToggleCompleted';
}
