import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
      return ListTile(
        title:  Text('Todo $index'),
        trailing: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.delete,
            color: Colors.red[400],
          ),
        ),
      );
    });
  }
}
