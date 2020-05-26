import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_social_media/screens/splash_screen.dart';
import 'package:water_social_media/services/globals.dart';
import 'package:water_social_media/services/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(value: Global.userDocument.documentStream),
      ],
      child: MaterialApp(
        title: 'Water Social Media',
        home: SplashScreen(),
      ),
    );
  }
}