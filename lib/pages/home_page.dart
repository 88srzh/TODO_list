import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _mainContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {}, // ! Добавить task
        elevation: 5,
        tooltip: 'Добавить новую задачу',
      ),
    );
  }

  Column _mainContent() {
    return Column(
      children: <Widget>[
        TopBar(),
        SizedBox(
          height: 16,
        ),
        _taskUncomplete('Позвонить Тому насчет сервера'),
        _taskUncomplete('Купить продуктов'),
        _taskUncomplete('Погулять с собакой'),
        _taskUncomplete('Накормить кота'),
        Divider(
          height: 1,
        ),
        SizedBox(height: 16),
        _taskComplete('Позавтракать'),
        _taskComplete('Сходить на тренировку'),
      ],
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
