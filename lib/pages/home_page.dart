import 'package:flutter/material.dart';
import 'package:todo_list/pages/add_event_page.dart';
import 'package:todo_list/pages/add_task_page.dart';
import 'package:todo_list/pages/event_page.dart';
import 'package:todo_list/pages/task_page.dart';
// ! remove task_page.dart
import 'package:todo_list/widgets/top_bar.dart';

class HomePage extends StatefulWidget {

@override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  double currentPage = 0;


  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
     });

    return Scaffold(
      backgroundColor: Colors.white,
      body: _mainContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: currentPage == 0 ? AddTaskPage() : AddEventPage(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                );
              });
        },
        elevation: 5,
        tooltip: 'Добавить новую задачу',
      ),
    );
  }

  Widget _mainContent() {
    return Column(
      children: <Widget>[
        TopBar(),
        Expanded(child: PageView(
          controller: _pageController,
          children: <Widget>[
            EventPage(),
            TaskPage(),
          ],
        )),
      ],
    );
  }
}


