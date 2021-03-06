import 'package:flutter/material.dart';
import 'package:todolist_flutter/model/task.dart';
// class add task
class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key,
    required this.tasks,
    required this.onChange
  }) : super(key: key);

  final List<Task> tasks;
  final ValueChanged<List<Task>> onChange;

  @override
  Widget build(BuildContext context) {
    var txtTodoController = TextEditingController();
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                tasks.add(Task(value, false));
                onChange(tasks);
              } else {
                // TODO: thong bao toast
                debugPrint('chua nhap gi');
              }
            },
            controller: txtTodoController,
            decoration: const InputDecoration(
                labelText: 'Add task', hintText: 'Add task'),
          ),
        ),
        const SizedBox(width: 20,),
        ElevatedButton.icon(
          onPressed: () {
            final taskValue = txtTodoController.text;
            if (taskValue.isNotEmpty) {
              tasks.add(Task(taskValue, false));
              onChange(tasks);
            } else {
              // TODO: thong bao toast
              debugPrint('chua nhap gi');
            }
          },
          icon: const Icon(Icons.add),
          label: const Text('Add'),
        ),
      ],
    );
  }
}

