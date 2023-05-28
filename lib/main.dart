import 'package:flutter/material.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'Project/user_check_page.dart';
import 'package:meetteam/Api/user_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  UserApi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UserApi.addUser('def@def.com', 'passss2', 'tom', 'inttr2r', 'blog2.blog2', [
    //   {"파이썬": 0}
    // ], [
    //   "게임"
    // ]);
    UserApi.getUser('L7XzFMgGBeOnaa3NXNPL').then((value) {
      print(value);
      print(value.interest);
    });
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: '/',
        routes: {
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
