import "package:flutter/material.dart";
import 'package:meetteam/Appbar1.dart';
import 'package:meetteam/UserCheckPage.dart';

class UserList extends StatelessWidget {
  static const color1 = Color(0Xff4676BA);
  static const color2 = Colors.black;
  static const color3 = Color(0xff83B8EE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar2(key: UniqueKey(), appBar: AppBar()),
        body: Column(children: <Widget>[
          //신청자 글씨
          Container(
              margin: EdgeInsets.only(top: 10, left: 20),
              width: 1000,
              child: Text(
                "신청자",
                textAlign: TextAlign.left,
                style: TextStyle(color: color2, fontSize: 23),
              )),

          //각 신청자별 상자
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(10),
            height: 150,
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: color3, width: 10)),
            //상자 내부 구현(이미지, column(row1개(닉네임, 지원 분야),한 줄 소개), 왕관 이미지)
            child: Row(
              children: <Widget>[
                Icon(Icons.account_circle, size: 150),
              ],
            ),
          ),
        ]));
  }
}
