import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String buttonsTitle;
  final Function buttonsOnPressed;

  RoundedButton(
      {this.buttonsTitle, this.color, @required this.buttonsOnPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: buttonsOnPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonsTitle,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
