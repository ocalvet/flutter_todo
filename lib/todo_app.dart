import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/add_todo_screen.dart';
import 'package:flutter_todo/screens/edit_todo_screen.dart';
import 'package:flutter_todo/screens/login_screen.dart';
import 'package:flutter_todo/screens/todos_screen.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoAPP',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => LoginScreen(),
        '/todos': (BuildContext context) => TodosScreen(),
        '/add-todo': (BuildContext context) => AddTodoScreen(),
        '/edit-todo': (BuildContext context) => EditTodoScreen(),
      },
    );
  }
}
