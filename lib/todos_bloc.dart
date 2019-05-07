import 'dart:async';

import 'package:flutter_todo/todo.dart';
import 'package:flutter_todo/todo_service.dart';
import 'package:flutter_todo/todos_events.dart';
import 'package:flutter_todo/todos_state.dart';
import 'package:bloc/bloc.dart';
import 'package:localstorage/localstorage.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final LocalStorage storage;
  final TodoService todosService;
  TodosBloc({this.storage, this.todosService});

  @override
  TodosState get initialState => TodosLoading();

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    switch (event.runtimeType) {
      case LoadTodos:
        yield* _mapLoadTodosToState();
        break;
      case UpdateTodo:
        yield* _mapUpdateTodoToState(event.props[0]);
        break;
      case AddTodo:
        yield* _mapAddTodoToState(event.props[0]);
        break;
    }

    // } else if (event is DeleteTodo) {
    //   yield* _mapDeleteTodoToState(event);
    // } else if (event is ToggleAll) {
    //   yield* _mapToggleAllToState();
    // } else if (event is ClearCompleted) {
    //   yield* _mapClearCompletedToState();
    // }
  }

  Stream<TodosState> _mapLoadTodosToState() async* {
    try {
      final todos = await this.todosService.getTodos();
      yield TodosLoaded(
        todos.todos,
      );
    } catch (_) {
      yield TodosNotLoaded();
    }
  }

  Stream<TodosState> _mapUpdateTodoToState(Todo todo) async* {
    try {
      final List<Todo> todos = (await this.state.first).props[0];
      List<Todo> newTodos = todos.map((t) {
        if (t.id == todo.id) return todo.copyWith();
        return t.copyWith();
      }).toList();
      yield TodosLoaded(
        newTodos,
      );
    } catch (_) {
      yield TodosNotLoaded();
    }
  }

  Stream<TodosState> _mapAddTodoToState(Todo todo) async* {
    try {
      final List<Todo> todos = (await this.state.first).props[0];
      List<Todo> newTodos = List<Todo>.from(todos);
      newTodos.add(todo);
      yield TodosLoaded(
        newTodos,
      );
    } catch (_) {
      yield TodosNotLoaded();
    }
  }
}
/*
class TodosBloc {
  final storage = LocalStorage('todos');
  final todosService = TodoService();

  TodosBloc() {
    storage.ready.then(this._initializeTodos);
    this._addTodo$.listen(this._addTodo);
  }

  final PublishSubject<Authentication> _auth = PublishSubject();
  Observable<Authentication> get auth$ => _auth.stream;
  Function(Authentication) get authenticate => _auth.sink.add;

  final BehaviorSubject<bool> _showCompleted =
      BehaviorSubject<bool>.seeded(true);
  final BehaviorSubject<List<Todo>> _todosSubject =
      BehaviorSubject<List<Todo>>.seeded([]);
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

  _initializeTodos(_) {
    var storageTodos = storage.getItem('todos');
    this.todosService.getTodos().then((TodoList todoList) {
      if (storageTodos != null) {
        var storageTodoList = TodoList.fromJson(storageTodos);
        TodoList syncedtodos = TodoList(todos: todoList.todos);
        storageTodoList.todos.forEach((todo) {
          if (!todoList.todos.contains(todo)) {
            syncedtodos.todos.add(todo);
          }
        });
        this._todosSubject.sink.add(syncedtodos.todos);
      } else {
        this._todosSubject.sink.add(todoList.todos);
      }
      this._todosSubject.listen((todos) {
        storage.setItem('todos', TodoList(todos: todos).toJson());
      });
    }, onError: (_) {
      if (storageTodos != null) {
        var storageTodoList = TodoList.fromJson(storageTodos);
        this._todosSubject.sink.add(storageTodoList.todos);
      }
      this._todosSubject.listen((todos) {
        storage.setItem('todos', TodoList(todos: todos).toJson());
      });
    });
  }

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
*/
