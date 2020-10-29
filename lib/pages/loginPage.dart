import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
  filled: true,
  fillColor: Colors.white30,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide.none,
  ),
);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController controller;
  final _auth = FirebaseAuth.instance;
  double _opacity = 0.0;
  double _opacity2 = 0.0;
  String email;
  String password;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    controller.repeat();
    Future.delayed(Duration(milliseconds: 250), (){
      _opacity = 1;
    });
    Future.delayed(Duration(milliseconds: 350), (){
      _opacity2 = 1;
    });
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
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 5),
                curve: Curves.easeIn,
                 child: AnimatedOpacity(
                   opacity: _opacity2,
                   duration: Duration(seconds: 5),
                   curve: Curves.easeInOut,
                                    child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'LOGO',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.white,
                            ),
                          ),
                          AnimatedBuilder(
                            animation: controller,
                            child: Container(
                              child: Image(
                                image: AssetImage(
                                    'images/icons/1x/outline_highlight_off_white_48dp.png'),
                                height: 35,
                              ),
                            ),
                            builder: (BuildContext context, Widget _widget) {
                              return Transform.rotate(
                                angle: controller.value * 6.3,
                                child: _widget,
                              );
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40.0, bottom: 60, right: 130),
                        child: Text(
                          'Get started here',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                ),
                 ),
              ),
              Column(
                children: [
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
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Забыл пароль?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () async {
                      try {
                      final newUser = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      if (newUser != null) {
                        showDialog(
                            context: context,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 250),
                              child: Container(
                                  decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Column(
                                children: [                                
                                  Lottie.asset('images/32887-success.json', height: 150),
                                  Material(
                                    child: Text('Thanks for Signing'),
                                    color: Colors.white,
                                    type: MaterialType.card,
                                    textStyle: TextStyle(fontSize: 25, color: Colors.black),
                                  )
                                ],
                              ),
                              ),
                            ));
                      }
                      } catch (e) {
                        print (e);
                      }
                    },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 55.0),
                          child: Text('Войти',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Text(
                      'Еще нет аккаунта? Зарегистрируйтесь!',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
