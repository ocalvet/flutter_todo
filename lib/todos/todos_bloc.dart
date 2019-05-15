import 'dart:async';

import 'package:flutter_todo/todos/todos.dart';
import 'package:bloc/bloc.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodoRepository todosRepository;
  List<Todo> allTodos = [];
  bool _showCompleted = true;
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
      allTodos = todos.todos;
      yield TodosLoaded(allTodos);
    } catch (e) {
      print(e);
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
        yield TodosLoaded(newTodos);
      }
    } catch (e) {
      print(e);
      yield TodosNotLoaded();
    }
  }

  Stream<TodosState> _mapAddTodoToState(Todo todo) async* {
    try {
      if (currentState is TodosLoaded) {
        final List<Todo> todos = (currentState as TodosLoaded).todos;
        List<Todo> newTodos = List<Todo>.from(todos);
        newTodos.add(todo);
        yield TodosLoaded(newTodos);
      }
    } catch (e) {
      print(e);
      yield TodosNotLoaded();
    }
  }

  Stream<TodosState> _mapToggleCompletedToState() async* {
    try {
      if (currentState is TodosLoaded) {
        _showCompleted = !_showCompleted;
        final List<Todo> todos = allTodos.where((todo) {
          return _showCompleted ? true : !todo.completed;
        }).toList();
        yield TodosLoaded(todos);
      }
    } catch (e) {
      print(e);
      yield TodosNotLoaded();
    }
  }
}
