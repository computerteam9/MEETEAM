import "package:flutter/material.dart";
import 'package:meetteam/Appbar/edit_appbar.dart';
import 'package:meetteam/Profile/profile_write_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:meetteam/Api/user_api.dart';
import 'package:meetteam/Api/session.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  static const color1 = Color(0xff5dbaf4);
  static const iconColor = Colors.black;

  final String sort = ProfileWrite.selectedSort;
  final String field = ProfileWrite.selectedField;
  final String link = "";
  static String nickname = "";
  static String blogUrl = "";
  static String introduction = "";
  List<Map<String, int>> spec = <Map<String, int>>[];
  List<String> interest = <String>[];

  Future<void> _urllaunch() async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }

  void pageLaunch() async {
    String id = Session.get();

    await UserApi.getUser(id).then((user) => {
          nickname = user.nickname, //닉네임
          blogUrl = user.blogUrl, //블로그
          introduction = user.introduction, //자기소개
          spec = user.spec, //활동 내역
          interest = user.interest, //관심사
        });
  }

  @override
  Widget build(BuildContext context) {
    pageLaunch();
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
              Text(nickname),
              SizedBox(height: 30.0),
              TextButton(
                onPressed: _urllaunch,
                child: Text(blogUrl),
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
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(introduction),
                  ),
                ],
              ),
            ]),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "활동 내역",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: spec.map((item) {
                    String stringValue = item.keys.first;
                    int intValue = item.values.first;
                    return Text('$stringValue ($intValue 년)');
                  }).toList(),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "관심사",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ), //활동내역
          Wrap(
            children: [
              for (String label in interest)
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0),
                    border: Border.all(color: color1),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: color1,
                      fontSize: 14.0,
                    ),
                  ),
                ),
            ],
          )
        ]));
  }
}
