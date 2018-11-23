import 'package:flutter/material.dart';
import 'package:flutter_todo/todo.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> _todos = [];
  @override
  void initState() {
    super.initState();
  }

  addTodo() {
    this.setState(() {
      _todos = List.from(_todos)..add(Todo('test', 'testing', false));
    });
  }

  completeTodo(todo) {
    return (bool completed) {
      int index = _todos.indexOf(todo);
      setState(() {
        Todo oldTodo = _todos[index];
        _todos[index] = Todo(oldTodo.title, oldTodo.description, completed);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _todos.map((todo) => ListTile(
          leading: Checkbox(
            value: todo.completed, 
            onChanged: completeTodo(todo)),
          title: Text(todo.title),
          subtitle: Text(todo.description),
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
