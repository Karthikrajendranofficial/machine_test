class Todo {
  String title;

  Todo({required this.title});

  Map<String, dynamic> toJson() {
    return {
      'todo': title,
    };
  }

  // Create a TodoModel from a JSON map
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['todo'],
    );
  }
}
