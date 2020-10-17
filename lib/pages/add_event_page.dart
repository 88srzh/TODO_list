import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        _selectedDate = datepick;
      });
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
            'Добавить новое событие',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )),
          SizedBox(
            height: 24,
          ),
          CustomTextField(labelText: 'Добавить новое событие'),
          SizedBox(
            height: 12,
          ),
          CustomTextField(labelText: 'Введите описание'),
          SizedBox(
            height: 12,
          ),
          CustomDateTimePicker(
            onPressed: _pickDate,
            icon: Icons.date_range, 
            value: new DateFormat("dd-MM-yyyy").format(_selectedDate),
            ),
          CustomDateTimePicker(
            onPressed: () {},
            icon: Icons.access_time,
            value: new DateFormat.yMMMd().format(new DateTime.now())),
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