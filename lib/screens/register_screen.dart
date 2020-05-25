import 'package:flutter/material.dart';
import 'package:water_social_media/generics/auth_form.dart';
import 'package:water_social_media/generics/title_section.dart';
import 'package:water_social_media/generics/wide_rounded_button.dart';
import 'package:water_social_media/services/form_validation.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
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
                title: 'Welcome!',
                color: Colors.blue[700],
              ),
              AuthForm(
                emailController: _emailController,
                passwordController: _passwordController,
                backgroundColor: Colors.blueAccent,
              ),
              Column(
                children: <Widget>[
                  WideRoundedButton(
                    text: 'Register',
                    onPressed: _onRegister,
                    backgroundColor: Colors.blue[700],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onRegister() {
    FormValidation.registerButtonPress(context, _emailController.text, _passwordController.text);
  }
}