import 'package:flutter/material.dart';
import 'package:flutter_todo/add_todo_page.dart';
import 'package:flutter_todo/todos_page.dart';
import 'package:flutter_todo/todo.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoApp();
  }
}

class _TodoApp extends State<TodoApp> {
  List<Todo> _todos = [];
  @override
  void initState() {
    super.initState();
  }

  addTodo(String title, String desc) {
    this.setState(() {
      _todos = List.from(_todos)..add(Todo(title, desc, false));
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
    return MaterialApp(
      title: 'Todoapp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: TodosPage(_todos, completeTodo),
      routes: <String, WidgetBuilder> { //5
        '/home': (BuildContext context) => TodosPage(_todos, completeTodo), //6
        '/add-todo' : (BuildContext context) => AddTodoPage(addTodo) //7
      },
    );
  }
}
