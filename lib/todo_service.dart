import 'dart:async';

import 'package:flutter_todo/todo.dart';
import 'package:dio/dio.dart';

class TodoService {
  final String apiUrl = "http://localhost:6000/api/todos";

  Future<TodoList> getTodos() async {
    Response response = await Dio().get(apiUrl);
    var todos = List<Todo>();
    response.data.forEach((todoJson) => todos.add(Todo.fromJson(todoJson)));
    return TodoList(todos: todos);
  }
}
