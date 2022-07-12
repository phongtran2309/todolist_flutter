import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.tasks,
    required this.onChange
  }) : super(key: key);

  final List<String> tasks;
  final ValueChanged<List<String>> onChange;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title:  Text('Task $task', style: const TextStyle(fontSize: 20),),
            trailing: GestureDetector(
              onTap: () {
                tasks.removeAt(index);
                onChange(tasks);
              },
              child: Icon(
                Icons.delete,
                color: Colors.red[400],
              ),
            ),

          );
        });
  }
}
