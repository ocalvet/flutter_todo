import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo/redux/todos_state.dart';
import 'package:flutter_todo/redux/todos_actions.dart';
import 'package:flutter_todo/todo.dart';

class TodosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: <Widget>[
          StoreConnector<TodosAppState, Function>(
              converter: (store) => () => store.dispatch(FilterTodosAction),
              builder: (context, _filterTodos) {
                return IconButton(
                    icon: Icon(Icons.filter_list), onPressed: _filterTodos);
              })
        ],
      ),
      body: StoreConnector<TodosAppState, List<Todo>>(
        converter: (store) => store.state.todos,
        builder: (context, _todos) => ListView(
              children: _todos
                  .map((todo) => ListTile(
                        leading: Checkbox(
                            value: todo.completed,
                            onChanged: (v) => print('Implement complete todo')),
                        title: Text(todo.title,
                            style: todo.completed
                                ? TextStyle(
                                    decoration: TextDecoration.lineThrough)
                                : null),
                        subtitle: Text(todo.description,
                            style: todo.completed
                                ? TextStyle(
                                    decoration: TextDecoration.lineThrough)
                                : null),
                      ))
                  .toList(),
            ),
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
