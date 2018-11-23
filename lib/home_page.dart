import 'package:flutter/material.dart';
import 'package:flutter_todo/add_todo_page.dart';
import 'package:flutter_todo/todo.dart';

class HomePage extends StatelessWidget {
  final List<Todo> _todos;
  final Function _completeTodo;
  HomePage(this._todos, this._completeTodo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: _todos.map((todo) => ListTile(
          leading: Checkbox(
            value: todo.completed, 
            onChanged: _completeTodo(todo)),
          title: Text(todo.title),
          subtitle: Text(todo.description),
        )).toList(),
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
