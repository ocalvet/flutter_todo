import 'package:flutter/material.dart';
import 'package:flutter_todo/todo.dart';

class TodosPage extends StatelessWidget {
  final List<Todo> _todos;
  final Function _completeTodo;
  TodosPage(this._todos, this._completeTodo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView(
        children: _todos.map((todo) => ListTile(
          leading: Checkbox(
            value: todo.completed, 
            onChanged: _completeTodo(todo)),
          title: Text(todo.title, style: todo.completed ? TextStyle(decoration: TextDecoration.lineThrough) : null),
          subtitle: Text(todo.description, style: todo.completed ? TextStyle(decoration: TextDecoration.lineThrough) : null),
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
