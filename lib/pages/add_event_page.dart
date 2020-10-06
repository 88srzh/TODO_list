import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {

  @override
  _AddEventPageState createState() => _AddEventPageState();
}
class _AddEventPageState extends State<AddEventPage> {
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
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                labelText: 'Введите задачу'),
          ),
          SizedBox(
            height: 24,
          ),
          _actionButton(context)
        ],
      ),
    );

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