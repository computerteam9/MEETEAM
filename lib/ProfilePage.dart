import "package:flutter/material.dart";
import 'package:meetteam/Appbar/EditAppbar.dart';

class ProfilePage extends StatelessWidget {
  static const color1 = Color(0xff5dbaf4);
  static const iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: Column(children: [
          Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [Text("프로필")]),
                  ])),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.account_circle, size: 100),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "닉네임",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "전문 분야",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "거주 지역",
                        style: TextStyle(fontSize: 15),
                      )
                    ])
              ]),
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "http://www.naver.blog.com",
                    style: TextStyle(fontSize: 15),
                  )
                ]),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            // 경력
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("경력")]),
          ),
          //경력 표시되는 상자
          Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              child: Text(
                  "작열하는 사막에 있는 수상한 남자는 탈취한 보물을 바위 뒤에 숨겨 놓았는데 누군가가 그것을 훔쳐갔다고 화를 내고 있었다.",
                  style: TextStyle(fontSize: 20)),
              height: 140,
              width: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: color1, width: 10))),
          Container(
            margin: const EdgeInsets.all(20),
            // 활동내역
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("활동내역")]),
          ),
          //경력 표시되는 상자
          Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              child: Text(
                  "작열하는 사막에 있는 수상한 남자는 탈취한 보물을 바위 뒤에 숨겨 놓았는데 누군가가 그것을 훔쳐갔다고 화를 내고 있었다.",
                  style: TextStyle(fontSize: 20)),
              height: 140,
              width: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: color1, width: 10))),
        ]));
  }
}
