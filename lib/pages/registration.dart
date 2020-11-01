import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/pages/loginPage.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  PageController _registrationPageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(children: [
              SizedBox(
                height: 300,
              ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
            child: TextField(
              onChanged: (value) {
                email = value;
              },
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white, fontSize: 20),
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Username',
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
            child: TextField(
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(color: Colors.white, fontSize: 20),
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (newUser != null) {
                  showDialog(
                      context: context,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 250),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Column(
                            children: [
                              Lottie.asset('images/32887-success.json',
                                  height: 150),
                              Material(
                                child: Text('Вы зарегистрировались!'),
                                color: Colors.white,
                                type: MaterialType.card,
                                textStyle:
                                    TextStyle(fontSize: 25, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ));
                }
              } catch (e) {
                print(e);
              }
            },
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 55.0),
              child: Text('Зарегистрироваться',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ],
      ),
    ),
        ),
      ),
    );
  }
}
