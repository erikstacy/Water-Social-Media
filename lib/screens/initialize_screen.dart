import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_social_media/generics/wide_rounded_button.dart';
import 'package:water_social_media/screens/main_screen.dart';
import 'package:water_social_media/services/models.dart';

class InitializeScreen extends StatefulWidget {
  @override
  _InitializeScreenState createState() => _InitializeScreenState();
}

class _InitializeScreenState extends State<InitializeScreen> {

  TextEditingController _usernameController;

  User user;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pick your username',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 40,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Username',
                    hintStyle: TextStyle(fontSize: 14, color: Colors.white,),
                  ),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 40,),
              WideRoundedButton(
                text: 'Accept',
                backgroundColor: Colors.blue[700],
                onPressed: _accept,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _accept() {
    user.updateUsername(_usernameController.text);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
  }
}