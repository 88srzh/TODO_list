import 'package:flutter/material.dart';
import 'package:todo_list/services/authorization.dart';
import 'package:provider/provider.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}



class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;

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

Widget _loginButton(String text, func()) {
    return RaisedButton(
      // onPressed: () {
      //   func();
      // },
      
          onPressed: () {
          context.read<AuthentificationService>().signIn(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          );},
      splashColor: Theme.of(context).primaryColor,
      highlightColor: Theme.of(context).primaryColor,
      color: Colors.white,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
          fontSize: 20,
        ),
      ),
    );
}
// String label, void func()
Widget _customLoginField(String label, void func()) {
  return Container(
  child: Column(
    children: <Widget> [
      Padding(
        padding: EdgeInsets.only(bottom: 20, top: 10),
        child: _loginInput(
          Icon(Icons.email), 'EMAIL', emailController, false),
        ),
      Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: _loginInput(
          Icon(Icons.lock), 'PASSWORD', passwordController, true),
        ),
        SizedBox(
          height: 20
        ),
        
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: _loginButton(label, func),
          ),
          ),
    ]
  ),);
}

void _tapLoginButton() {
  _email = emailController.text;
  _password = passwordController.text;

  emailController.clear();
  passwordController.clear();

}

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Column(
        children: <Widget>[
          _logo(),
          (
            showLogin
            ? Column( 
              children: <Widget> [
            _customLoginField('ВОЙТИ', _tapLoginButton),
            SizedBox(height: 20,),
            
            Padding(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                child: Text('Еще не зарегистрированы?',
                style: TextStyle(fontSize: 20, color: Colors.white)),              
                onTap:() {
                  setState(() {
                    showLogin = false;
                  });
                } 
              ),
              ),        
              ],
            )
            : Column( 
              children: <Widget> [
            _customLoginField('ЗАРЕГИСТРИРОВАТЬСЯ', _tapLoginButton),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                child: Text('Уже зарегистрированы? Войти!',
                style: TextStyle(fontSize: 20, color: Colors.white)),            
                onTap:() {
                  setState(() {
                    showLogin = true;
                  });
                } ,
              )
              )
            
              ]
            )
          ),
        ],
      ),
    );
  }
}