import 'package:flutter/material.dart';
import 'package:todo_list/widgets/custom_button.dart';

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
      padding: const EdgeInsets.all(0),
      itemCount: _taskList.length,
      itemBuilder: (context, index) {
        return _taskList[index].isFinish
            ? _taskComplete(_taskList[index].task)
            : _taskUncomplete(_taskList[index]);
      },
    );
  }

  Widget _taskUncomplete(Task data) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Подтвержденная задача", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16 )
                      ),
                      SizedBox(
                        height: 24,
                        ),
                        Text(data.task),
                        SizedBox(
                          height: 24,
                        ),
                        Text("Время"),
                        SizedBox(
                          height: 24,
                          ),
                          CustomButton(
                            buttonText: "Выполнено",
                            onPressed: () {
                              // todo: implement database request to complete
                            },
                            color: Theme.of(context).accentColor,
                            textColor: Colors.white,
                            ),
                  ]
                ),
              ),
            );
          }
          );
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Удалить задачу", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16 )
                      ),
                      SizedBox(
                        height: 24,
                        ),
                        Text(data.task),
                        SizedBox(
                          height: 24,
                        ),
                        Text("дата"),
                        SizedBox(
                          height: 24,
                          ),
                          CustomButton(
                            buttonText: "Удалено",
                            onPressed: () {
                              // todo: implement database request to complete
                            },
                            color: Theme.of(context).accentColor,
                            textColor: Colors.white,
                            ),
                  ]
                ),
              ),
            );
          }
          );
      },
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
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
            Text(data.task),
          ],
        ),
      ),
    );
  }

  Widget _taskComplete(String task) {
    return Container(
      foregroundDecoration: BoxDecoration(
        color: Color(0x60FDFDFD),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
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
