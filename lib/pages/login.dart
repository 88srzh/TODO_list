import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}



class _AuthorizationPageState extends State<AuthorizationPage> {
  @override
  Widget build(BuildContext context) {

    Widget _logo() {
  return Padding(
    padding: EdgeInsets.only(top: 100),
    child: Container(
      child: Align (
        child: Text('LOGO', style: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.bold,
          color: Colors.white
        )
        )
      )
    ),
  );
}

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Column(
        children: <Widget>[
          _logo(),
          // _form(),

        ],
      ),
    );
  }
}