import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/edit_todo/edit_todo.dart';
import 'package:flutter_todo/models/models.dart';
import 'package:flutter_todo/todos/todos.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;

  const TodoCard({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodosBloc _todosBloc = BlocProvider.of<TodosBloc>(context);
    final EditTodoBloc _editTodoBloc = BlocProvider.of<EditTodoBloc>(context);
    return ListTile(
      leading: Checkbox(
          value: todo.completed,
          onChanged: (val) => _todosBloc.dispatch(
                UpdateTodo(
                  todo.copyWith(completed: !todo.completed),
                ),
              )),
      title: Text(todo.title,
          style: todo.completed
              ? TextStyle(decoration: TextDecoration.lineThrough)
              : null),
      subtitle: Text(todo.description,
          style: todo.completed
              ? TextStyle(decoration: TextDecoration.lineThrough)
              : null),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        color: Colors.teal,
        onPressed: () {
          _editTodoBloc.dispatch(EditTodo(todo: todo));
          Navigator.pushNamed(context, '/edit-todo');
        },
      ),
    );
  }
}
