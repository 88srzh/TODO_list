import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          TopBar(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {}, // ! Добавить task
        elevation: 5,
        tooltip: 'Добавить новую задачу',
      ),
    );
  }
}
