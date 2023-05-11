import "package:flutter/material.dart";
import 'package:meetteam/Appbar/edit_appbar.dart';
import 'package:meetteam/Profile/profile_write_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  static const color1 = Color(0xff5dbaf4);
  static const iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: Column(children: [
          Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "프로필",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ])),
          Row(children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Icon(Icons.account_circle, size: 100),
            ),
            SizedBox(
              width: 30.0,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
                Widget>[
              Row(
                children: [
                  Text(
                    "닉네임",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(ProfileWrite.nicknameController.text),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    "전문분야",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(ProfileWrite.fieldController.text),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    "거주지역",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(ProfileWrite.areaController.text),
                ],
              ),
            ])
          ]),
          SizedBox(
            height: 40.0,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              children: [
                Text(
                  "블로그",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20.0,
                ),
                TextButton(
                  onPressed: () async {
                    //가져온 링크로 연결
                    final url = Uri.parse(ProfileWrite.blogController.text);
                    if (await canLaunchUrl(url)) {
                      launchUrl(url);
                    }
                  },
                  child: Text(ProfileWrite.blogController.text),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "경력",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              child: Text(ProfileWrite.careerController.text),
              height: 140,
              width: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: color1, width: 5))),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            // 활동내역
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "활동내역",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          //경력 표시되는 상자
          Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              child: Text(ProfileWrite.activityController.text),
              height: 140,
              width: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: color1, width: 5))),
        ]));
  }
}
