import 'package:flutter/material.dart';
import 'package:flutter_todo/todo.dart';
import 'package:flutter_todo/todos_bloc.dart';

class TodosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.filter_list), onPressed: todosBloc.filterTodos),
        ],
      ),
      body: StreamBuilder(
        stream: todosBloc.todos$,
        builder: (context, AsyncSnapshot<List<Todo>> snapshot) => snapshot
                .hasData && snapshot.data.length > 0
            ? ListView(
                children: snapshot.data
                    .map((todo) => ListTile(
                          leading: Checkbox(
                            value: todo.completed,
                            onChanged: (val) => todosBloc.markTodo(todo),
                          ),
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
                                  trailing: IconButton(
                                    icon: Icon(Icons.edit),
                                    color: Colors.teal,
                                    onPressed: () {
                                      print('Editing todo');
                                    },
                                  ),
                        ))
                    .toList(),
              )
            : Center(child: Text('Click the plus to add a todo'),),
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
