import 'dart:async';

import 'package:flutter_todo/authentication.dart';
import 'package:flutter_todo/todo.dart';
import 'package:flutter_todo/todo_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:localstorage/localstorage.dart';

class TodosBloc {
  final storage = LocalStorage('todos');
  final todosService = TodoService();

  TodosBloc() {
    storage.ready.then((_) {
      var todos = storage.getItem('todos');
      if (todos != null) {
        var list = TodoList.fromJson(todos);
        this._todosSubject.sink.add(list.todos);
      }
      this._todosSubject.listen(
          (todos) => storage.setItem('todos', TodoList(todos: todos).toJson()));
    });
    this._addTodo$.listen(this._addTodo);
    this.todosService.getTodos().then(print);
  }

  final PublishSubject<Authentication> _auth = PublishSubject();
  Observable<Authentication> get auth$ => _auth.stream;
  Function(Authentication) get authenticate => _auth.sink.add;

  final BehaviorSubject<bool> _showCompleted = BehaviorSubject(seedValue: true);
  final BehaviorSubject<List<Todo>> _todosSubject =
      BehaviorSubject<List<Todo>>(seedValue: []);
  Observable<List<Todo>> get todos$ => Observable.combineLatest2(
      _todosSubject.stream,
      _showCompleted.stream,
      (List<Todo> todos, bool showCompleted) =>
          showCompleted ? todos : todos.where(_isNotCompleted).toList());

  Observable<bool> get showCompleted$ => _showCompleted.stream;

  bool _isNotCompleted(Todo todo) => !todo.completed;

  final BehaviorSubject<Todo> _editingTodo = BehaviorSubject<Todo>();
  Stream<Todo> get editingTodo$ => _editingTodo.stream;
  Future<Null> updateEditingTodo(Todo updatedEditingTodo) async {
    _editingTodo.sink.add(updatedEditingTodo);
  }

  final BehaviorSubject<Todo> _addTodo$ = BehaviorSubject<Todo>();
  Function(Todo) get addTodo => _addTodo$.sink.add;

  _addTodo(Todo todo) async {
    print('adding todo ${todo.title}');
    var todos = await this._todosSubject.first;
    List<Todo> newListTodos = List.from(todos)..add(todo);
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
    todos[oldTodoIdx] = Todo(
        title: oldTodo.title,
        description: oldTodo.description,
        completed: !oldTodo.completed);
    List<Todo> newListTodos = List.from(todos);
    _todosSubject.sink.add(newListTodos);
  }

  dispose() {
    _todosSubject.close();
    _showCompleted.close();
    _editingTodo.close();
    _addTodo$.close();
    _auth.close();
  }
}

TodosBloc todosBloc = TodosBloc();
