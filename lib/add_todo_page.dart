import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo/redux/todos_state.dart';
import 'package:flutter_todo/redux/todos_actions.dart';

class AddTodoPage extends StatefulWidget {
  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Enter title'
              ),
            ),
            TextField(
              controller: descCtrl,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter description'
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: StoreConnector<TodosAppState, Function>(
        converter: (store) => (title, desc) => store.dispatch(AddTodoAction(title: title, description: desc)),
        builder: (context, _addTodo) => FloatingActionButton(
            onPressed: () {
              _addTodo(titleCtrl.text, descCtrl.text);
              Navigator.pop(context);
            },
            tooltip: 'Save Todo',
            child: Icon(Icons.save),
          ),
        ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
