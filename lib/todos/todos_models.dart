import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

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

@immutable
class Todo extends Equatable {
  final bool completed;
  final String id;
  final String description;
  final String title;
  final ImageModel image;

  Todo(this.title,
      {this.completed = false,
      String description = '',
      String id,
      ImageModel image})
      : this.description = description ?? '',
        this.id = id ?? Uuid().v4(),
        this.image = image ?? ImageModel(),
        super([completed, id, description, title]);

  Todo copyWith(
      {bool completed,
      String id,
      String description,
      String title,
      ImageModel image}) {
    return Todo(
      title ?? this.title,
      completed: completed ?? this.completed,
      id: id ?? this.id,
      description: description ?? this.description,
      image: image ?? ImageModel(),
    );
  }

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        completed = json['completed'],
        image = ImageModel.fromJson(json['imageInfo']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['completed'] = this.completed;
    data['imageInfo'] = this.image.toJson();
    return data;
  }

  @override
  String toString() {
    return 'Todo { completed: $completed, title: $title, description: $description, id: $id }';
  }
}

class ImageModel extends Equatable {
  String title;
  String description;
  String diskLocation;
  String networkUrl;

  ImageModel(
      {this.title, this.description, this.diskLocation, this.networkUrl});

  ImageModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    diskLocation = json['diskLocation'];
    networkUrl = json['networkUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['diskLocation'] = this.diskLocation;
    data['networkUrl'] = this.networkUrl;
    return data;
  }
}
