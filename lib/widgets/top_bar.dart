import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  TopBar({Key key}) : super(key: key);

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
                            icon: Icon(Icons.insert_chart),
                            color: Colors.white,
                            tooltip: 'Задачи',
                            onPressed: () {}),
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
