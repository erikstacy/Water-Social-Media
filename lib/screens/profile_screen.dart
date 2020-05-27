import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_social_media/generics/loading_screen.dart';
import 'package:water_social_media/generics/wide_rounded_button.dart';
import 'package:water_social_media/screens/login_screen.dart';
import 'package:water_social_media/services/auth.dart';
import 'package:water_social_media/services/models.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  User user;

  @override
  Widget build(BuildContext context) {

    user = Provider.of<User>(context);

    if (user != null) {
      return Scaffold(
        backgroundColor: Colors.blue[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: Text(
                      user.username[0].toUpperCase(),
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      user.username,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                color: Colors.blue[700],
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Text(
                        'Total Water Consumed',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        user.totalWater.toString(),
                        style: TextStyle(
                          fontSize: 60,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              WideRoundedButton(
                text: 'Sign Out',
                backgroundColor: Colors.blue[700],
                onPressed: _signOut,
              ),
            ],
          ),
        ),
      );
    } else {
      return LoadingScreen();
    }
  }

  void _signOut() {
    AuthService _auth = AuthService();
    _auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}