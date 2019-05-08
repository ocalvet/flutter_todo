import 'dart:async';

import 'package:flutter_todo/todos/todo.dart';
import 'package:flutter_todo/todos/todo_repository.dart';
import 'package:flutter_todo/todos/todos_events.dart';
import 'package:flutter_todo/todos/todos_state.dart';
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
