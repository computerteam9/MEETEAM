import 'package:flutter/material.dart';
import 'package:meetteam/Appbar/write_appbar.dart';

// workingTime(신청자 가능한 시간) 변수 사용을 안함

class ApplicationWritePage extends StatefulWidget {
  ApplicationWritePage({super.key});

  @override
  State<StatefulWidget> createState() => _ApplicationWritePageState();
}

class _ApplicationWritePageState extends State<ApplicationWritePage> {
  TextEditingController introduceUserController = TextEditingController();

  static const iconColor = Colors.black;

  @override
  void dispose() {
    introduceUserController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.fromLTRB(50, 0, 30, 0),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: "한 줄 소개",
            ),
            textAlign: TextAlign.start,
            controller: introduceUserController,
            minLines: 2,
            maxLines: 5,
          ),
        ),
      ]),
    );
    // TODO: implement build
  }
}
