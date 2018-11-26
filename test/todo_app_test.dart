import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo/todo_app.dart';

void main() {
  testWidgets('my first widget test', (WidgetTester tester) async {
    var app = TodoApp();
    await tester.pumpWidget(TodoApp());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}