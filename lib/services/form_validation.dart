import 'package:flutter/material.dart';
import 'package:water_social_media/generics/warning_alert.dart';
import 'package:water_social_media/screens/main_screen.dart';
import 'package:water_social_media/screens/initialize_screen.dart';
import 'package:water_social_media/services/auth.dart';

class FormValidation {

  static final AuthService _auth = AuthService();

  /// On login button pressed, validate everything
  static Future<void> loginButtonPress(BuildContext context, String email, String password) async {
    int formResult = await _validateEmailLogin(email, password);

    if (formResult == 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
    } else if (formResult == 1) {
      showDialog(
        context: context,
        builder: (context) {
          return WarningAlert(
            title: 'Wrong account information',
            content: 'The username or password may be wrong. If you don\'t have an account yet then tap on Register at the bottom of the screen.',
          );
        },
      );
    } else if (formResult == 2) {
      showDialog(
        context: context,
        builder: (context) {
          return WarningAlert(
            title: 'Email isn\'t formatted properly',
            content: 'Check to make sure that you have a valid email address for your email.',
          );
        },
      );
    } else if (formResult == 3) {
      showDialog(
        context: context,
        builder: (context) {
          return WarningAlert(
            title: 'Password isn\'t long enough',
            content: 'Your password must be at least 6 characters long.',
          );
        },
      );
    }
  }

  /// On register button pressed, validate everything
  static Future<void> registerButtonPress(BuildContext context, String email, String password) async {
    int formResult = await _validateEmailRegistration(email, password);

    if (formResult == 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => InitializeScreen()));
    } else if (formResult == 1) {
      showDialog(
        context: context,
        builder: (context) {
          return WarningAlert(
            title: 'Account already exists',
            content: 'You can go back a screen or Login with this account information.',
          );
        },
      );
    } else if (formResult == 2) {
      showDialog(
        context: context,
        builder: (context) {
          return WarningAlert(
            title: 'Email isn\'t formatted properly',
            content: 'Check to make sure that you have a valid email address for your email.',
          );
        },
      );
    } else if (formResult == 3) {
      showDialog(
        context: context,
        builder: (context) {
          return WarningAlert(
            title: 'Password isn\'t long enough',
            content: 'Your password must be at least 6 characters long.',
          );
        },
      );
    }
  }

  /// Handles an email login and it's validation
  /// 
  /// 0 - Login successful
  /// 
  /// 1 - Account doesn't exist
  /// 
  /// 2 - Email string is not properly formatted
  /// 
  /// 3 - Password isn't long enough (Must be 6 characters minimum)
  static Future<int> _validateEmailLogin(String email, String password) async {

    bool emailValid = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(email);
    var user = await _auth.emailLogin(email, password);

    if (!emailValid) {
      return 2;
    } else if (password.length < 6) {
      return 3;
    } else if (user == null) {
      return 1;
    } else {
      return 0;
    }
  }

  /// Handles an email registration attempt and it's validation
  /// 
  /// 0 - Login successful
  /// 
  /// 1 - Account already exists
  /// 
  /// 2 - Email string is not properly formatted
  /// 
  /// 3 - Password isn't long enough (Must be 6 characters minimum)
  static Future<int> _validateEmailRegistration(String email, String password) async {

    bool emailValid = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(email);
    var user = await _auth.emailRegister(email, password);

    if (!emailValid) {
      return 2;
    } else if (password.length < 6) {
      return 3;
    } else if (user == null) {
      return 1;
    } else {
      return 0;
    }
  }

}