import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/add_todo/bloc/bloc.dart';
import 'package:flutter_todo/add_todo/components/add_todo_form.dart';

class AddTodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AddTodoBloc _addTodoBloc = BlocProvider.of<AddTodoBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: AddTodoForm(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodoBloc.dispatch(AddTodoSave());
          Navigator.pop(context);
        },
        tooltip: 'Save Todo',
        child: Icon(Icons.save),
      ),
    );
  }
}
