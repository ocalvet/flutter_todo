import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/add_todo_screen.dart';
import 'package:flutter_todo/screens/edit_todo_screen.dart';
import 'package:flutter_todo/screens/login_screen.dart';
import 'package:flutter_todo/screens/todos_screen.dart';
import 'package:flutter_todo/todos_bloc.dart';

import 'authentication.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Authentication>(
        stream: todosBloc.auth$,
        builder: (context, snapshot) {
          bool authenticated = snapshot.hasData && snapshot.data.token != null;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Todoapp',
            theme: ThemeData(
              primarySwatch: Colors.teal,
            ),
            routes: <String, WidgetBuilder>{
              '/': (BuildContext context) =>
                  authenticated ? TodosScreen() : LoginScreen(),
              '/add-todo': (BuildContext context) => AddTodoScreen(),
              '/edit-todo': (BuildContext context) => EditTodoScreen(),
            },
          );
        });
  }
}
