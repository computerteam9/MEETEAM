import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:meetteam/ProjectWritePage.dart';
import 'package:meetteam/Appbar/MainAppbar.dart';
import 'package:meetteam/ProjectWritePage.dart';
import 'package:meetteam/ProjectListPage.dart';
import 'package:meetteam/Color.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: Column(children: [
          Container(
              margin: const EdgeInsets.fromLTRB(50, 20, 50, 10),
              child: Column(children: [
                // 내 프로젝트 상단 라벨
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "내 프로젝트",
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProjectListPage(),
                              ));
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ]),
                // 내 프로젝트 리스트
                Container(
                    height: 100,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                        color: CustomColor.color1,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const ClipOval(
                          child: Icon(
                            Icons.person,
                            size: 50,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "프로젝트 명",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              "프로젝트 설명...",
                              style: TextStyle(
                                  height: 2, fontSize: 10, color: Colors.white),
                            ),
                            Text(
                              "오프라인, 매주 토요일 10시\n백엔드 1 , 디자이너 1,",
                              style:
                                  TextStyle(fontSize: 8, color: Colors.white),
                            ),
                          ],
                        ),
                        const Text(
                          "진행중",
                          style: TextStyle(
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        )
                      ],
                    )),
              ])),
          Container(
              margin: const EdgeInsets.fromLTRB(50, 10, 0, 0),
              // 추천 프로젝트 상단 라벨
              child: Column(children: [
                Row(
                  children: const [
                    Text(
                      "추천",
                    )
                  ],
                ),
                // 추천 프로젝트 리스트
                Stack(children: [
                  Container(
                      height: 360,
                      margin: const EdgeInsets.fromLTRB(0, 10, 50, 10),
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                          color: CustomColor.color3,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  const ClipOval(
                                    child: Icon(
                                      Icons.person,
                                      size: 50,
                                    ),
                                  ),
                                  const Text(
                                    "Nickname",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                  Container(
                                      height: 40,
                                      width: 100,
                                      margin: const EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                          color: CupertinoColors.systemGrey3,
                                          borderRadius:
                                              BorderRadius.circular(37)),
                                      child: const Text("D-2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Colors.white),
                                          textAlign: TextAlign.center)),
                                ]),
                            Container(
                              height: 180,
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              decoration: const BoxDecoration(
                                  color: CupertinoColors.systemGrey3),
                            ),
                            const Text(
                              "  프로젝트명",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                            const Text(
                              "   한줄 소개",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            )
                          ])),
                  Positioned(
                    bottom: 0,
                    right: 20,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjectWritePage(),
                            ));
                      },
                      color: CupertinoColors.systemGrey3,
                      textColor: Colors.black,
                      padding: const EdgeInsets.all(20),
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.create,
                        size: 20,
                      ),
                    ),
                  )
                ])
              ]))
        ]));
  }
}
