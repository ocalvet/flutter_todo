import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/add_todo/bloc/bloc.dart';
import 'package:flutter_todo/models/models.dart';

class AddTodoForm extends StatelessWidget {
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AddTodoBloc addTodoBloc = BlocProvider.of<AddTodoBloc>(context);
    var _updateTodo = (_) {
      addTodoBloc.dispatch(
        AddTodoUpdate(
          Todo(
            titleCtrl.text,
            description: descCtrl.text,
          ),
        ),
      );
    };
    return ListView(
      children: <Widget>[
        TextField(
          controller: titleCtrl,
          onChanged: _updateTodo,
          decoration: InputDecoration(
            labelText: 'Title',
            hintText: 'Enter title',
          ),
        ),
        TextField(
          controller: descCtrl,
          onChanged: _updateTodo,
          decoration: InputDecoration(
            labelText: 'Description',
            hintText: 'Enter description',
          ),
        ),
      ],
    );
  }
}
