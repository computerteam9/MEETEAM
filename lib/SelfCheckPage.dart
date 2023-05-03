import "package:flutter/material.dart";
import 'package:meetteam/Appbar/NormalAppbar.dart';

class UserCheckPage extends StatelessWidget {
  static const color1 = Color(0Xff4676BA);
  static const color2 = Colors.black;
  static const color3 = Color(0xff83B8EE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //프로필 글씨
              Container(
                  margin: EdgeInsets.only(top: 10, left: 20),
                  width: 1000,
                  child: Text(
                    "프로필",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: color2, fontSize: 23),
                  )),

              //프로필 사진 및 간단 정보
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.account_circle, size: 150),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "닉네임",
                            style: TextStyle(color: color2, fontSize: 23),
                          ),
                          Text(
                            "전문 분야",
                            style: TextStyle(color: color2, fontSize: 23),
                          ),
                          Text(
                            "거주 지역",
                            style: TextStyle(color: color2, fontSize: 23),
                          ),
                        ])
                  ]),

              // 경력
              Container(
                  margin: EdgeInsets.only(top: 10, left: 20),
                  width: 1000,
                  child: Text(
                    "경력",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: color2, fontSize: 23),
                  )),

              Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  child: Text("xxx 프로젝트 참여\n yy 아카데미 참여\n A 대회 수상",
                      style: TextStyle(fontSize: 20)),
                  height: 150,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: color3, width: 10))),

              //한 줄 소개 부분
              Container(
                  margin: EdgeInsets.only(top: 10, left: 20),
                  width: 1000,
                  child: Text(
                    "한 줄 소개",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: color2, fontSize: 23),
                  )),

              Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                      "프로젝트에 참여하게 된다면\n 누구보다 성실히 임하고 계속해서\n 아이디어를 생각해낼 자신이 있습니다.",
                      style: TextStyle(fontSize: 20)),
                  height: 150,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: color3, width: 10))),

              SizedBox(
                width: 500,
                height: 70,
                child: Text("확인", style: TextStyle(fontSize: 40)),
              )
            ]));
  }
}
