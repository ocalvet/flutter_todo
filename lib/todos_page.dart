import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo/redux/todos_state.dart';
import 'package:flutter_todo/redux/todos_actions.dart';
import 'package:flutter_todo/todo.dart';
import 'package:flutter_todo/todos_bloc.dart';

class TodosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: <Widget>[
          StreamBuilder(
            stream: todosBloc.todos$,
            builder: (context, snapshot) {
              return IconButton(
                  icon: Icon(Icons.filter_list), 
                  onPressed: () {});
            })
        ],
      ),
      body: StreamBuilder(
        stream: todosBloc.todos$,
        builder: (context, AsyncSnapshot<List<Todo>> snapshot) => snapshot.hasData ? ListView(
              children: snapshot.data
                  .map((todo) => ListTile(
                        leading: Checkbox(
                            value: todo.completed,
                            onChanged: todosBloc.markTodo(todo)),
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
            ) : Container(),
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

class TodosPageViewModel {
  final List<Todo> todos;
  final Function markComplete;
  TodosPageViewModel({this.todos, this.markComplete});
}
