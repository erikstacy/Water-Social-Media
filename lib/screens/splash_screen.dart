import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:water_social_media/generics/title_section.dart';
import 'package:water_social_media/screens/login_screen.dart';
import 'package:water_social_media/screens/main_screen.dart';
import 'package:water_social_media/services/auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  AuthService _auth = AuthService();

  @override
  void initState() {
    super.initState();

    _auth.getUser.then(
      (user) {
        if (user != null) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TitleSection(
                color: Colors.blue[700],
                title: 'H20',
                icon: FontAwesomeIcons.tint,
              ),
              SizedBox(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue[700],
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}