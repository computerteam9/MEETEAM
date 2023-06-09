import 'dart:math';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:meetteam/Appbar/main_appbar.dart';
import 'package:meetteam/Color.dart';
import 'package:meetteam/Model/user.dart';
import 'package:meetteam/Widgets/project_card.dart';
import 'package:meetteam/Widgets/project_box.dart';
import 'package:meetteam/Api/session.dart';
import 'package:meetteam/Api/user_api.dart';
import 'Api/project_api.dart';
import 'Model/project.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  static Project? myProject = null;
  static List<String> recommandId = [];
  static List<String> titleList = [];
  static List<String> nicknameList = [];
  static List<String> dDayList = [];
  static List<String> descriptionList = [];

  @override
  void initState() {
    super.initState();

    String id = Session.get();

    if (id != "") {
      UserApi.getUser(id).then((user) async {
        Map<String, List<String>> projects = user.project;

        if (projects["member"]?.isNotEmpty == true) {
          await ProjectApi.getProject(projects["member"]![0]).then((project) {
            setState(() => myProject = project);
          });
        }

        if (projects["leader"]?.isNotEmpty == true) {
          await ProjectApi.getProject(projects["leader"]![0]).then((project) {
            setState(() => myProject = project);
          });
        }

        String field = user.spec[0].keys.first;
        int career = user.spec[0].values.first;

        ProjectApi.getSameMinSpecId(field, career).then((recProjectId) async {
          ProjectApi.getAllProjectIds().then((allProjectId) {
            // 추천 id 추가
            Random random = Random(DateTime.now().minute % 100);

            while (recommandId.length < 3) {
              String recId = '';
              if (recProjectId.isNotEmpty) {
                int randNum = random.nextInt(recProjectId.length);
                if (recommandId.contains(recProjectId[randNum])) {
                  continue;
                }
                recId = recProjectId[randNum];
                print("추천 id 중 : ${recProjectId[randNum]}");
                recProjectId.remove(recProjectId[randNum]);
              } else if (allProjectId.isNotEmpty) {
                int randNum = random.nextInt(allProjectId.length);
                if (recommandId.contains(allProjectId[randNum])) {
                  continue;
                }
                recId = allProjectId[randNum];
                print("모든 id 중 : ${allProjectId[randNum]}");
                allProjectId.remove(allProjectId[randNum]);
              }
              if (recId != '') {
                setState(() {
                  recommandId.add(recId);
                  ProjectApi.getProject(recId).then((project) {
                    UserApi.getUser(project.leaderId).then((user) {
                      setState(() {
                        titleList.add(project.title);
                        nicknameList.add(user.nickname);
                        dDayList.add(project.deadline
                            .difference(DateTime.now()).inDays
                            .toString());
                        descriptionList.add(project.description);
                      });
                    });
                  });
                });
                print("now : "  + DateTime.now().toString());
              }
            }
          });
        });
      });
    }
  }

  StatelessWidget getMyProjectWidget() {
    if (myProject != null) {
      Duration dDay = myProject!.deadline.difference(DateTime.now());
      List<String> tags = [];

      for (var item in myProject!.minSpec) {
        tags.add(item.keys.first);
      }

      return ProjectBox(
        title: myProject!.title,
        description: myProject!.description,
        tag: tags.join(", ") + ' 개발자 모집중',
        dDay: dDay.inDays.toString(),
        color: CustomColor.color1,
      );
    }

    return const Text("프로젝트가 없습니다.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: Column(children: [
          Container(
              margin: const EdgeInsets.fromLTRB(50, 20, 50, 10),
              child: Column(children: [
                // 내 프로젝트 상단 라벨
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "내 프로젝트",
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/projects');
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ]),
                // 내 프로젝트
                getMyProjectWidget(),
              ])),
          Stack(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(50, 20, 50, 100),
                  // 추천 프로젝트 상단 라벨
                  child: Column(children: [
                    Row(
                      children: const [
                        Text(
                          "추천",
                        )
                      ],
                    ),
                    // 추천 프로젝트 리스트
                    CarouselSlider(
                        items: [
                          for (int i = 0; i < descriptionList.length; i++)
                            SizedBox(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/project');
                                },
                                child: ProjectCard(
                                  title: titleList[i],
                                  nickname: nicknameList[i],
                                  dDay: dDayList[i],
                                  description: descriptionList[i],
                                ),
                              ),
                            ),
                        ],
                        options: CarouselOptions(
                          height: 380.0,
                          enlargeCenterPage: false,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 1,
                        )),
                  ])),
              Positioned(
                bottom: 20,
                right: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/projectWrite');
                  },
                  backgroundColor: CupertinoColors.systemGrey3,
                  child: const Icon(
                    Icons.create,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )
        ]));
  }
}
