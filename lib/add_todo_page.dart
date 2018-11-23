import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  final Function _addTodo;
  AddTodoPage(this._addTodo);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget._addTodo(titleCtrl.text, descCtrl.text);
          Navigator.pop(context);
        },
        tooltip: 'Save Todo',
        child: Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
