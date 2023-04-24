import "package:flutter/material.dart";
import 'package:meetteam/app_bar.dart';
import 'package:meetteam/color.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
                        "내 프로젝트",
                      ),
                      Icon(Icons.add)
                    ]),
                // 내 프로젝트 리스트
                Container(
                    height: 90,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: CustomColor.color1,
                        borderRadius: BorderRadius.circular(10)))
              ])),
          Container(
            margin: const EdgeInsets.all(50),
            // 추천 프로젝트 상단 라벨
            child: Row(children: const [Text("추천")]),
          )
        ]));
  }
}
