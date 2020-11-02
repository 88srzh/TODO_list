import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
    final VoidCallback onPressed;
  final String buttonText;
  final Color color;
  final Color textColor;
  final Color borderColor;

  LoginButton({
    @required this.onPressed,
    @required this.buttonText,
    this.color,
    this.textColor,
    this.borderColor = Colors.transparent
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        ),
        color: color,
        textColor: textColor,
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 12.0),
        child: Text(buttonText,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        ),
    );
  }
}