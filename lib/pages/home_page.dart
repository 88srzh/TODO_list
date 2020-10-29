import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/pages/add_event_page.dart';
import 'package:todo_list/pages/add_task_page.dart';
import 'package:todo_list/pages/event_page.dart';
import 'package:todo_list/pages/task_page.dart';
import 'package:todo_list/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/services/authorization.dart';

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
      body: Stack(
        children: <Widget>[
          Container(
            height: 35,
            color: Theme.of(context).accentColor,
          ),
          Positioned(
            right: 0,
            child: Text(
              new DateFormat("dd").format(DateTime.now()),
              style: TextStyle(fontSize: 200, color: Color(0x10000000)),
            ),
          ),
          _mainContent(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                    child: currentPage == 0 ? AddTaskPage() : AddEventPage(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))));
              });
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app_sharp),
              onPressed: () {
                context.read<AuthentificationService>().signOut();
              },
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _mainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            new DateFormat("EEEE", 'ru').format(DateTime.now()),
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: _button(context),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            children: <Widget>[TaskPage(), EventPage()],
          ),
        ),
        RaisedButton(onPressed: () {}),
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
            color: currentPage < 0.5
                ? Theme.of(context).accentColor
                : Colors.white,
            textColor: currentPage < 0.5
                ? Colors.white
                : Theme.of(context).accentColor,
            borderColor: currentPage < 0.5
                ? Colors.transparent
                : Theme.of(context).accentColor,
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
            color: currentPage > 0.5
                ? Theme.of(context).accentColor
                : Colors.white,
            textColor: currentPage > 0.5
                ? Colors.white
                : Theme.of(context).accentColor,
            borderColor: currentPage > 0.5
                ? Colors.transparent
                : Theme.of(context).accentColor,
          ),
        ),
      ],
    );
  }
}
