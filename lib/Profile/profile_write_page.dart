import "package:flutter/material.dart";
import 'package:meetteam/Appbar/normal_appbar.dart';

class ProfileWritePageArguments {
  final bool isSignUp;

  ProfileWritePageArguments(this.isSignUp);
}

class ProfileWritePage extends StatefulWidget {
  const ProfileWritePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfileWrite();
}

class ProfileWrite extends State<ProfileWritePage> {
  static const color1 = Color(0xff5dbaf4);
  static const List<String> tagList = [

    "백엔드",
    "프론트엔드",
    "안드로이드",
    "IOS",
    "웹",
    "AI",
    "게임",
    "데이터베이스",
    "디자인",
    "기타"
  ];
  static const List<String> sortList = ["tech", "Java", "C", "C++", "Python"];
  static const List<String> fieldList = ["career", "1년 이하", "1~3년", "3~5년", "5년 이상"];

  static String selectedSort = sortList[0];
  static String selectedField = fieldList[0];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedSort = sortList[0];
    selectedField = fieldList[0];
  }

  static List<bool> isTagSelected = List.filled(tagList.length, false);

  static final TextEditingController nicknameController =
      TextEditingController();
  static final TextEditingController fieldController = TextEditingController();
  static final TextEditingController areaController = TextEditingController();
  static final TextEditingController blogController = TextEditingController();
  static final TextEditingController careerController = TextEditingController();
  static final TextEditingController activityController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProfileWritePageArguments;

    return Scaffold(
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: SingleChildScrollView(
            child: Column(children: [
                Container(
                    padding: const EdgeInsets.all(10),
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
                    margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Icon(Icons.account_circle, size: 100),
                  ),
                  Column(children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                      width: 200,
                      child: TextFormField(
                          controller: nicknameController,
                          decoration: InputDecoration(
                            labelText: '닉네임',
                          )),
                    ),

                  ])
                ]),
      //블로그 입력
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: 400,
                  child: TextFormField(
                      controller: blogController,
                      minLines: 1,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: '블로그',
                      )),
                ),
                SizedBox(
                  height: 10.0,
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: 400,
                  child: TextField(
                      controller: activityController,
                      minLines: 1,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: '자기소개',
                      )),
                ),
                SizedBox(
                  height: 11.0,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "활동내역",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
                SizedBox(
                  height: 20.0,
                ),
              Container(
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton<String>(
                          value: selectedSort,
                          items: [
                            for (int i = 0; i < sortList.length; i++)
                              DropdownMenuItem<String>(
                                  value: sortList[i], child: Text(sortList[i]))
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedSort = value!;
                            });
                          }),
                      SizedBox(
                        width: 20.0,
                      ),
                      DropdownButton<String>(
                          value: selectedField,
                          items: [
                            for (int i = 0; i < fieldList.length; i++)
                              DropdownMenuItem<String>(
                                  value: fieldList[i], child: Text(fieldList[i]))
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedField = value!;
                            });
                          }),
                      SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        width: 180,
                        child: TextField(
                            controller: activityController,
                            minLines: 1,
                            maxLines: 3,
                            decoration: InputDecoration(
                              labelText: '기타',
                            )),
                      ),
                    ],
                  )),
                SizedBox(
                  height: 30.0,
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "관심사",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
                SizedBox(
                  height: 20.0,
                ),

                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        spacing: 10,
                        children: [
                          // ToggleButtons 반복 생성
                          for (int i = 0; i < tagList.length; i++)
                            ToggleButtons(
                                color: Colors.black.withOpacity(0.60),
                                selectedColor: color1,
                                selectedBorderColor: color1,
                                fillColor: color1.withOpacity(0.08),
                                splashColor: color1.withOpacity(0.12),
                                hoverColor: color1.withOpacity(0.04),
                                borderRadius: BorderRadius.circular(4.0),
                                constraints: const BoxConstraints(minHeight: 36.0),
                                isSelected: [isTagSelected[i]],
                                onPressed: (index) {
                                  setState(() {
                                    isTagSelected[i] = !isTagSelected[i];
                                  });
                                },
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, ),
                                      child: Text(tagList[i]))
                                ]),
                        ])),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  child: Text("저장"),
                  onPressed: () {
                    // 처음 회원가입 하는 경우
                    if (args.isSignUp == true)
                    {
                    // 모든 위젯 삭제하고 메인 페이지로 이동
                    Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
                    }
                    // 프로필 수정하는 경우
                    else
                    {
                      // 프로필 보는 페이지로 이동
                      Navigator.pop(context);
                    }
            },
          ),
        ])));
  }
}
