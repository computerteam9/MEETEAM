import "package:flutter/material.dart";
import 'package:meetteam/Appbar/normal_appbar.dart';
import 'package:meetteam/Api/user_api.dart';
import 'package:meetteam/Api/session.dart';
import '../Model/user.dart';

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
  static const List<String> sortList = ["선택", "Java", "C", "C++", "Python"];
  static const List<String> fieldList = [
    "선택",
    "1년 미만",
    "1년차",
    "2년차",
    "3년차",
    "4년차",
    "5년차 이상",
  ];

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
  static final TextEditingController introduceController =
      TextEditingController();
  static final TextEditingController careerController = TextEditingController();
  static final TextEditingController activityController =
      TextEditingController();
  static final TextEditingController blogUrlController =
      TextEditingController();

  //선택된 Tag 내용만을 넘겨주는 메서드
  List<String> getSelectedTag(List<String> tagList, List<bool> isTagSelected) {
    List<String> resultList = [];

    for (int i = 0; i < isTagSelected.length; i++) {
      if (isTagSelected[i]) {
        resultList.add(tagList[i]);
      }
    }
    return resultList;
  }

  List<Map<String, int>> getSelectedSpec(
      String selectedSorted, int selectedFieldIndex) {
    List<Map<String, int>> specList = [];
    specList.add({selectedSorted: selectedFieldIndex});
    return specList;
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProfileWritePageArguments;

    return Scaffold(
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: SingleChildScrollView(
            child: Column(children: [
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
          Row(children: [
            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Icon(Icons.account_circle, size: 100),
            ),
            Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: nicknameController,
                    decoration: InputDecoration(
                      labelText: '닉네임',
                    ),
                    // textAlign: TextAlign.left,
                    // style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: blogUrlController,
                    decoration: InputDecoration(
                      labelText: '블로그',
                    ),
                  ),
                ],
              ),
            ),
          ]),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "자기소개",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: TextField(
                controller: introduceController,
                minLines: 1,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: '자기소개',
                )),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "활동내역",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                ],
              ),
              Container(
                child: TextField(
                    controller: activityController,
                    minLines: 1,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: '기타',
                    )),
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "관심사",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
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
                          constraints: const BoxConstraints(minHeight: 30.0),
                          isSelected: [isTagSelected[i]],
                          onPressed: (index) {
                            setState(() {
                              isTagSelected[i] = !isTagSelected[i];
                            });
                          },
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Text(tagList[i]))
                          ]),
                  ])),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            child: Text("저장"),
            onPressed: () {
              String id = Session.get();

              UserApi.getUser(id).then((user) {
                UserApi.updateUser(
                  id,
                  user.email,
                  user.password,
                  nicknameController.text,
                  introduceController.text,
                  blogUrlController.text, //blog
                  getSelectedSpec(
                      selectedSort, fieldList.indexOf(selectedField)), //spec
                  getSelectedTag(tagList, isTagSelected), //interest 관심사
                  user.project,
                );

                // 처음 회원가입을 하는 경우
                if (args.isSignUp == true) {
                  // 모든 위젯 삭제하고 메인 페이지로 이동
                  Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
                }
                // 프로필 수정하는 경우
                else {
                  //프로필 보는 페이지로 이동
                  Navigator.pop(context);
                }
              });
            },
          ),
        ])));
  }
}
