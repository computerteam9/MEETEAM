import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Firebase_test extends Widget {
  @override
  void createstate() => writeNewPost("uid", "username", "img", "title", "body");

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }

}
void writeNewPost(String uid, String username, String picture, String title,
    String body) async {
  // A post entry.
  final postData = {
    'author': username,
    'uid': uid,
    'body': body,
    'title': title,
    'starCount': 0,
    'authorPic': picture,
  };

  // Get a key for a new Post.
  final newPostKey =
      FirebaseDatabase.instance.ref().child('posts').push().key;

  // Write the new post's data simultaneously in the posts list and the
  // user's post list.
  final Map<String, Map> updates = {};
  updates['/posts/$newPostKey'] = postData;
  updates['/user-posts/$uid/$newPostKey'] = postData;

  return FirebaseDatabase.instance.ref().update(updates);
}