import "package:flutter/material.dart";
import 'package:meetteam/app_bar_goback.dart';

class UserCheck extends StatelessWidget {
  static const color1 = Color(0xff5dbaf4);
  static const color2 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar2(key: UniqueKey(), appBar: AppBar()),
        body: Column(children: <Widget>[
          //프로필 글씨
          Text(
            "프로필",
            style: TextStyle(color: color2, fontSize: 20),
          ),
          //프로필 사진 및 간단 정보
          Row(children: <Widget>[
            Icon(Icons.account_circle, size: 150),
            Column(children: <Widget>[
              Text(
                "닉네임",
                style: TextStyle(color: color2, fontSize: 20),
              ),
              Text(
                "전문 분야",
                style: TextStyle(color: color2, fontSize: 20),
              ),
              Text(
                "거주 지역",
                style: TextStyle(color: color2, fontSize: 20),
              ),
            ])
          ]),

          // 경력
          Text(
            "경력",
            style: TextStyle(color: color2, fontSize: 20),
          ),

          Container(
              child: Text("xxx 프로젝트 참여\n yy 아카데미 참여\n A 대회 수상"),
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: color1, width: 10))),

          //한 줄 소개 부분
          Text(
            "한 줄 소개",
            style: TextStyle(color: color2, fontSize: 20),
          ),

          Container(
              child: Text(
                  "프로젝트에 참여하게 된다면\n 누구보다 성실히 임하고 계속해서\n 아이디어를 생각해낼 자신이 있습니다."),
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: color1, width: 10))),

          SizedBox(
              width: 500,
              height: 50,
              child: ElevatedButton(child: Text("확정"), onPressed: () {}))
        ]));
  }
}
