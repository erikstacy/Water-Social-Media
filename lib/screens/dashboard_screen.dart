import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[700],
        onPressed: _fabClick,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            
          ],
        ),
      ),
    );
  }

  void _fabClick() {
    // Todo - Do this
  }
}