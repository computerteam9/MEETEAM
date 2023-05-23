import 'package:flutter/material.dart';
import 'package:meetteam/Color.dart';

class UserInfo extends StatelessWidget {
  final String username;
  final String field;
  final Color color3;
  final Color color2;
  final Color color1;

  const UserInfo(
      {super.key,
      required this.username,
      required this.field,
      this.color3 = CustomColor.color3,
      this.color1 = CustomColor.color1,
      this.color2 = Colors.black});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/userCheck');
        },
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(10),
          height: 115,
          width: 370,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: color3, width: 5)),
          //상자 내부 구현(이미지, column(row1개(닉네임, 지원 분야),한 줄 소개), 왕관 이미지)
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //프로필 사진
              Icon(Icons.account_circle, size: 70),
              //글 부분
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //닉네임
                        Container(
                            margin: EdgeInsets.only(top: 3, left: 10),
                            width: 100,
                            child: Text(username,
                                textAlign: TextAlign.left,
                                style: TextStyle(color: color2, fontSize: 20))),
                        //지원 분야
                        Container(
                            margin: EdgeInsets.only(top: 5, left: 5),
                            width: 100,
                            child: Text(field,
                                textAlign: TextAlign.left,
                                style: TextStyle(color: color2, fontSize: 15)))
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //프로필 버튼
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/profile');
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
                                    backgroundColor: color1),
                                child: Text("프로필",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: color2, fontSize: 20)))),
                        //한 줄 소개 버튼
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/profile');
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
                                    backgroundColor: color1),
                                child: Text("한 줄 소개",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: color2, fontSize: 20)))),
                      ])
                ],
              ),
            ],
          ),
        ));
  }
}
