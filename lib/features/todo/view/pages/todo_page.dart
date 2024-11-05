import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:machine_test_karthik/features/todo/controller/todo_controller.dart';

class TodoPage extends HookConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final todoState = ref.watch(todoControllerProvider);
    final todoTitleController = TextEditingController();

    void addTodo() {
      todoTitleController.text = '';

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add Todo'),
            content: TextField(
              controller: todoTitleController,
              decoration: const InputDecoration(hintText: 'Enter todo title'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  ref
                      .read(todoControllerProvider.notifier)
                      .addTodo(todoTitleController.text);

                  Navigator.of(context).pop();
                },
                child: const Text('Add'),
              ),
            ],
          );
        },
      );
    }

    void updateTodo(int index) {
      todoTitleController.text = todoState[index].title;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update Todo'),
            content: TextField(
              controller: todoTitleController,
              decoration: const InputDecoration(hintText: 'Update todo title'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  ref
                      .read(todoControllerProvider.notifier)
                      .updateTodo(index, todoTitleController.text);
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Update'),
              ),
            ],
          );
        },
      );
    }

    void deleteTodo(int index) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Delete Todo'),
            content: const Text('Are you sure you want to delete this todo?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  ref.read(todoControllerProvider.notifier).deleteTodo(index);
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Delete'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: todoState.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              todoState[index].title,
              style: const TextStyle(color: Colors.white),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  onPressed: () => updateTodo(index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteTodo(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
