import 'package:flutter/material.dart';
import 'package:todo_list/pages/home_page.dart';
import 'package:todo_list/pages/login.dart';

class LandingPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
  final bool isLoggedIn = false;

  return isLoggedIn ? HomePage() : AuthorizationPage();
}
}