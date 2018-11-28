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
  expectLater(bloc.todos$, emitsInOrder([]));
});

}