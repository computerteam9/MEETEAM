import 'dart:math';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:meetteam/Appbar/main_appbar.dart';
import 'package:meetteam/Color.dart';
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

  @override
  void initState() {
    super.initState();
    String id = Session.get();
    List<String> projectId = [];
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

        String spec = user.spec[0].keys.first;

        await ProjectApi.getSameMinSpecId(spec).then((projects){
          if(projects.isEmpty){
            ProjectApi.getAllProjectIds().then((allProjectId){
              projectId = allProjectId;
            });
          }
          else {
            projectId = projects;
          }
            Random random = Random(DateTime
                .now()
                .minute);
            int randNum = random.nextInt(projectId.length);
            for(int i=0; i<3; i++) {
              setState(() {
                recommandId.add(projectId[randNum]);
              });
            }

        });
      });
    }
  }

  StatelessWidget getMyProjectWidget() {
    if (myProject != null) {
      Duration dDay = DateTime.now().difference(myProject!.deadline);
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
                          SizedBox(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/project');
                              },
                              child: const ProjectCard(
                                title: "프로젝트1",
                                description: "설명1",
                                nickname: "user1",
                                dDay: "3",
                              ),
                            ),
                          ),
                          SizedBox(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/project');
                              },
                              child: const ProjectCard(
                                title: "프로젝트2",
                                description: "설명2",
                                nickname: "user2",
                                dDay: "6",
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
