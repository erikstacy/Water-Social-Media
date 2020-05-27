import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:water_social_media/services/db.dart';
import 'package:water_social_media/services/globals.dart';

class User {

  String uid;
  Document<User> doc;
  String email;
  String username;
  int totalWater;

  User({
    this.uid,
    this.doc,
    this.email,
    this.username,
    this.totalWater,
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return User(
      uid: data['uid'],
      doc: Document<User>(path: doc.reference.path),
      email: data['email'],
      username: data['username'],
      totalWater: data['totalWater'],
    );
  }

  void updateUsername(String username) {
    this.username = username;
    _updateData();
  }

  void updateWaterAmount(int addition) {
    this.totalWater += addition;
    _updateData();
  }

  void _updateData() {
    doc.upsert({
      'email': this.email,
      'username': this.username,
      'totalWater': this.totalWater,
    });
  }
}

class Post {

  String id;
  Document<Post> doc;
  String username;
  int amount;
  DateTime createTime;

  Post({
    this.id,
    this.doc,
    this.username,
    this.amount,
    this.createTime,
  });

  factory Post.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Post(
      id: data['id'],
      doc: Document<Post>(path: doc.reference.path),
      username: data['username'],
      amount: data['amount'],
      createTime: DateTime.fromMillisecondsSinceEpoch(data['createTime'].seconds * 1000),
    );
  }

  void postIt() {
    Global.postCollection.upsert({
      'username': this.username,
      'amount': this.amount,
      'createTime': this.createTime,
    });
  }
}