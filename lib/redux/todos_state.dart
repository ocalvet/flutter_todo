import 'package:flutter_todo/todo.dart';

class TodosAppState {
  final List<Todo> allTodos;
  List<Todo> get todos => showCompleted ? allTodos : allTodos.where((todo) => !todo.completed).toList();
  final bool showCompleted;
  TodosAppState({ this.allTodos, this.showCompleted});
}