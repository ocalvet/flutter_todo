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
        //5
        '/home': (BuildContext context) => TodosPage(), //6
        '/add-todo': (BuildContext context) => AddTodoPage() //7
      },
    );
  }
}
