import 'package:flutter_todo/redux/todos_actions.dart';
import 'package:flutter_todo/redux/todos_state.dart';
import 'package:flutter_todo/todo.dart';

TodosAppState todosReducer(TodosAppState state, action) {
  if (action is AddTodoAction) {
    return TodosAppState(
      allTodos: List.from(state.allTodos)..add(
        Todo(
          action.title, 
          action.description,
          false,
        )
      ), 
      showCompleted: state.showCompleted,
    );
  } else if (action is MarkTodoCompletedAction) {
    Todo oldTodo = state.allTodos.firstWhere((t) => t.title == action.todo.title);
    int todoIdx = state.allTodos.indexOf(oldTodo);
    state.allTodos[todoIdx] = Todo(oldTodo.title, oldTodo.description, !oldTodo.completed);
    return TodosAppState(
      allTodos: List.from(state.allTodos),
      showCompleted: state.showCompleted,
    );
  } else if (action is FilterTodosAction) {
    return TodosAppState(
      allTodos: state.allTodos,
      showCompleted: !state.showCompleted,
    );
  }
  return state;
}
