import 'package:flutter/material.dart';
import 'package:todo_list/pages/task_page.dart';
import '../widgets/top_bar.dart';
import 'event_page.dart';

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

  Widget _mainContent() {
    return Column(
      children: <Widget>[
        TopBar(),
        Expanded(child: EventPage()),
      ],
    );
  }
}
