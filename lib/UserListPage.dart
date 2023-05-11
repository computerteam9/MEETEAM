import "package:flutter/material.dart";
import 'package:meetteam/Appbar/NormalAppbar.dart';

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
              //각 신청자별 상자-1
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/UserCheckPage');
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, '/', (_) => false);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => UserCheckPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(10),
                    height: 100,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  //닉네임
                                  Container(
                                      margin: EdgeInsets.only(top: 5, left: 10),
                                      width: 60,
                                      child: Text("닉네임",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: color2, fontSize: 20))),
                                  //지원 분야
                                  Container(
                                      margin: EdgeInsets.only(top: 5, left: 5),
                                      width: 100,
                                      child: Text("지원 분야",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: color2, fontSize: 15)))
                                ]),
                            // 한 줄 소개 부분
                            Container(
                                margin: EdgeInsets.only(top: 5, left: 10),
                                width: 170,
                                child: Text("한 줄 소개",
                                    textAlign: TextAlign.left,
                                    style:
                                        TextStyle(color: color2, fontSize: 20)))
                          ],
                        ),
                      ],
                    ),
                  )),
              //각 신청자별 상자-2
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                height: 100,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              //닉네임
                              Container(
                                  margin: EdgeInsets.only(top: 5, left: 10),
                                  width: 60,
                                  child: Text("닉네임",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: color2, fontSize: 20))),
                              //지원 분야
                              Container(
                                  margin: EdgeInsets.only(top: 5, left: 5),
                                  width: 100,
                                  child: Text("지원 분야",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: color2, fontSize: 15)))
                            ]),
                        // 한 줄 소개 부분
                        Container(
                            margin: EdgeInsets.only(top: 5, left: 10),
                            width: 170,
                            child: Text("한 줄 소개",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: color2, fontSize: 20)))
                      ],
                    ),
                    Icon(Icons.military_tech, size: 60, color: Colors.yellow)
                  ],
                ),
              ),
              //각 신청자별 상자-3
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                height: 100,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              //닉네임
                              Container(
                                  margin: EdgeInsets.only(top: 5, left: 10),
                                  width: 60,
                                  child: Text("닉네임",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: color2, fontSize: 20))),
                              //지원 분야
                              Container(
                                  margin: EdgeInsets.only(top: 5, left: 5),
                                  width: 100,
                                  child: Text("지원 분야",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: color2, fontSize: 15)))
                            ]),
                        // 한 줄 소개 부분
                        Container(
                            margin: EdgeInsets.only(top: 5, left: 10),
                            width: 170,
                            child: Text("한 줄 소개",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: color2, fontSize: 20)))
                      ],
                    ),
                    Icon(Icons.military_tech, size: 60, color: Colors.yellow)
                  ],
                ),
              ),
              //각 신청자별 상자-4
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                height: 100,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              //닉네임
                              Container(
                                  margin: EdgeInsets.only(top: 5, left: 10),
                                  width: 60,
                                  child: Text("닉네임",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: color2, fontSize: 20))),
                              //지원 분야
                              Container(
                                  margin: EdgeInsets.only(top: 5, left: 5),
                                  width: 100,
                                  child: Text("지원 분야",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: color2, fontSize: 15)))
                            ]),
                        // 한 줄 소개 부분
                        Container(
                            margin: EdgeInsets.only(top: 5, left: 10),
                            width: 170,
                            child: Text("한 줄 소개",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: color2, fontSize: 20)))
                      ],
                    ),
                  ],
                ),
              ),
              //각 신청자별 상자-5
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                height: 100,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              //닉네임
                              Container(
                                  margin: EdgeInsets.only(top: 5, left: 10),
                                  width: 60,
                                  child: Text("닉네임",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: color2, fontSize: 20))),
                              //지원 분야
                              Container(
                                  margin: EdgeInsets.only(top: 5, left: 5),
                                  width: 100,
                                  child: Text("지원 분야",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: color2, fontSize: 15)))
                            ]),
                        // 한 줄 소개 부분
                        Container(
                            margin: EdgeInsets.only(top: 5, left: 10),
                            width: 170,
                            child: Text("한 줄 소개",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: color2, fontSize: 20)))
                      ],
                    ),
                  ],
                ),
              ),
              //각 신청자별 상자-6
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                height: 100,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              //닉네임
                              Container(
                                  margin: EdgeInsets.only(top: 5, left: 10),
                                  width: 60,
                                  child: Text("닉네임",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: color2, fontSize: 20))),
                              //지원 분야
                              Container(
                                  margin: EdgeInsets.only(top: 5, left: 5),
                                  width: 100,
                                  child: Text("지원 분야",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: color2, fontSize: 15)))
                            ]),
                        // 한 줄 소개 부분
                        Container(
                            margin: EdgeInsets.only(top: 5, left: 10),
                            width: 170,
                            child: Text("한 줄 소개",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: color2, fontSize: 20)))
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (_) => false);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserCheckPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(10),
                    height: 100,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  //닉네임
                                  Container(
                                      margin: EdgeInsets.only(top: 5, left: 10),
                                      width: 60,
                                      child: Text("닉네임",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: color2, fontSize: 20))),
                                  //지원 분야
                                  Container(
                                      margin: EdgeInsets.only(top: 5, left: 5),
                                      width: 100,
                                      child: Text("지원 분야",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: color2, fontSize: 15)))
                                ]),
                            // 한 줄 소개 부분
                            Container(
                                margin: EdgeInsets.only(top: 5, left: 10),
                                width: 170,
                                child: Text("한 줄 소개",
                                    textAlign: TextAlign.left,
                                    style:
                                        TextStyle(color: color2, fontSize: 20)))
                          ],
                        ),
                      ],
                    ),
                  ))
            ]))
          ],
        ));
  }
}
