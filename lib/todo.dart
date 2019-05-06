import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class TodoList {
  List<Todo> todos;
  TodoList({this.todos});
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

@immutable
class Todo extends Equatable {
  final bool completed;
  final String id;
  final String description;
  final String title;

  Todo(this.title, {this.completed = false, String description = '', String id})
      : this.description = description ?? '',
        this.id = id ?? Uuid().v4(),
        super([completed, id, description, title]);

  Todo copyWith({bool completed, String id, String description, String title}) {
    return Todo(
      title ?? this.title,
      completed: completed ?? this.completed,
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        completed = json['completed'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['completed'] = this.completed;
    return data;
  }

  @override
  bool operator ==(
    Object other,
  ) =>
      identical(
        this,
        other,
      ) ||
      other is Todo &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          completed == other.completed;

  @override
  String toString() {
    return 'Todo { completed: $completed, title: $title, description: $description, id: $id }';
  }
}
