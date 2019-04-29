import 'package:flutter_todo/todo.dart';
import 'package:test/test.dart';
import 'package:flutter_todo/todos_bloc.dart';

main() {
  TodosBloc bloc;
  setUp(() {
    bloc = TodosBloc();
  });

  test('should be intialized', () {
    expect(bloc.runtimeType == TodosBloc, isTrue);
  });

  test('should get an empty list of todos', () {
    expectLater(bloc.todos$, emitsInOrder([[]]));
  });

  test('should get list with the newly added todo', () {
    bloc.addTodo(Todo('Test', 'test desc', false));
    expectLater(
        bloc.todos$,
        emitsInOrder([
          [],
          [Todo('Test', 'test desc', false)]
        ]));
  });
}
