import 'package:flutter_todo/todo.dart';

class AddTodoAction {
  final String title;
  final String description;
  AddTodoAction({this.title, this.description});
}

class FilterTodosAction {}

class MarkTodoCompletedAction {
  final Todo todo;
  MarkTodoCompletedAction({this.todo});
}