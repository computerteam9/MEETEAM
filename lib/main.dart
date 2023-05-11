import 'package:flutter/material.dart';
import 'package:meetteam/SignupPage.dart';
import 'package:meetteam/MainPage.dart';
import 'package:meetteam/ProfilePage.dart';
import 'package:meetteam/ExplorerPage.dart';
import 'package:meetteam/ProjectListPage.dart';
import 'package:meetteam/ProjectWritePage.dart';
import 'package:meetteam/ProfileWritePage.dart';
import 'package:meetteam/ProjectReadPage.dart';
import 'package:meetteam/UserListPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => SignUpPage(),
        '/': (context) => MainPage(),
        '/projects': (context) => ProjectListPage(),
        '/projectWrite': (context) => ProjectWritePage(),
        '/project': (context) => ProjectReadPage(),
        '/profile': (context) => ProfilePage(),
        '/explorer': (context) => ExplorerPage(),
        '/userList': (context) => UserList(),
      });
  }
}
