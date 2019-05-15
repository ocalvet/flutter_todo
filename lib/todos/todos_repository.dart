import 'dart:async';
import 'package:flutter_todo/shared/http_provider.dart';
import 'package:flutter_todo/shared/storage_provider.dart';
import 'package:flutter_todo/todos/todos.dart';
import 'package:meta/meta.dart';

class TodoRepository {
  static const String STORAGE_KEY = 'todos';
  final HttpProvider http;
  final StorageProvider storage;
  final String apiUrl = "http://localhost:6000/api/todos";

  TodoRepository({@required this.http, @required this.storage});

  Future<TodoList> getTodos() async {
    var storageTodos = await storage.getAll(STORAGE_KEY);
    List serverTodos;
    List<Todo> todos = List<Todo>();
    try {
      serverTodos = await this.http.getAll('$apiUrl');
    } catch (e) {
      print(e);
      serverTodos = List();
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
      storage.save(STORAGE_KEY, syncedtodos.toJson());
      return syncedtodos;
    } else {
      var serverList = TodoList(todos: todos);
      storage.save(STORAGE_KEY, serverList.toJson());
      return serverList;
    }
  }
}
