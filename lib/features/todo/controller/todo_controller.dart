import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:machine_test_karthik/core/utils/snackbar_utils.dart';
import 'package:machine_test_karthik/features/todo/model/todo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_controller.g.dart';

@riverpod
class TodoController extends _$TodoController {
  final _storage = GetStorage();

  @override
  List<Todo> build() {
    final storedTodos = <Todo>[];

    for (final value in _storage.getValues()) {
      storedTodos.add(
        Todo.fromJson(jsonDecode(value.toString())),
      );
    }

    return storedTodos;
  }

  /// Refresh stored todos in storage
  void refreshStorage() {
    final newTodos = [...state];

    _storage.erase();

    for (var i = 0; i < newTodos.length; i++) {
      _storage.write(
        i.toString(),
        jsonEncode(newTodos[i].toJson()),
      );
    }
  }

  void addTodo(String title) {
    if (title.isNotEmpty) {
      final newTodos = [...state];

      newTodos.add(
        Todo(title: title),
      );

      state = newTodos;
      refreshStorage();
    } else {
      SnackbarUtils.showMessage('Title cannot be empty');
    }
  }

  void updateTodo(int index, String newTitle) {
    if (newTitle.isNotEmpty) {
      final newTodos = [...state];

      newTodos[index].title = newTitle;

      state = newTodos;
      refreshStorage();
    } else {
      SnackbarUtils.showMessage('Title cannot be empty');
    }
  }

  void deleteTodo(int index) {
    final newTodos = [...state];
    newTodos.removeAt(index);

    state = newTodos;
    refreshStorage();
  }
}
