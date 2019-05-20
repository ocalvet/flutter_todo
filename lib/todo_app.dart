import 'package:flutter/material.dart';
import 'package:flutter_todo/authentication/authentication.dart';
import 'package:flutter_todo/login/login.dart';
import 'package:flutter_todo/shared/http_provider.dart';
import 'package:flutter_todo/shared/storage_provider.dart';
import 'package:flutter_todo/add_todo/add_todo_screen.dart';
import 'package:flutter_todo/edit_todo/edit_todo.dart';
import 'package:flutter_todo/todos/todos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_todo/bloc/bloc.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  AuthenticationBloc _authBloc;
  LoginBloc _loginBloc;
  TodosBloc _bloc;
  AddTodoBloc _addTodoBloc;
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
    _addTodoBloc = AddTodoBloc(_bloc);
    _editTodoBloc = EditTodoBloc(_bloc);
    _loginBloc = LoginBloc(authenticationBloc: _authBloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<AuthenticationBloc>(bloc: _authBloc),
        BlocProvider<LoginBloc>(bloc: _loginBloc),
        BlocProvider<TodosBloc>(bloc: _bloc),
        BlocProvider<AddTodoBloc>(bloc: _addTodoBloc),
        BlocProvider<EditTodoBloc>(bloc: _editTodoBloc),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TodoApp',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) =>
              BlocBuilder<AuthenticationEvent, AuthenticationState>(
                bloc: _authBloc,
                builder: (BuildContext context, AuthenticationState state) {
                  print('where');
                  if (state is AuthenticationUninitialized) {
                    return Center(
                      child: Text('Splash'),
                    );
                  }
                  if (state is AuthenticationAuthenticated) {
                    return TodosScreen();
                  }
                  if (state is AuthenticationUnauthenticated) {
                    return LoginScreen();
                  }
                  if (state is AuthenticationLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
          '/todos': (BuildContext context) => TodosScreen(),
          '/add-todo': (BuildContext context) => AddTodoScreen(),
          '/edit-todo': (BuildContext context) => EditTodoScreen(),
        },
      ),
    );
  }

  @override
  void dispose() {
    _authBloc.dispose();
    _loginBloc.dispose();
    _bloc.dispose();
    _addTodoBloc.dispose();
    _editTodoBloc.dispose();
    super.dispose();
  }
}
