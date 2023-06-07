import 'package:flutter/material.dart';
import 'package:meetteam/Appbar/write_appbar.dart';
import "package:meetteam/Api/session.dart";
import "package:meetteam/Api/user_api.dart";

// workingTime(신청자 가능한 시간) 변수 사용을 안함

class ApplicationWritePage extends StatefulWidget {
  ApplicationWritePage({super.key});

  static String nickName = _ApplicationWritePageState().nickNameController.text;
  static String supportArea =
      _ApplicationWritePageState().supportAreaController.text;
  static String myCareer = _ApplicationWritePageState().myCareerController.text;
  static String workingTime =
      _ApplicationWritePageState().workingTimeController.text;
  static String introduceUser =
      _ApplicationWritePageState().introduceUserController.text;

  @override
  State<StatefulWidget> createState() => _ApplicationWritePageState();
}

class _ApplicationWritePageState extends State<ApplicationWritePage> {
  TextEditingController nickNameController = TextEditingController();
  TextEditingController supportAreaController = TextEditingController();
  TextEditingController myCareerController = TextEditingController();
  TextEditingController workingTimeController = TextEditingController();
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
          margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 7,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "닉네임",
                ),
                textAlign: TextAlign.start,
                controller: nickNameController,
              ),
            ),
            Spacer(flex: 1),
            Flexible(
              fit: FlexFit.tight,
              flex: 10,
              child: TextFormField(
                decoration: const InputDecoration(labelText: "지원 분야"),
                textAlign: TextAlign.start,
                controller: supportAreaController,
                minLines: 1,
                maxLines: 3,
              ),
            ),
          ]),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "경력",
              ),
              textAlign: TextAlign.start,
              controller: myCareerController,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "활동 시간"),
              textAlign: TextAlign.start,
              controller: workingTimeController,
              minLines: 1,
              maxLines: 3,
            ),
          ]),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: "한 줄 소개",
            ),
            textAlign: TextAlign.start,
            controller: introduceUserController,
            minLines: 1,
            maxLines: 3,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(30),
          alignment: Alignment.centerLeft,
          child: const Icon(
            Icons.add,
            color: iconColor,
            size: 30,
          ),
          // const IconButton(
          //   icon: Icon(Icons.add, color:iconColor, size: 30),
          //   onPressed: () => {print("hi")},
          // ),
        ),
      ]),
    );
    // TODO: implement build
  }
}
