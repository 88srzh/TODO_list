import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_list/pages/loginPage.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_list/widgets/login_button.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String email;
  String password;
  String passwordRepeat;
  final _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            child: Column(
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        iconSize: 30,
                        color: Colors.white60,
                        tooltip: 'Назад',
                        onPressed: () {
                          Navigator.pushNamed(context, '/pages/loginPage.dart');
                        }),
                  )
                ]),
                SizedBox(
                  height: 110,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 25.0),
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 25.0),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 25.0),
                  child: TextField(
                    onChanged: (valueRepeat) {
                      passwordRepeat = valueRepeat;
                    },
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Repeat password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                LoginButton(
                  onPressed: () async {
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null && password == passwordRepeat) {
                        showDialog(
                            context: context,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 250),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                ),
                                child: Column(
                                  children: [
                                    Lottie.asset('images/32887-success.json',
                                        height: 150),
                                    Material(
                                      child: Text('Вы зарегистрировались!'),
                                      color: Colors.white,
                                      type: MaterialType.card,
                                      textStyle: TextStyle(
                                          fontSize: 25, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ));
                      }
                      else {
                        Fluttertoast.showToast(msg: 'Что-то пошло не так');
                      }
                    } catch (e) {
                      print(e);
                    }
                    Navigator.pushNamed(context, '/pages/HomePage.dart');
                  },
                  color: Colors.white,
                  buttonText: "Зарегистрироваться",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
