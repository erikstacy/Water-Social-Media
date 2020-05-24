import 'package:flutter/material.dart';

class GenericFlatButton extends StatelessWidget {

  final String text;
  final Function onPressed;

  GenericFlatButton({
    @required this.text,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}