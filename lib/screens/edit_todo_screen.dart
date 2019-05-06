import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/todo.dart';
import 'package:flutter_todo/todos_bloc.dart';

class EditTodoScreen extends StatefulWidget {
  @override
  _EditTodoScreenState createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  @override
  void initState() {
    // todosBloc.editingTodo$.take(1).listen((editingTodo) {
    //   setState(() {
    //     titleCtrl.text = editingTodo.title;
    //     descCtrl.text = editingTodo.description;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TodosBloc _todosBloc = BlocProvider.of<TodosBloc>(context);
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
      // floatingActionButton: StreamBuilder(
      //   stream: todosBloc.editingTodo$,
      //   builder: (BuildContext context, AsyncSnapshot<Todo> snapshot) {
      //     if (!snapshot.hasData) return CircularProgressIndicator();
      //     Todo editingTodo = snapshot.data;
      //     return FloatingActionButton(
      //       onPressed: () {
      //         todosBloc.updateEditingTodo(editingTodo.copyWith(
      //           title: titleCtrl.text,
      //           description: descCtrl.text,
      //           completed: editingTodo.completed,
      //         ));
      //         Navigator.pop(context);
      //       },
      //       tooltip: 'Update Todo',
      //       child: Icon(Icons.update),
      //     );
      //   },
      // ),
    );
  }
}
