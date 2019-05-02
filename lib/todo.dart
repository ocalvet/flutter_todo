class TodoList {
  List<Todo> todos;
  TodoList({this.todos});
  TodoList.fromJson(Map<String, dynamic> json) {
    if (json['todos'] != null) {
      todos = new List<Todo>();
      json['todos'].forEach((v) {
        todos.add(new Todo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.todos != null) {
      data['todos'] = this.todos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Todo {
  final String title;
  final String description;
  final bool completed;
  Todo(this.title, this.description, this.completed);

  factory Todo.create() {
    return Todo('', '', false);
  }

  Todo.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        completed = json['completed'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
          title == other.title &&
          description == other.description &&
          completed == other.completed;
}
