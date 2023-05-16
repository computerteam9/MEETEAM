import 'package:flutter/material.dart';
import 'package:meetteam/notice_page.dart';
import 'package:meetteam/application_check_page.dart';
import 'package:meetteam/profile/signup_page.dart';
import 'package:meetteam/main_page.dart';
import 'package:meetteam/profile/profile_page.dart';
import 'package:meetteam/explorer_page.dart';
import 'package:meetteam/Project/project_list_page.dart';
import 'package:meetteam/Project/project_write_page.dart';
import 'package:meetteam/project/project_read_page.dart';
import 'package:meetteam/user_list_page.dart';
import 'Project/user_check_page.dart';
import 'application_read_page.dart';

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
        '/projectRead': (context) => ApplicationReadPage(),
        '/project': (context) => ProjectReadPage(),
        '/profile': (context) => ProfilePage(),
        '/explorer': (context) => ExplorerPage(),
        '/userList': (context) => UserList(),
        '/userCheck' : (context) => UserCheckPage(),
        '/notice' : (context) => Notice_page(),
      });
  }
}
