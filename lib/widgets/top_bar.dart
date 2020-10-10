import 'package:flutter/material.dart';
import 'package:todo_list/pages/add_event_page.dart';
import 'package:todo_list/pages/add_task_page.dart';
import 'package:todo_list/pages/home_page.dart';

class TopBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  height: 50.0,
                  width: 150.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(255, 0, 0, 0.5),
                        child: IconButton(
                          
                            icon: Icon(Icons.check_circle),
                            color: Colors.white,
                            
                            tooltip: 'Задачи',
                            onPressed: () {
                              showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: AddTaskPage(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                );
                            });
                            }),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(255, 0, 0, 0.5),
                        child: IconButton(
                            icon: Icon(Icons.insert_chart),
                            color: Colors.white,
                            tooltip: 'События',
                            onPressed: () {
                              showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: AddEventPage(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                );
              });

                            }),
                      )
                      // ! - Добавить иконки с датами
                    ],
                  ),
                ),
                Chip(
                  backgroundColor: Color.fromRGBO(255, 0, 0, 0.5),
                  label: Text(
                    '03.10.2020',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(255, 0, 0, 0.5),
                  child: IconButton(
                      icon: Icon(Icons.insert_chart),
                      color: Colors.white,
                      tooltip: 'Показать график',
                      onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
