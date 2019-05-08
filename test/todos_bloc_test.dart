import 'package:flutter_todo/todos/todos_bloc.dart';
import 'package:test/test.dart';

main() {
  TodosBloc bloc;
  setUp(() {
    bloc = TodosBloc();
  });

  test('should be intialized', () {
    expect(bloc.runtimeType == TodosBloc, isTrue);
  });

//   test('should get an empty list of todos', () {
//     expectLater(bloc.todos$, emitsInOrder([[]]));
//   });

//   test('should get list with the newly added todo', () {
//     bloc.addTodo(
//         Todo(title: 'Test', description: 'test desc', completed: false));
//     expectLater(
//         bloc.todos$,
//         emitsInOrder([
//           [],
//           [Todo(title: 'Test', description: 'test desc', completed: false)]
//         ]));
//   });
}
