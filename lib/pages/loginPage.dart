import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_list/widgets/login_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  AnimationController controller;
  final _auth = FirebaseAuth.instance;
  double _opacity = 0.0;
  double _opacity2 = 0.0;
  String email;
  String password;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = AnimationController(
  //     vsync: this,
  //     duration: Duration(seconds: 4),
  //   );
  //   controller.repeat();
  //   Future.delayed(Duration(milliseconds: 250), () {
  //     _opacity = 1;
  //   });
  //   Future.delayed(Duration(milliseconds: 350), () {
  //     _opacity2 = 1;
  //   });
  // }

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
                            'TODO list',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.white,
                            ),
                          ),
                          // AnimatedBuilder(
                          //   animation: controller,
                          //   child: Container(
                          //     child: Image(
                          //       image: AssetImage(
                          //           'images/icons/1x/outline_highlight_off_white_48dp.png'),
                          //       height: 35,
                          //     ),
                          //   ),
                          //   builder: (BuildContext context, Widget _widget) {
                          //     return Transform.rotate(
                          //       angle: controller.value * 6.3,
                          //       child: _widget,
                          //     );
                          //   },
                          // ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40.0, bottom: 60, right: 130),
                        child: Text(
                          'Добро пожаловать!',
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
                        hintText: 'Логин',
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
                        hintText: 'Пароль',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Fluttertoast.showToast(
                              msg: "This is Center Short Toast",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white,
                              textColor: Colors.red,
                              fontSize: 16.0);
                    },
                                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Забыли пароль?',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
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
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
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
                                        child: Text('Вы вошли!'),
                                        color: Colors.white,
                                        type: MaterialType.card,
                                        textStyle: TextStyle(
                                            fontSize: 25, color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                          Navigator.pushNamed(context, '/pages/home_page.dart');
                        } 
                        else if (user == null) {
                        Fluttertoast.showToast(
                              msg: "This is Center Short Toast",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      } catch (e) {
                        print(Text('Вы не зарегистрированы!'));
                      }
                      
                    },
                    color: Colors.white,
                    buttonText: 'ВОЙТИ',
                    // ! - при нажатии если поле пустоe - уведомление
                  ),
                  SizedBox(
                    height: 220,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/pages/registration.dart');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Еще нет аккаунта? Зарегистрируйтесь!',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
