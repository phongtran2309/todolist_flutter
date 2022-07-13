import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key, required this.tasks, required this.onChange})
      : super(key: key);

  final List<String> tasks;
  final ValueChanged<List<String>> onChange;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          final task = widget.tasks[index];
          return ListTile(
            // leading: CheckboxListTile(
            //   title: const Text('check me'),
            //   secondary: const Icon(Icons.beach_access),
            //   controlAffinity:
            //   ListTileControlAffinity.leading, //optionally swap them bring in some state
            //   value: _checked,
            //   onChanged: (bool value) {
            //     setState(() {
            //       _checked = value;
            //     });
            //   },
            //   activeColor: Colors.black,
            //   checkColor: Colors.green,
            // ),
            title: Text(
              'Task $task',
              style: const TextStyle(fontSize: 20),
            ),
            trailing: GestureDetector(
              onTap: () {
                widget.tasks.removeAt(index);
                widget.onChange(widget.tasks);
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
