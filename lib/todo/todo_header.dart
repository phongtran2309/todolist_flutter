import 'dart:ffi';

import 'package:flutter/material.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key,
    required this.tasks,
    required this.onChange
  }) : super(key: key);

  final List<String> tasks;
  final ValueChanged<List<String>> onChange;

  @override
  Widget build(BuildContext context) {
    var txtTodoController = TextEditingController();
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            // onFieldSubmitted:(value) {},
            controller: txtTodoController,
            decoration: const InputDecoration(labelText: 'Add task', hintText: 'Add task'),
          ),
        ),
        const SizedBox(width: 20,),
        ElevatedButton.icon(
          onPressed: () {
            final taskValue = txtTodoController.text;
            if (taskValue.isNotEmpty) {
              tasks.add(taskValue);
              onChange(tasks);
            } else {
              // TODO: thong bao toast
              debugPrint('ascbas');
            }

          },
          icon: const Icon(Icons.add),
          label: const Text('Add'),
        ),
      ],
    );
  }
}
