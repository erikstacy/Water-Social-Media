import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
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
            Text(
              user.username,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20,),
            WideRoundedButton(
              text: 'Sign Out',
              backgroundColor: Colors.blue[700],
              onPressed: _signOut,
            ),
          ],
        ),
      ),
    );
  }

  void _signOut() {
    AuthService _auth = AuthService();
    _auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}