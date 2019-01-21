import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/add_todo_screen.dart';
import 'package:flutter_todo/screens/todos_screen.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todoapp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: TodosScreen(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => TodosScreen(),
        '/add-todo': (BuildContext context) => AddTodoScreen(),
      },
    );
  }
}
