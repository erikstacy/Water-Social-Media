import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {

  final TextEditingController emailController;
  final TextEditingController passwordController;

  AuthForm({
    @required this.emailController,
    @required this.passwordController,
  });

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _CircularInput(
          textController: widget.emailController,
          hintText: 'Email',
          inputType: TextInputType.emailAddress,
        ),
        SizedBox(height: 20,),
        _CircularInput(
          textController: widget.passwordController,
          hintText: 'Password',
          obscureText: true,
        ),
      ],
    );
  }
}

class _CircularInput extends StatelessWidget {

  final TextEditingController textController;
  final String hintText;
  final TextInputType inputType;
  final bool obscureText;

  _CircularInput({
    this.textController,
    this.hintText,
    this.inputType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: textController,
        keyboardType: inputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Colors.white,),
        ),
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
