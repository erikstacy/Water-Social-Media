import 'package:flutter/material.dart';

class WarningAlert extends StatelessWidget {

  final String title;
  final String content;

  WarningAlert({ this.title, this.content });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      content: Text(
        content,
        style: TextStyle(
          color: Colors.grey[400],
        ),
      ),
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}