import 'package:flutter_todo/todo.dart';
import 'package:rxdart/rxdart.dart';

class TodosBloc {
  final BehaviorSubject<bool> _showCompleted = BehaviorSubject(seedValue: true);
  final BehaviorSubject<List<Todo>> _todosSubject = BehaviorSubject<List<Todo>>(seedValue: []);
  Observable<List<Todo>> get todos$ => Observable.combineLatest2(
    _todosSubject.stream,
    _showCompleted.stream,
    (List<Todo> todos, bool showCompleted) {
      print('getting... todos ${todos.length} - $showCompleted');
      List<Todo> alltodos = showCompleted ? todos : todos.where((todo) => !todo.completed).toList();
      return alltodos;
    });
  Observable<bool> get showCompleted$ => _showCompleted.stream;
  
  addTodo(title, description) async {
    print('adding todo $title');
    var todos = await this._todosSubject.first;
    List<Todo> newListTodos = List.from(todos)..add(Todo(title, description, false));
    _todosSubject.sink.add(newListTodos);
  }

  filterTodos() async {
    var showCompleted = await this._showCompleted.first;
    _showCompleted.sink.add(!showCompleted);
  }

  markTodo(Todo todo) async {
    var todos = await this._todosSubject.first;
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
