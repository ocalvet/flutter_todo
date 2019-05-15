import 'package:flutter/material.dart';
import 'package:flutter_todo/authentication/authentication.dart';
import 'package:flutter_todo/login/login.dart';
import 'package:flutter_todo/shared/http_provider.dart';
import 'package:flutter_todo/shared/storage_provider.dart';
import 'package:flutter_todo/add_todo/add_todo_screen.dart';
import 'package:flutter_todo/edit_todo/edit_todo.dart';
import 'package:flutter_todo/todos/todos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  TodosBloc _bloc;
  AuthenticationBloc _authBloc;
  EditTodoBloc _editTodoBloc;
  LoginBloc _loginBloc;
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
    _loginBloc = LoginBloc(authenticationBloc: _authBloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<TodosBloc>(bloc: _bloc),
        BlocProvider<AuthenticationBloc>(bloc: _authBloc),
        BlocProvider<EditTodoBloc>(bloc: _editTodoBloc),
        BlocProvider<LoginBloc>(bloc: _loginBloc),
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
    _bloc.dispose();
    super.dispose();
  }
}
