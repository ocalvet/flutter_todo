import 'package:flutter/material.dart';
import 'package:flutter_todo/authentication/authentication_bloc.dart';
import 'package:flutter_todo/authentication/screens/login_screen.dart';
import 'package:flutter_todo/shared/http_provider.dart';
import 'package:flutter_todo/shared/storage_provider.dart';
import 'package:flutter_todo/todos/edit_todo/edit_todo_bloc.dart';
import 'package:flutter_todo/todos/edit_todo/edit_todo_screen.dart';
import 'package:flutter_todo/todos/screens/add_todo_screen.dart';
import 'package:flutter_todo/todos/screens/todos_screen.dart';
import 'package:flutter_todo/todos/todo_repository.dart';
import 'package:flutter_todo/todos/todos_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/todos/todos_events.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  TodosBloc _bloc;
  AuthenticationBloc _authBloc;
  EditTodoBloc _editTodoBloc;
  @override
  void initState() {
    StorageProvider _storage = StorageProvider();
    HttpProvider _http = HttpProvider();
    TodoRepository _todosRepository =
        TodoRepository(http: _http, storage: _storage);
    _bloc = TodosBloc(todosRepository: _todosRepository);
    _bloc.dispatch(LoadTodos());
    _authBloc = AuthenticationBloc();
    _editTodoBloc = EditTodoBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<TodosBloc>(bloc: _bloc),
        BlocProvider<AuthenticationBloc>(bloc: _authBloc),
        BlocProvider<EditTodoBloc>(bloc: _editTodoBloc),
      ],
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
