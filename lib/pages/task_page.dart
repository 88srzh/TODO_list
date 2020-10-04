import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class Task {
  final String task;
  final bool isFinish;
  const Task(this.task, this.isFinish);
}

final List<Task> _taskList = [
  new Task('Позвонить Тому насчет сервера', false),
  new Task('Купить продуктов', false),
  new Task('Погулять с собакой', false),
  new Task('Накормить кота', false),
  new Task('Позавтракать', true),
  new Task('Сходить на тренировку', true),
];

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _taskList[index].isFinish
            ? _taskComplete(_taskList[index].task)
            : _taskUncomplete(_taskList[index].task);
      },
    );
  }

  Widget _taskUncomplete(String task) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 24.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.radio_button_unchecked,
            // ! Было color: Theme.of(context).accentColor,
            color: Colors.redAccent,
            size: 20,
          ),
          SizedBox(
            width: 28,
          ),
          Text(task),
        ],
      ),
    );
  }

  Widget _taskComplete(String task) {
    return Container(
      foregroundDecoration: BoxDecoration(
        color: Color(0x60FDFDFD),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 24.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.radio_button_checked,
              // ! Было color: Theme.of(context).accentColor,
              color: Colors.redAccent,
              size: 20,
            ),
            SizedBox(
              width: 28,
            ),
            Text(task),
          ],
        ),
      ),
    );
  }
}
