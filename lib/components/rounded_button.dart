import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final Color color;
  final String buttonLabel;
  final Function onPressed;

  RoundedButtonWidget({this.color, this.buttonLabel, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonLabel,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
