import "package:flutter/material.dart";
import 'package:meetteam/app_bar.dart';

class UserCheck extends StatelessWidget {
  static const color1 = Color(0xff5dbaf4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(key: UniqueKey(), appBar: AppBar()),
        body: Column(children: [
          Container(
              margin: const EdgeInsets.all(50),
              child: Column(children: [
                // 내 프로젝트 상단 라벨
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "프로필",
                      ),
                      Icon(Icons.add)
                    ]),
                // 내 프로젝트 리스트
                Container(
                    height: 90,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: color1, borderRadius: BorderRadius.circular(10)))
              ])),
          Container(
            margin: const EdgeInsets.all(50),
            // 추천 프로젝트 상단 라벨
            child: Row(children: const [Text("추천")]),
          )
        ]));
  }
}
