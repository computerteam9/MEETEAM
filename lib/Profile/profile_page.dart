import "package:flutter/material.dart";
import 'package:meetteam/Appbar/edit_appbar.dart';
import 'package:meetteam/Profile/profile_write_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  static const color1 = Color(0xff5dbaf4);
  static const iconColor = Colors.black;

  final String sort = ProfileWrite.selectedSort;
  final String field = ProfileWrite.selectedField;
  final String link = "";

  Future<void> _urllaunch() async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: Column(children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "프로필",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ])),
          Row(//mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 10, 0),
              child: Icon(Icons.account_circle, size: 100),
            ),
            SizedBox(
              width: 30.0,
            ),
            Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "닉네임",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "블로그",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
            SizedBox(width: 30.0),
            Column(children: [
              Text(ProfileWrite.nicknameController.text),
              SizedBox(height: 30.0),
              TextButton(
                onPressed: _urllaunch,
                child: Text("url"),
              ),
            ])
          ]),
          SizedBox(
            height: 30.0,
          ),

          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "자기소개",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ), //자기소개
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(ProfileWrite.introduceController.text),
                    height: 120,
                    width: 400,
                  ),
                ],
              ),
            ]),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "활동내역",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ), //활동내역
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    sort == '선택' ? '' : sort,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    field == '선택' ? '' : field,
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(ProfileWrite.activityController.text),
                    height: 140,
                    width: 400,
                  ),
                ],
              ),
            ]),
          ),
        ]));
  }
}
