import 'package:flutter_todo/todo.dart';

class TodosAppState {
  final List<Todo> todos;
  final bool showCompleted;
  TodosAppState({this.todos, this.showCompleted});
}