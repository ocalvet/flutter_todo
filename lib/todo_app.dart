import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/add_todo_screen.dart';
import 'package:flutter_todo/screens/edit_todo_screen.dart';
import 'package:flutter_todo/screens/login_screen.dart';
import 'package:flutter_todo/screens/todos_screen.dart';
import 'package:flutter_todo/todo_service.dart';
import 'package:flutter_todo/todos_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final storage = LocalStorage('todos');
  final todosService = TodoService();
  TodosBloc _bloc;
  @override
  void initState() {
    _bloc = TodosBloc(storage: storage, todosService: todosService);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodosBloc>(
      bloc: _bloc,
      child: MaterialApp(
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
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
