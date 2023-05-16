import "package:flutter/material.dart";
import 'package:meetteam/Appbar/normal_appbar.dart';
import 'package:meetteam/application_write_page.dart';

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
                          Text( // 닉네임
                            ApplicationWritePage.nickName,
                            style: TextStyle(color: color2, fontSize: 23),
                          ),
                          Text( // 전문 분야
                            ApplicationWritePage.supportArea,
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
                  child: Text(ApplicationWritePage.myCareer,
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
                      ApplicationWritePage.introduceUser,
                      style: TextStyle(fontSize: 20)),
                  height: 150,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: color3, width: 10))),

              SizedBox(
                  width: 500,
                  height: 70,
                  child: ElevatedButton(
                      child: Text("확정", style: TextStyle(fontSize: 40)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/userList');
                      }))
            ]));
  }
}
