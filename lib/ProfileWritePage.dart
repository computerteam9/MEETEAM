import "package:flutter/material.dart";
import 'package:meetteam/Appbar/NormalAppbar.dart';
import 'package:meetteam/MainPage.dart';
import 'package:meetteam/ProfilePage.dart';

class ProfileWritePage extends StatefulWidget {
  final bool? changed;
  const ProfileWritePage({Key? key, required this.changed}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfileWrite();
}

class ProfileWrite extends State<ProfileWritePage> {
  static const color1 = Color(0xff5dbaf4);
  static const List<String> tagList = [
    "C++",
    "Javascript",
    "백엔드",
    "프론트엔드",
    "안드로이드",
    "IOS",
    "웹",
    "AI",
    "게임",
    "데이터베이스",
    "기타"
  ];
  static List<bool> isTagSelected = List.filled(tagList.length, false);

  static final TextEditingController nicknameController =
      TextEditingController();
  static final TextEditingController fieldController = TextEditingController();
  static final TextEditingController areaController = TextEditingController();
  static final TextEditingController blogController = TextEditingController();
  static final TextEditingController careerController = TextEditingController();
  static final TextEditingController activityController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: SingleChildScrollView(child: Column(children: [
          Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "프로필",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ])),
          Row(//mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: Icon(Icons.account_circle, size: 100),
            ),
            Column(children: [
              Container(
                margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                width: 200,
                child: TextFormField(
                    controller: nicknameController,
                    decoration: InputDecoration(
                      hintText: '닉네임',
                    )),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                width: 200,
                child: TextFormField(
                    controller: fieldController,
                    decoration: InputDecoration(
                      hintText: '전문분야',
                    )),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                width: 200,
                child: TextFormField(
                    controller: areaController,
                    decoration: InputDecoration(
                      hintText: '거주지역',
                    )),
              ),
            ])
          ]),
//블로그 입력
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "블로그",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: 400,
            child: TextFormField(
                controller: blogController,
                decoration: InputDecoration(
                  hintText: '블로그',
                )),
          ),
          SizedBox(
            height: 10.0,
          ),
//경력입력
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "경력",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
          ),
          //경력 표시되는 상자
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: 400,
            child: TextField(
                controller: activityController,
                decoration: InputDecoration(
                  hintText: '경력',
                )),
          ),
          SizedBox(
            height: 11.0,
          ),
//활동내역입력
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "활동내역",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: 400,
            child: TextField(
                controller: careerController,
                decoration: InputDecoration(
                  hintText: '활동내역',
                )),
          ),
          SizedBox(
            height: 20.0,
          ),

          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "관심사",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
          ),
          SizedBox(
            height: 20.0,
          ),

          Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  children: [
                    // ToggleButtons 반복 생성
                    for (int i = 0; i < tagList.length; i++)
                      ToggleButtons(
                          color: Colors.black.withOpacity(0.60),
                          selectedColor: color1,
                          selectedBorderColor: color1,
                          fillColor: color1.withOpacity(0.08),
                          splashColor: color1.withOpacity(0.12),
                          hoverColor: color1.withOpacity(0.04),
                          borderRadius: BorderRadius.circular(4.0),
                          constraints: const BoxConstraints(minHeight: 36.0),
                          isSelected: [isTagSelected[i]],
                          onPressed: (index) {
                            setState(() {
                              isTagSelected[i] = !isTagSelected[i];
                            });
                          },
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(tagList[i]))
                          ]),
                  ])),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            child: Text("저장"),
            onPressed: () {
              if (widget.changed == true){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MainPage()));
              }else{
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ProfilePage()));
              }


            },
          ),
        ])));
  }
}
