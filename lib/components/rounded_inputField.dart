import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String inputHint;
  final Function onChanged;
  final bool passwordFormat;
  final TextInputType textInputType;

  RoundedInputField({
    this.inputHint,
    this.onChanged,
    this.passwordFormat,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      onChanged: onChanged,
      obscureText: passwordFormat,
      decoration: InputDecoration(
        hintText: inputHint,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
