import 'dart:async';

import 'package:flutter_todo/todo.dart';
import 'package:rxdart/rxdart.dart';

class TodosBloc {
  TodosBloc() {
    this._addTodo$.listen((todo) => this._addTodo);
  }
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
    todos[oldTodoIdx] =
        Todo(oldTodo.title, oldTodo.description, !oldTodo.completed);
    List<Todo> newListTodos = List.from(todos);
    _todosSubject.sink.add(newListTodos);
  }

  dispose() {
    _todosSubject.close();
    _showCompleted.close();
    _editingTodo.close();
    _addTodo$.close();
  }
}

TodosBloc todosBloc = TodosBloc();
