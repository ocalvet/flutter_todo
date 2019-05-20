import 'dart:async';

import 'package:flutter_todo/todos/todos.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_todo/models/models.dart';

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
        Todo updatedTodo = (event as UpdateTodo).todo;
        yield* _mapUpdateTodoToState(updatedTodo);
        break;
      case AddTodo:
        Todo addedTodo = (event as AddTodo).todo;
        yield* _mapAddTodoToState(addedTodo);
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
      yield TodosLoaded(allTodos, _showCompleted);
    } catch (e) {
      yield TodosLoadError('Error loading todos');
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
        allTodos = newTodos;
        yield TodosLoaded(newTodos, _showCompleted);
      }
    } catch (e) {
      print(e);
      yield TodosLoadError('Error updating todo');
    }
  }

  Stream<TodosState> _mapAddTodoToState(Todo todo) async* {
    try {
      if (currentState is TodosLoaded) {
        final List<Todo> todos = (currentState as TodosLoaded).todos;
        List<Todo> newTodos = List<Todo>.from(todos);
        newTodos.add(todo);
        allTodos = newTodos;
        yield TodosLoaded(newTodos, _showCompleted);
      }
    } catch (e) {
      print(e);
      yield TodosLoadError('Error adding todo');
    }
  }

  Stream<TodosState> _mapToggleCompletedToState() async* {
    print('toggling todo');
    try {
      if (currentState is TodosLoaded) {
        _showCompleted = !_showCompleted;
        yield TodosLoaded(allTodos, _showCompleted);
      }
    } catch (e) {
      print(e);
      yield TodosLoadError('Error toggling visibility');
    }
  }
}
