import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:water_social_media/generics/auth_form.dart';
import 'package:water_social_media/generics/title_section.dart';
import 'package:water_social_media/generics/wide_rounded_button.dart';
import 'package:water_social_media/screens/register_screen.dart';
import 'package:water_social_media/services/form_validation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
                icon: FontAwesomeIcons.tint,
                title: 'H20',
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
                    text: 'Login',
                    onPressed: _onLogin,
                    backgroundColor: Colors.blue[700],
                  ),
                  FlatButton(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen())),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() {
    FormValidation.loginButtonPress(context, _emailController.text, _passwordController.text);
  }
}