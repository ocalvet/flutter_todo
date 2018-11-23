import 'package:flutter_todo/todo.dart';

class AddTodoAction {
  final String title;
  final String description;
  AddTodoAction({this.title, this.description});
}

class FilterTodosAction {}

class MarkTodoCompleteAction {
  final Todo todo;
  MarkTodoCompleteAction({this.todo});
}