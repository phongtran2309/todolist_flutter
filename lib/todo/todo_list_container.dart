import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:todolist_flutter/model/task.dart';
import 'todo_header.dart';
import 'todo_list.dart';

class TodoListContainer extends StatefulWidget {
  const TodoListContainer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoListContainerState();
}
// default list task
List<Task> _tasksDefault() {
  late List<Task> tasks = [];
  for (var i = 0; i < 10; i++) {
    final wordPair = WordPair.random();
    tasks.add(Task(wordPair.asPascalCase, false));
  }
  return tasks;
}

class _TodoListContainerState extends State<TodoListContainer> {
  late List<Task> tasks = _tasksDefault();
  final List<String> buttons = ["Total", "Done", "Not done"];
  late String type = buttons[0];
//render list task
  void _handleTasksChanged(List<Task> newTasks) {
    setState(() {
      tasks = newTasks;
    });
  }
//change type onPress
  void onChangeType(String newType) {
    setState(() {
      type = newType;
    });
  }
// btn filter
  Widget groupButton() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: buttonsMethod(),
      ),
    );
  }
// add style btn
  List<Widget> buttonsMethod() {
    List<Container> buttonList = [];
    int totalCount = tasks.length;
    int doneCount = 0;
    int notDoneCount = 0;
    for (var item in tasks) {
      if (item.status) {
        doneCount++;
      } else {
        notDoneCount++;
      }
    }
    for (var button in buttons) {
      Color background = Colors.grey;
      Color textColor = Colors.black;
      // change style btn when am in
      if (button == type) {
        background = Colors.blue;
        textColor = Colors.white;
      }
      buttonList.add(
        //create btn
        Container(
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: background,
              onPrimary: textColor,
            ),
            onPressed: () {
              onChangeType(button);
            },
            child: () {
              if (button == 'Done'){
                return Text('$button: $doneCount');
              } else if (button == 'Not done'){
                return Text('$button: $notDoneCount');
              }
              else {
                return Text('$button: $totalCount' );
              }
            }(),
    ),
    ),
    );
    }
    return buttonList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            groupButton(),
            TodoHeader(tasks: tasks, onChange: _handleTasksChanged),
            Expanded(
                child: TodoList(
                    tasks: tasks, onChange: _handleTasksChanged, type: type)),
          ],
        ));
  }
}
