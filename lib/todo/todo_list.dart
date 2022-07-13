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
            // leading: GestureDetector(
            //   onTap: () {
            //     const MyStatefulWidget();
            //   },
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

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
