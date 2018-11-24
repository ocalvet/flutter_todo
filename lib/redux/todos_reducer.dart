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
    var todoIdx = state.todos.indexOf(action.todo);
    var oldTodo = state.todos[todoIdx];
    state.todos[todoIdx] = Todo(oldTodo.title, oldTodo.description, !oldTodo.completed);
    return TodosAppState(
      allTodos: List.from(state.todos),
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
