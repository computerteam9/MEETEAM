import 'package:flutter/material.dart';
import 'package:meetteam/ExplorerPage.dart';
import 'package:meetteam/ProfilePage.dart';
import 'package:meetteam/ProfileWritePage.dart';
import 'package:meetteam/MainPage.dart';
import 'package:meetteam/UserCheckpage.dart';
import 'package:meetteam/ProjectWritePage.dart';
import 'package:meetteam/ApplicationPage.dart';

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
