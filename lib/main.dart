import 'package:flutter/material.dart';
import 'package:meetteam/Mainpage.dart';
import 'package:meetteam/UserListPage.dart';
import 'package:meetteam/ApplicationReadPage.dart';
import 'package:meetteam/ExplorerPage.dart';
import 'package:meetteam/ProfilePage.dart';
import 'package:meetteam/ProfileWritePage.dart';
import 'package:meetteam/MainPage.dart';
import 'package:meetteam/SignupPage.dart';
import 'package:meetteam/ProjectReadPage.dart';
import 'package:meetteam/UserCheckpage.dart';
import 'package:meetteam/ProjectWritePage.dart';
import 'package:meetteam/ApplicationWritePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MainPage(),
    );
  }
}
