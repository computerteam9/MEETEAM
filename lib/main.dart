import 'package:flutter/material.dart';
import 'package:meetteam/main_page.dart';
import 'package:meetteam/write_Page.dart';
import 'package:meetteam/memberApplication_Page.dart';

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
      home: const LoadingPage(),
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 아무데나 누르면 메인페이지로 이동
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      },
      // 로딩화면
      child: const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
