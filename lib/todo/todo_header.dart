import 'package:flutter/material.dart';
class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var txtTodoController = TextEditingController();
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: txtTodoController,
            decoration: const InputDecoration(labelText: 'Add todo', hintText: 'Add todo'),
          ),
        ),
        const SizedBox(
          width: 300,/// ????
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add'),
        ),
      ],
    );
  }
}
