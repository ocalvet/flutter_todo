import 'dart:async';

import 'package:flutter_todo/todo.dart';
import 'package:flutter_todo/todo_repository.dart';
import 'package:flutter_todo/todos_events.dart';
import 'package:flutter_todo/todos_state.dart';
import 'package:bloc/bloc.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodoRepository todosRepository;
  TodosBloc({this.todosRepository});

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
      case ToggleCompleted:
        yield* _mapToggleCompletedToState();
        break;
    }
  }

  Stream<TodosState> _mapLoadTodosToState() async* {
    try {
      final todos = await this.todosRepository.getTodos();
      yield TodosLoaded(
        todos.todos,
      );
    } catch (_) {
      yield TodosNotLoaded();
    }
  }

  Stream<TodosState> _mapUpdateTodoToState(Todo todo) async* {
    try {
      if (currentState is TodosLoaded) {
        final List<Todo> todos = (currentState as TodosLoaded).todos;
        List<Todo> newTodos = todos.map((t) {
          if (t.id == todo.id) return todo.copyWith();
          return t.copyWith();
        }).toList();
        yield TodosLoaded(
          newTodos,
        );
      }
    } catch (_) {
      yield TodosNotLoaded();
    }
  }

  Stream<TodosState> _mapAddTodoToState(Todo todo) async* {
    try {
      if (currentState is TodosLoaded) {
        final List<Todo> todos = (currentState as TodosLoaded).todos;
        List<Todo> newTodos = List<Todo>.from(todos);
        newTodos.add(todo);
        yield TodosLoaded(
          newTodos,
        );
      }
    } catch (_) {
      yield TodosNotLoaded();
    }
  }

  Stream<TodosState> _mapToggleCompletedToState() async* {
    try {
      if (currentState is TodosLoaded) {
        final List<Todo> todos = (currentState as TodosLoaded).todos;
        final state = currentState;
        print(state.props);
        yield TodosLoaded(
          state.props[0],
        );
      }
    } catch (_) {
      yield TodosNotLoaded();
    }
  }
}
/*
  _initializeTodos(_) {
    var storageTodos = storage.getItem('todos');
    this.todosRepository.getTodos().then((TodoList todoList) {
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
*/
