import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_todo/todos/edit_todo/edit_todo_events.dart';
import 'package:flutter_todo/todos/edit_todo/edit_todo_state.dart';

class EditTodoBloc extends Bloc<EditTodoEvent, EditTodoState> {
  @override
  EditTodoState get initialState => InitialEditTodo();

  @override
  Stream<EditTodoState> mapEventToState(EditTodoEvent event) async* {
    yield InitialEditTodo();
  }
}
