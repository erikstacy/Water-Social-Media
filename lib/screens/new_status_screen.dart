import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_social_media/generics/wide_rounded_button.dart';
import 'package:water_social_media/services/globals.dart';
import 'package:water_social_media/services/models.dart';

class NewStatusScreen extends StatefulWidget {
  @override
  _NewStatusScreenState createState() => _NewStatusScreenState();
}

class _NewStatusScreenState extends State<NewStatusScreen> {

  TextEditingController _waterController;
  User user;
  List<Post> postList;

  @override
  void initState() {
    super.initState();
    _waterController = TextEditingController();
  }

  @override
  void dispose() {
    _waterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    user = Provider.of<User>(context);
    postList = Provider.of<List<Post>>(context);

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40,),
              Text(
                'How much water you do be drinkin doe?',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _waterController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
                          hintStyle: TextStyle(fontSize: 60, color: Colors.grey[800],),
                        ),
                        style: TextStyle(
                          fontSize: 60,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      'oz',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              WideRoundedButton(
                text: 'Post',
                backgroundColor: Colors.blue[700],
                onPressed: _post,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _post() {
    Post newPost = Post(username: user.username, amount: int.parse(_waterController.text), createTime: DateTime.now());
    newPost.postIt();
    user.updateWaterAmount(int.parse(_waterController.text));
    Navigator.pop(context);
  }
}