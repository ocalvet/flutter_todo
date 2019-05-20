import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_todo/models/models.dart';
import 'package:flutter_todo/todos/todos.dart';
import './bloc.dart';

class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  final TodosBloc todosBloc;
  Todo todo;
  AddTodoBloc(this.todosBloc);

  @override
  AddTodoState get initialState => InitialAddTodoState();

  @override
  Stream<AddTodoState> mapEventToState(
    AddTodoEvent event,
  ) async* {
    if (event is AddTodoUpdate) {
      todo = event.todo;
    } else if (event is AddTodoSave) {
      todosBloc.dispatch(AddTodo(todo));
    }
  }
}
