import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:machine_test_karthik/features/todo/controller/todo_controller.dart';
import 'package:machine_test_karthik/features/todo/model/todo_model.dart';

class TodoPage extends HookWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => TodoController());
    final todos = useState<List<Todo>>([]);

    void addTodo() {
      String newTodoTitle = '';

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add Todo'),
            content: TextField(
              onChanged: (value) {
                newTodoTitle = value;
              },
              decoration: const InputDecoration(hintText: 'Enter todo title'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  controller.addTodo(newTodoTitle);
                  todos.value = List.from(controller.todos); // Update state
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Add'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        },
      );
    }

    void updateTodo(int index) {
      String updatedTitle = todos.value[index].title;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update Todo'),
            content: TextField(
              onChanged: (value) {
                updatedTitle = value;
              },
              decoration: const InputDecoration(hintText: 'Update todo title'),
              controller: TextEditingController(text: todos.value[index].title),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  controller.updateTodo(index, updatedTitle);
                  todos.value = List.from(controller.todos); // Update state
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Update'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
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
                  controller.deleteTodo(index);
                  todos.value = List.from(controller.todos); // Update state
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Delete'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: todos.value.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              todos.value[index].title,
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
