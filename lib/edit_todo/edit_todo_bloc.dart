import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_todo/edit_todo/edit_todo.dart';
import 'package:flutter_todo/todos/todos.dart';

class EditTodoBloc extends Bloc<EditTodoEvent, EditTodoState> {
  final TodosBloc todosBloc;

  EditTodoBloc(this.todosBloc);

  @override
  EditTodoState get initialState => InitialEditTodo();

  @override
  Stream<EditTodoState> mapEventToState(EditTodoEvent event) async* {
    if (event is EditTodo) {
      yield EditingTodo(todo: event.todo);
    } else if (event is UpdateEditingTodo) {
      todosBloc.dispatch(UpdateTodo(event.todo));
    } else {
      yield InitialEditTodo();
    }
  }
}
