import 'package:flutter/material.dart';
import 'package:flutter_todo/add_todo_page.dart';
import 'package:flutter_todo/todos_page.dart';
import 'package:flutter_todo/todo.dart';

class TodoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoApp();
  }
}

class _TodoApp extends State<TodoApp> {
  List<Todo> _todos = [];
  bool showCompleted = true;
  @override
  void initState() {
    super.initState();
  }

  addTodo(String title, String desc) {
    this.setState(() {
      _todos = List.from(_todos)..add(Todo(title, desc, false));
    });
  }

  filterTodos() {
    setState(() {
      showCompleted = !showCompleted;
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

  getTodos() {
    return showCompleted ? _todos : _todos.where((todo) => !todo.completed).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todoapp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: TodosPage(getTodos(), completeTodo, filterTodos),
      routes: <String, WidgetBuilder>{
        //5
        '/home': (BuildContext context) => TodosPage(getTodos(), completeTodo, filterTodos), //6
        '/add-todo': (BuildContext context) => AddTodoPage(addTodo) //7
      },
    );
  }
}
