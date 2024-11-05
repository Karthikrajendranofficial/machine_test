import 'package:machine_test_karthik/features/todo/model/todo_model.dart';

class TodoController {
  final List<Todo> todos = [];

  void addTodo(String title) {
    if (title.isNotEmpty) {
      todos.add(Todo(title: title));
    }
  }

  void updateTodo(int index, String newTitle) {
    if (newTitle.isNotEmpty) {
      todos[index].title = newTitle;
    }
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
  }
}
