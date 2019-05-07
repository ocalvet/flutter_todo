import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/todos_bloc.dart';
import 'package:flutter_todo/todos_events.dart';

import '../todo.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TodosBloc _todosBloc = BlocProvider.of<TodosBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: titleCtrl,
              decoration:
                  InputDecoration(labelText: 'Title', hintText: 'Enter title'),
            ),
            TextField(
              controller: descCtrl,
              decoration: InputDecoration(
                  labelText: 'Description', hintText: 'Enter description'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _todosBloc.dispatch(AddTodo(Todo(
            titleCtrl.text,
            description: descCtrl.text,
          )));
          Navigator.pop(context);
        },
        tooltip: 'Save Todo',
        child: Icon(Icons.save),
      ),
    );
  }
}
