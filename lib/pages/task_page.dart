import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/database.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/widgets/custom_button.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}



class _TaskPageState extends State<TaskPage> {
  Database provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<Database>(context);

    return StreamProvider.value(
      value: provider.getTodoByType(TodoType.TYPE_TASK.index),
      child: Consumer<List<TodoData>> (
        builder: (context, _dataList, child) {
return _dataList == null ? 
Center(
  child: CircularProgressIndicator()) : 
  ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: _dataList.length,
        itemBuilder: (context, index) {
          return _dataList[index].isFinish
              ? _taskComplete(_dataList[index])
              : _taskUncomplete(_dataList[index]);
        },
      );
        },
      ),
    );
  }

  Widget _taskUncomplete(TodoData data) {
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
                        Text(new DateFormat("dd-MM-yyyy").format(data.date)),
                        SizedBox(
                          height: 24,
                          ),
                          CustomButton(
                            buttonText: "Выполнено",
                            onPressed: () {
                              provider
                              .completeTodoEntries(data.id)
                              .whenComplete(() => Navigator.of(context).pop());
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
                        Text(new DateFormat("dd-MM-yyyy").format(data.date)),
                        SizedBox(
                          height: 24,
                          ),
                          CustomButton(
                            buttonText: "Удалено",
                            onPressed: () {
                              provider
                              .deleteTodoEntries(data.id)
                              .whenComplete(() => Navigator.of(context).pop());
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

  Widget _taskComplete(TodoData data) {
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
            Text(data.task),
          ],
        ),
      ),
    );
  }
}
