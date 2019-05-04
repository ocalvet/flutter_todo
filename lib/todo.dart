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

class Todo {
  final String id;
  final String title;
  final String description;
  final bool completed;
  Todo({this.id, this.title, this.description, this.completed});

  factory Todo.create({String title, String description, bool completed}) {
    Todo newTodo = Todo(
      id: uuid.v4(),
      title: title ?? 'Empty title',
      description: description ?? 'Empty description',
      completed: false,
    );
    return newTodo;
  }

  Todo copyWith({String title, String description, bool completed}) {
    Todo newTodo = Todo(
      id: this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
    return newTodo;
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
}
