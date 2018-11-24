import 'package:flutter_todo/todo.dart';
import 'package:rxdart/rxdart.dart';

class TodosBloc {
  final BehaviorSubject<bool> _showCompleted = BehaviorSubject(seedValue: true);
  final BehaviorSubject<List<Todo>> _todosSubject = BehaviorSubject<List<Todo>>(seedValue: []);
  Observable<List<Todo>> get todos$ => Observable.combineLatest2(
    _todosSubject.stream,
    _showCompleted.stream,
    (List<Todo> todos, bool showCompleted) {
      return showCompleted ? todos : todos.where((todo) => !todo.completed);
    });
  Observable<bool> get showCompleted$ => _showCompleted.stream;
  
  addTodo(title, description) async {
    var todos = await this._todosSubject.last;
    List<Todo> newListTodos = List.from(todos)..add(Todo(title, description, false));
    _todosSubject.sink.add(newListTodos);
  }

  markTodo(Todo todo) async {
    var todos = await this._todosSubject.last;
    var oldTodo = todos.firstWhere((t) => t.title == todo.title);
    var oldTodoIdx = todos.indexOf(oldTodo);
    todos[oldTodoIdx] = Todo(oldTodo.title, oldTodo.description, !oldTodo.completed);
    List<Todo> newListTodos = List.from(todos);
    _todosSubject.sink.add(newListTodos);
  }

  dispose() {
    _todosSubject.close();
    _showCompleted.close();
  }
}

TodosBloc todosBloc = TodosBloc();