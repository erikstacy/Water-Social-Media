import 'package:flutter/material.dart';

class WideRoundedButton extends StatelessWidget {

  final String text;
  final Function onPressed;
  final Color backgroundColor;

  WideRoundedButton({
    @required this.text,
    @required this.onPressed,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      color: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 13),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      onPressed: onPressed,
    );
  }
}