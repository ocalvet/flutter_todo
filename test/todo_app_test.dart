import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo/todo_app.dart';
import 'package:flutter_todo/todos/todos.dart';

void main() {
  testWidgets('Finds the MaterialApp widget', (WidgetTester tester) async {
    await tester.pumpWidget(TodoApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
  testWidgets('Finds the TodosPage widget', (WidgetTester tester) async {
    await tester.pumpWidget(TodoApp());
    expect(find.byType(TodosScreen), findsOneWidget);
  });
}
