import 'package:flutter/material.dart';
import 'package:flutter_todo/redux/todos_state.dart';
import 'package:flutter_todo/todo_app.dart';
import 'package:flutter_todo/redux/todos_reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<TodosAppState>(
    todosReducer, 
    initialState: TodosAppState(allTodos: [], showCompleted: true)
  );
  runApp(
    StoreProvider(
      store: store,
      child: TodoApp(),
    )
  );
}
