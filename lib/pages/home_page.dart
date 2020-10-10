import 'package:flutter/material.dart';
import 'package:todo_list/pages/add_event_page.dart';
import 'package:todo_list/pages/add_task_page.dart';
import 'package:todo_list/pages/event_page.dart';
import 'package:todo_list/pages/task_page.dart';
import 'package:todo_list/widgets/custom_button.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset('assets/images/bg_pink.png').image,
          fit: BoxFit.fitWidth, // ! Был contain
        ),
        gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(255, 0, 0, 0.3),
                  child: IconButton(
                      icon: Icon(Icons.dehaze),
                      color: Colors.white,
                      onPressed: () {}),
                ),
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(255, 0, 0, 0.3),
                  child: IconButton(
                      icon: Icon(Icons.calendar_today),
                      color: Colors.white,
                      onPressed: () {}),
                ),
              ],
            ),
            Row(
              children: [
                  Expanded(
            child: _button(context),
          ),
          ],
        ),
        ],
            ),
        ),
      ),
       Expanded(
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                   TaskPage(),
                   EventPage(),
                ],
              ),
        ),
      ],
    );
  }

    Widget _button(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {
              _pageController.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut,
              );
            }, 
            buttonText: "Задачи",
            color: currentPage < 0.5 ? Theme.of(context).accentColor : Colors.white,
            textColor: currentPage < 0.5 ? Colors.white : Theme.of(context).accentColor,
            borderColor: currentPage < 0.5 ? Colors.transparent : Theme.of(context).accentColor,
            ),
        ),
        SizedBox(
          width: 32,
        ),
        Expanded(
          child: CustomButton(
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut,
              );
            }, 
            buttonText: "События",
            color: currentPage > 0.5 ? Theme.of(context).accentColor : Colors.white,
            textColor: currentPage > 0.5 ? Colors.white : Theme.of(context).accentColor,
            borderColor: currentPage > 0.5 ? Colors.transparent : Theme.of(context).accentColor,
            ),
        ),
      ],
    );
  }
}



