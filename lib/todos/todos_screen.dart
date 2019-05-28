import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/authentication/authentication.dart';
import 'package:flutter_todo/todos/components/todo_card.dart';
import 'package:flutter_todo/todos/todos.dart';

class TodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodosBloc _todosBloc = BlocProvider.of<TodosBloc>(context);
    final AuthenticationBloc _authBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _todosBloc.dispatch(ToggleCompleted()),
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _authBloc.dispatch(LoggedOut());
            },
          ),
        ],
      ),
      body: BlocBuilder<TodosEvent, TodosState>(
        bloc: _todosBloc,
        builder: (context, TodosState state) {
          if (state is TodosLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodosLoaded && state.filteredTodos.length > 0) {
            return ListView(
              children: state.filteredTodos
                  .map((todo) => TodoCard(todo: todo))
                  .toList(),
            );
          } else {
            return Center(
              child: Text('Click the plus to add a todo'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
      ),
    );
  }
}
