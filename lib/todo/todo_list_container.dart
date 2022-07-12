import 'package:flutter/material.dart';
import 'todo_header.dart';
import 'todo_list.dart';

class TodoListContainer extends StatefulWidget {
  const TodoListContainer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoListContainerState();

}

class _TodoListContainerState extends State<TodoListContainer> {

  var tasks = ['hello', 'quyen', 'phong', 'chung'];

  void _handleTasksChanged(List<String> newTasks) {
    setState(() {
      tasks = newTasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          const TodoHeader(),
          Expanded(
              child: TodoList(tasks: tasks, onChange: _handleTasksChanged,)
          ),
        ],
      )
    );
  }
}