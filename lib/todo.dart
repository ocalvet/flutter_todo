class Todo {
  final String title;
  final String description;
  final bool completed;
  Todo(this.title, this.description, this.completed);
  
  factory Todo.create() {
    return Todo('', '', false);
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