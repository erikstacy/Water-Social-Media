import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {

  final IconData icon;
  final String title;
  final Color color;

  TitleSection({
    this.icon,
    this.title,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        icon != null ? Icon(
          icon,
          size: 80,
          color: color,
        ) : SizedBox(),
        SizedBox(height: 20,),
        Text(
          title,
          style: TextStyle(
            fontSize: 30,
            color: color,
          ),
        ),
      ],
    );
  }
}