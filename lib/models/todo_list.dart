import 'package:equatable/equatable.dart';
import 'package:flutter_todo/models/models.dart';

class TodoList extends Equatable {
  List<Todo> todos;
  TodoList({this.todos}) : super([todos]);
  TodoList.fromJson(Map<String, dynamic> json) {
    if (json['todos'] != null) {
      todos = List<Todo>();
      json['todos'].forEach((v) {
        todos.add(Todo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.todos != null) {
      data['todos'] = this.todos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
