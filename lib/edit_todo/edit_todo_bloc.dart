import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_todo/edit_todo/edit_todo.dart';

class EditTodoBloc extends Bloc<EditTodoEvent, EditTodoState> {
  @override
  EditTodoState get initialState => InitialEditTodo();

  @override
  Stream<EditTodoState> mapEventToState(EditTodoEvent event) async* {
    if (event is EditTodo) {
      yield EditingTodo(todo: event.todo);
    } else if (event is UpdateEditingTodo) {
      print('updating todo ---');
    } else {
      yield InitialEditTodo();
    }
  }
}
