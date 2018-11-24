import 'package:flutter_todo/todo.dart';

class TodosAppState {
  final List<Todo> allTodos;
  final bool showCompleted;
  TodosAppState({this.allTodos, this.showCompleted});

  List<Todo> get todos => showCompleted
      ? allTodos
      : allTodos.where((todo) => !todo.completed).toList();
}
