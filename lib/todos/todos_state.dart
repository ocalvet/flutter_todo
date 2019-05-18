import 'package:flutter_todo/todos/todos.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class TodosState extends Equatable {
  TodosState([List props = const []]) : super(props);
}

class TodosLoading extends TodosState {
  @override
  String toString() => 'TodosLoading';
}

class TodosLoaded extends TodosState {
  final List<Todo> todos;
  final bool showCompleted;

  TodosLoaded(
    this.todos,
    this.showCompleted,
  ) : super([todos, showCompleted]);

  List<Todo> get filteredTodos =>
      todos.where((todo) => showCompleted ? true : !todo.completed).toList();

  @override
  String toString() => 'TodosLoaded { todos: $todos }';
}

class TodosLoadError extends TodosState {
  final String error;

  TodosLoadError(this.error) : super([error]);
  @override
  String toString() => 'TodosLoadError: $error';
}
