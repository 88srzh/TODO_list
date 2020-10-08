import 'package:flutter/material.dart';
import 'package:todo_list/widgets/custom_button.dart';
import 'package:todo_list/widgets/custom_textfield.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class AddEventPage extends StatefulWidget {

  @override
  _AddEventPageState createState() => _AddEventPageState();
}
class _AddEventPageState extends State<AddEventPage> {

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
      primaryColor: Color.fromRGBO(255, 0, 0, 0.5),
      accentColor: Colors.redAccent,
      disabledColor: Colors.blue,
      accentTextTheme: TextTheme(
      bodyText2 : TextStyle(color: Colors.black),
         )));
      // ! - Исправить слова внизу на черный цвет
      if (datepick != null) setState(() {
        _selectedDate = datepick.toString();
      });
  }

  Future _pickTime() async {
    TimeOfDay timepick = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now(),
      builder: (
        BuildContext context, Widget child) {
          return new Theme(data: ThemeData(
            primaryColor: Color.fromRGBO(255, 0, 0, 0.5),
            accentColor: Colors.redAccent,
            disabledColor: Colors.blue,
            accentTextTheme: TextTheme(
              bodyText2: TextStyle(color: Colors.black)),
            ),
            child: child,
            );
        } // ! - builder нужен ли?
      );
    
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
          _dateTimePicker(Icons.date_range, _pickDate, _selectedDate),
          _dateTimePicker(Icons.access_time, _pickTime, _selectedTime),
          SizedBox(
            height: 24,
          ),
          _actionButton(context)
        ],
      ),
    );
  }

  Widget _dateTimePicker(IconData icon, VoidCallback onPressed, String value) {
    return FlatButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: [
                Icon(icon,
                color: Theme.of(context).accentColor,
                size: 30,),
                SizedBox(
                  width: 12,
                ),
                Text(
                  value,
                style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ));
  }

  Widget _actionButton(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              buttonText: "Закрыть",
            ),
            CustomButton(
              onPressed: () {},
              buttonText: "Сохранить",
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
            )
          ],);
  }
}