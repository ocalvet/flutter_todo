import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/edit_todo/edit_todo.dart';
import 'package:flutter_todo/todos/todos.dart';

class EditTodoScreen extends StatefulWidget {
  @override
  _EditTodoScreenState createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  EditTodoBloc _editTodoBloc;

  @override
  void initState() {
    _editTodoBloc = BlocProvider.of<EditTodoBloc>(context);
    if (_editTodoBloc.currentState is EditingTodo) {
      EditingTodo state = (_editTodoBloc.currentState as EditingTodo);
      titleCtrl.text = state.todo.title;
      descCtrl.text = state.todo.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo'),
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
      floatingActionButton: BlocBuilder(
        bloc: _editTodoBloc,
        builder: (BuildContext context, EditTodoState state) {
          if (state is InitialEditTodo) {
            return CircularProgressIndicator();
          } else {
            EditingTodo currentState = (state as EditingTodo);
            Todo editingTodo = currentState.todo;
            return FloatingActionButton(
              onPressed: () {
                _editTodoBloc.dispatch(UpdateEditingTodo(
                    todo: editingTodo.copyWith(
                  title: titleCtrl.text,
                  description: descCtrl.text,
                )));
                Navigator.pop(context);
              },
              tooltip: 'Update Todo',
              child: Icon(Icons.update),
            );
          }
        },
      ),
    );
  }
}
