import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/model/database.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/widgets/custom_button.dart';
import 'package:todo_list/widgets/custom_date_time_picker.dart';
import 'package:todo_list/widgets/custom_modal_action_button.dart';
import 'package:todo_list/widgets/custom_textfield.dart';


class AddTaskPage extends StatefulWidget {

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
    DateTime _selectedDate = DateTime.now();
    final _textTaskController = TextEditingController();

  Future _pickDate() async {
    DateTime datepick = await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
      theme: ThemeData(
      primarySwatch: Colors.red,
      primaryColor: Color.fromRGBO(255, 0, 0, 0.5),
      accentColor: Colors.redAccent,
      disabledColor: Colors.blue,
      accentTextTheme: TextTheme(
      bodyText2 : TextStyle(color: Colors.black),
         )));
      if (datepick != null) setState(() {
        _selectedDate = datepick;
      });
  }

  @override
  Widget build(BuildContext context) {
    _textTaskController.clear();
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
              child: Text(
            'Добавить новую задачу',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )),
          SizedBox(
            height: 24,
          ),
          CustomTextField(
            labelText: 'Введите задачу',
            controller: _textTaskController,
          ),
          SizedBox(
            height: 12,
          ),
          CustomDateTimePicker(
            onPressed: _pickDate,
            icon: Icons.date_range, 
            value: new DateFormat("dd-MM-yyyy").format(_selectedDate),
            ),
          SizedBox(
            height: 24,
          ),
          CustomModalActionButton(
            onClose: () {
                Navigator.of(context).pop();
              }, 
            onSave: () {
              if (_textTaskController.text == "") {
                print("Информация не найдена");
              } else {
                Database().insertTodoEntries(new TodoData(
                  date: _selectedDate,
                  time: DateTime.now(),
                  isFinish: false,
                  task: _textTaskController.text,
                  description: "",
                  todoType: TodoType.TYPE_TASK.index,
                  id: null,
                )).whenComplete(() => Navigator.of(context).pop());
              }
            }
            ),
        ],
      ),
    );
  }
}
