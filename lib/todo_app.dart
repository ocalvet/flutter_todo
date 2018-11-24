import 'package:flutter/material.dart';
import 'package:flutter_todo/add_todo_page.dart';
import 'package:flutter_todo/todos_page.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todoapp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: TodosPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => TodosPage(),
        '/add-todo': (BuildContext context) => AddTodoPage(),
      },
    );
  }
}
