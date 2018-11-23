class Todo {
  final String title;
  final String description;
  final bool completed;
  Todo(this.title, this.description, this.completed);
  factory Todo.create() {
    return Todo('', '', false);
  }
}