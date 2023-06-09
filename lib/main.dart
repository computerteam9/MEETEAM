import 'package:flutter/material.dart';
import 'package:meetteam/Api/project_api.dart';
import 'package:meetteam/notice_page.dart';
import 'package:meetteam/Profile/signup_page.dart';
import 'package:meetteam/main_page.dart';
import 'package:meetteam/Profile/profile_page.dart';
import 'package:meetteam/Profile/profile_write_page.dart';
import 'package:meetteam/explorer_page.dart';
import 'package:meetteam/Project/project_list_page.dart';
import 'package:meetteam/Project/project_write_page.dart';
import 'package:meetteam/project/project_read_page.dart';
import 'package:meetteam/user_list_page.dart';
import 'Project/user_check_page.dart';
import 'package:meetteam/Api/db.dart';
import 'package:meetteam/Api/user_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meetteam/Api/session.dart';
import 'package:meetteam/Profile/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  DB();
  Session();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
          '/': (context) => MainPage(),
          '/projects': (context) => ProjectListPage(),
          '/projectWrite': (context) => ProjectWritePage(),
          '/project': (context) => ProjectReadPage(),
          '/profile': (context) => ProfilePage(),
          '/profileWrite': (context) => ProfileWritePage(),
          '/explorer': (context) => ExplorerPage(),
          '/userList': (context) => UserList(),
          '/userCheck': (context) => UserCheckPage(),
          '/notice': (context) => Notice_page(),
        });
  }
}
