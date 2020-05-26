import 'package:flutter/material.dart';

class NewStatusScreen extends StatefulWidget {
  @override
  _NewStatusScreenState createState() => _NewStatusScreenState();
}

class _NewStatusScreenState extends State<NewStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'How much water you do be drinkin tho?'
              ),
            ],
          ),
        ),
      ),
    );
  }
}