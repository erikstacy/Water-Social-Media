import 'package:flutter/material.dart';
import 'package:water_social_media/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Social Media',
      home: SplashScreen(),
    );
  }
}