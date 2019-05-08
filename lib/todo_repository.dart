import 'dart:async';

import 'package:flutter_todo/http_provider.dart';
import 'package:flutter_todo/storage_provider.dart';
import 'package:flutter_todo/todo.dart';
import 'package:meta/meta.dart';

class TodoRepository {
  final HttpProvider http;
  final StorageProvider storage;
  final String apiUrl = "http://localhost:6000/api/todos";

  TodoRepository({@required this.http, @required this.storage});

  Future<TodoList> getTodos() async {
    var storageTodos = storage.getAll('todos');
    List<Map<String, dynamic>> serverTodos;
    List<Todo> todos = List<Todo>();
    try {
      serverTodos = await this.http.getAll('$apiUrl');
    } catch (_) {
      serverTodos = List<Map<String, dynamic>>();
    }
    if (serverTodos.length > 0) {
      serverTodos.forEach((todoJson) => todos.add(Todo.fromJson(todoJson)));
    }
    if (storageTodos != null) {
      var storageTodoList = TodoList.fromJson(storageTodos);
      TodoList syncedtodos = TodoList(todos: todos);
      storageTodoList.todos.forEach((todo) {
        if (!todos.contains(todo)) {
          syncedtodos.todos.add(todo);
        }
      });
      return syncedtodos;
    } else {
      return TodoList(todos: todos);
    }
  }
}
