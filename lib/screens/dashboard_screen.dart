import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_social_media/generics/loading_screen.dart';
import 'package:water_social_media/generics/main_screen_card.dart';
import 'package:water_social_media/screens/new_status_screen.dart';
import 'package:water_social_media/services/models.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  List<Post> postList;

  @override
  Widget build(BuildContext context) {

    postList = Provider.of<List<Post>>(context);

    if (postList != null) {

      postList = postList.reversed.toList();

      return Scaffold(
        backgroundColor: Colors.blue[300],
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue[700],
          onPressed: _fabClick,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: postList.length,
            itemBuilder: (context, index) {
              return PostTile(post: postList[index]);
            },
          ),
        ),
      );
    } else {
      return LoadingScreen();
    }

    
  }

  void _fabClick() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewStatusScreen()));
  }
}

class PostTile extends StatelessWidget {

  final Post post;

  PostTile({ this.post });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 24,
                child: Text(
                  post.username[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.username,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${post.createTime.hour}:${post.createTime.minute} ${post.createTime.month} ${post.createTime.day}',
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 55, right: 20),
            child: Text(
              '${post.username} just drank ${post.amount}oz of water',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}