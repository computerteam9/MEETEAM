import "package:flutter/material.dart";
import 'package:meetteam/Appbar/NormalAppbar.dart';

class ProfileWritePage extends StatefulWidget {
  const ProfileWritePage({super.key});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: Column(children: [
          Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [Text("프로필")]),
                  ])),
          Row(
              /*
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[Icon(Icons.account_circle ,color: iconColor, size: 100),]

                )
                */
              //은수 코드
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.account_circle, size: 100),
                Column(children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 150,
                    child: TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '닉네임',
                      labelStyle: TextStyle(fontSize: 10),
                      isCollapsed: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 150,
                    child: TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '전문분야',
                      labelStyle: TextStyle(fontSize: 10),
                      isCollapsed: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 150,
                    child: TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '거주지역',
                      labelStyle: TextStyle(fontSize: 10),
                      isCollapsed: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    )),
                  )
                ])
              ]),
          Container(
            margin: const EdgeInsets.all(10),
            // 추천 프로젝트 상단 라벨
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("블로그")]),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            // 추천 프로젝트 상단 라벨
            child: TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '블로그',
            )),
          ),

          Container(
            margin: const EdgeInsets.all(10),
            // 추천 프로젝트 상단 라벨
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("경력")]),
          ),
          //경력 표시되는 상자
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '경력',
            )),
          ),

          Container(
            margin: const EdgeInsets.all(10),
            // 추천 프로젝트 상단 라벨
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("관심사")]),
          ),

          Container(
              margin: const EdgeInsets.only(
                  left: 30, right: 30), // Wrap으로 감싸서 자동 줄바꿈
              child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  spacing: 5,
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
                  ]))
        ]));
  }
}
