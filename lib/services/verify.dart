import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/pages/home_page.dart';
import 'package:todo_list/pages/loginPage.dart';

class VerifyService extends StatefulWidget {
  @override
  _VerifyServiceState createState() => _VerifyServiceState();
}

class _VerifyServiceState extends State<VerifyService> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) { 
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'An email has been sent to ${user.email} please verify'
        )),
    );
    
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}