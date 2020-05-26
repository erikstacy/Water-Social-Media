import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:water_social_media/services/db.dart';

class User {

  String uid;
  Document<User> doc;
  String email;
  String username;

  User({
    this.uid,
    this.doc,
    this.email,
    this.username,
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return User(
      uid: data['uid'],
      doc: Document<User>(path: doc.reference.path),
      email: data['email'],
      username: data['username'],
    );
  }

  void updateUsername(String username) {
    this.username = username;
    updateData();
  }

  void updateData() {
    doc.upsert({
      'email': this.email,
      'username': this.username,
    });
  }
}