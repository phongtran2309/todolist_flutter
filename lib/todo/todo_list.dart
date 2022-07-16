import 'package:flutter/material.dart';
import 'package:todolist_flutter/model/task.dart';

class TodoList extends StatefulWidget {
  const TodoList(
      {Key? key,
      required this.tasks,
      required this.onChange,
      required this.type})
      : super(key: key);

  final List<Task> tasks;
  final String type;
  final ValueChanged<List<Task>> onChange;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    late List<int> itemsValid = [];
    if (widget.type == "Total") {
      for (var i = 0; i < widget.tasks.length; i++) {
        itemsValid.add(i);
      }
    }
    if (widget.type == "Done") {
      for (var i = 0; i < widget.tasks.length; i++) {
        if (widget.tasks[i].status) {
          itemsValid.add(i);
        }
      }
    }

    if (widget.type == "Not done") {
      for (var i = 0; i < widget.tasks.length; i++) {
        if (!widget.tasks[i].status) {
          itemsValid.add(i);
        }
      }
    }

    return ListView.builder(
        itemCount: itemsValid.length,
        itemBuilder: (context, index) {
          Task task = widget.tasks[itemsValid[index]];
          final labelColor = task.status ? Colors.red : Colors.black;
          final labelDecoration =
              task.status ? TextDecoration.lineThrough : TextDecoration.none;
          return CheckboxListTile(
            title: Text('Task ${task.name}',
                style:
                    TextStyle(color: labelColor, decoration: labelDecoration)),
            secondary: SizedBox(
              width: 100,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      debugPrint('up');
                      Task temp;
                      if (itemsValid[index] > 0) {
                        temp = widget.tasks[itemsValid[index]];
                        widget.tasks[itemsValid[index]] =
                            widget.tasks[itemsValid[index] - 1];
                        widget.tasks[itemsValid[index] - 1] = temp;
                        widget.onChange(widget.tasks);
                        widget.onChange(widget.tasks);
                      }
                    },
                    child: const Icon(
                      Icons.arrow_upward,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('down');
                      if (itemsValid[index] < widget.tasks.length - 1) {
                        Task temp;
                        temp = widget.tasks[itemsValid[index]];
                        widget.tasks[itemsValid[index]] =
                            widget.tasks[itemsValid[index] + 1];
                        widget.tasks[itemsValid[index] + 1] = temp;
                        widget.onChange(widget.tasks);
                      }
                    },
                    child: const Icon(
                      Icons.arrow_downward,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.tasks.removeAt(itemsValid[index]);
                      widget.onChange(widget.tasks);
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red[400],
                    ),
                  ),
                ],
              ),
            ),
            controlAffinity:
                // vi tri cua btn
                ListTileControlAffinity
                    .leading, //optionally swap them bring in some state
            value: task.status,
            onChanged: (bool? value) {
              widget.tasks[itemsValid[index]].status = value!;
              widget.onChange(widget.tasks);
            },

            activeColor: Colors.black,
            checkColor: Colors.green,
            selectedTileColor: Colors.greenAccent,
          );
        });
  }
}
