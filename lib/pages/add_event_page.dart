import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/database.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/widgets/custom_date_time_picker.dart';
import 'package:todo_list/widgets/custom_modal_action_button.dart';
import 'package:todo_list/widgets/custom_textfield.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  DateTime _selectedDate = DateTime.now();
  

  final _textEventController = TextEditingController();
  final _textEventDescriptionController = TextEditingController();

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
              bodyText2: TextStyle(color: Colors.black),
            )));
    if (datepick != null)
      setState(() {
        _selectedDate = datepick;
      });
  }

  //  Future _pickTime() async {
  //   String formattedTime = DateFormat('kk:mm')
  //   .format(_selectedTime);
  // }

  @override
  Widget build(BuildContext context) {
    var providerEvent = Provider.of<Database>(context);
    _textEventController.clear();
    _textEventDescriptionController.clear();
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
              child: Text(
            'Добавить новое событие',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )),
          SizedBox(
            height: 24,
          ),
          CustomTextField(
            labelText: 'Добавить новое событие',
            controller: _textEventController,),
          SizedBox(
            height: 12,
          ),
          CustomTextField(
            labelText: 'Введите описание',
          controller: _textEventDescriptionController,),
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
          CustomModalActionButton(onClose: () {
            Navigator.of(context).pop();
          }, onSave: () {
            if (_textEventController.text == "") {
              print("Информация не найдена");
            } else {
              providerEvent
                  .insertTodoEntries(new TodoData(
                    date: _selectedDate,
                    time: DateTime.now(),
                    
                    isFinish: false,
                    task: _textEventController.text,
                    description: _textEventDescriptionController.text,
                    todoType: TodoType.TYPE_EVENT.index,
                    id: null,
                  ))
                  .whenComplete(() => Navigator.of(context).pop());
            }
          }),
        ],
      ),
    );
  }
}
