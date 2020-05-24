import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {

  final IconData icon;
  final String title;

  TitleSection({ this.icon, this.title });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        icon != null ? Icon(
          icon,
          size: 80,
          color: Colors.white,
        ) : SizedBox(),
        SizedBox(height: 20,),
        Text(
          title,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}