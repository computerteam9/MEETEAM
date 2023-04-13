import 'package:flutter/material.dart';
import 'appbar.dart';

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
      home: const MyHomePage(title: 'MEETTEAM'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const color1 = Color(0xff5dbaf4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(key: UniqueKey(), appBar: AppBar()),
        body: Column(children: [
          Container(
              margin: const EdgeInsets.all(50),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text("내 프로젝트"), Icon(Icons.add)]),
                Container(
                    height: 90,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: color1, borderRadius: BorderRadius.circular(10)))
              ])),
          Container(
            margin: const EdgeInsets.all(50),
            child: Row(children: const [Text("추천")]),
          )
        ]));
  }
}
