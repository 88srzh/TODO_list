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

Widget _loginInput(Icon icon, String hint, TextEditingController loginController, bool obscure) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: TextField(
      controller: loginController,
      obscureText: obscure,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white30,
        ),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54, width: 1),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: IconTheme(
            data: IconThemeData(
              color: Colors.white
              ),
            child: icon
            ),
        )
      ),
    ),
  );
}

Widget _CustomLoginField(String label, void func()) {
  return Container(
  child: Column(
    children: <Widget> [
      Padding(
        padding: EdgeInsets.only(bottom: 20, top: 10),
        child: _loginInput(),
        ),
      Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: _loginInput(),
        ),
        SizedBox(
          height: 20
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Text(label),
          ),
          ),
    ]
  ),);
}

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Column(
        children: <Widget>[
          _logo(),
          _CustomLoginField('login', () { }),

        ],
      ),
    );
  }
}