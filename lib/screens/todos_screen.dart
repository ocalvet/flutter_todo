import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/todos_bloc.dart';
import 'package:flutter_todo/todos_events.dart';
import 'package:flutter_todo/todos_state.dart';

class TodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodosBloc _todosBloc = BlocProvider.of<TodosBloc>(context);
    _todosBloc.dispatch(LoadTodos());
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () => _todosBloc.dispatch(ToggleAll())),
        ],
      ),
      body: BlocBuilder<TodosEvent, TodosState>(
        bloc: _todosBloc,
        builder: (context, TodosState state) {
          if (state is TodosLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodosLoaded) {
            return ListView(
              children: state.todos
                  .map((todo) => ListTile(
                        leading: Checkbox(
                            value: todo.completed,
                            onChanged: (val) => _todosBloc.dispatch(
                                  CompleteTodo(todo),
                                ) // todosBloc.markTodo(todo),
                            ),
                        title: Text(todo.title,
                            style: todo.completed
                                ? TextStyle(
                                    decoration: TextDecoration.lineThrough)
                                : null),
                        subtitle: Text(todo.description,
                            style: todo.completed
                                ? TextStyle(
                                    decoration: TextDecoration.lineThrough)
                                : null),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          color: Colors.teal,
                          onPressed: () {
                            print('Editing todo ${todo.title}');
                            _todosBloc.dispatch(UpdateTodo(todo));
                            Navigator.pushNamed(context, '/edit-todo');
                          },
                        ),
                      ))
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
