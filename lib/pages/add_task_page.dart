import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:todo_list/widgets/custom_button.dart';
import 'package:todo_list/widgets/custom_date_time_picker.dart';
import 'package:todo_list/widgets/custom_modal_action_button.dart';
import 'package:todo_list/widgets/custom_textfield.dart';


class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
    String _selectedDate = 'Выберите дату';
  String _selectedTime = 'Выберите время';

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
        _selectedDate = datepick.toString();
      });
  }

    // ! - Ждем когда пофиксят
  Future _pickTime() async {
    TimeOfDay timepick = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now());
    
    if (timepick != null) {
      setState(() {
        _selectedTime = timepick.toString();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
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
          CustomTextField(labelText: 'Введите задачу'),
          SizedBox(
            height: 12,
          ),
          CustomDateTimePicker(
            onPressed: _pickDate,
            icon: Icons.date_range, 
            value: _selectedDate,
            ),
          CustomDateTimePicker(
          onPressed: _pickTime,
          icon: Icons.access_time, 
          value: _selectedTime,
            ),
          SizedBox(
            height: 24,
          ),
          CustomModalActionButton(
            onClose: () {
                Navigator.of(context).pop();
              }, 
            onSave: () {}
            ),
        ],
      ),
    );
  }
}
