import "package:flutter/material.dart";
import 'package:meetteam/Appbar/normal_appbar.dart';
import 'package:meetteam/Widgets/user_info.dart';

class UserList extends StatelessWidget {
  static const color1 = Color(0Xff4676BA);
  static const color2 = Colors.black;
  static const color3 = Color(0xff83B8EE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: Column(
          children: <Widget>[
            //신청자 글씨
            Container(
                margin: EdgeInsets.only(top: 10, left: 20),
                width: 1000,
                child: Text(
                  "신청자",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: color2, fontSize: 23),
                )),
            Expanded(
                child: ListView(padding: EdgeInsets.all(8), children: <Widget>[
              const UserInfo(username: "신청자 1", field: "백엔드"),
              const UserInfo(username: "신청자 2", field: "프론트엔드"),
              const UserInfo(username: "신청자 3", field: "앱 디자인"),
              const UserInfo(username: "신청자 4", field: "웹 디자인"),
              const UserInfo(username: "신청자 5", field: "프론트엔드"),
              const UserInfo(username: "신청자 6", field: "백엔드"),
            ]))
          ],
        ));
  }
}
