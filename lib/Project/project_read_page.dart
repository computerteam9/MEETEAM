import "package:flutter/material.dart";
import "package:meetteam/Appbar/normal_appbar.dart";
import "package:meetteam/Color.dart";
import "package:meetteam/Project/project_write_page.dart";

import "../Api/project_api.dart";
import "../Api/session.dart";
import "../Api/user_api.dart";

//리더 닉네임 설정
//온/오프라인
//장소(온/오프라인)
//모집인원 n명 설정 > 분야, 최소 경력, 필요 기술 작성하도록 함.

// 현재 상태
// applied: 신청한 상태
// created: 내가 만든 프로젝트
// none: 신청하지 않은 상태
enum Status { applied, created, none }

class ProjectReadPage extends StatefulWidget {
  ProjectReadPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectReadPage();
}

class _ProjectReadPage extends State<ProjectReadPage> {
  Status status = Status.applied;
  String bottomLabel = "";
  String projectId = "";
  String title = "";
  String description = "";
  int meetingWay = 0;
  String meetingTime = "";
  String leaderId = "";
  String leaderNickname = "";

  @override
  void initState() {
    super.initState();
    if (status == Status.applied) {
      bottomLabel = "지원 내역 확인";
    } else if (status == Status.created) {
      bottomLabel = "신청자 내역";
    } else {
      bottomLabel = "지원";
    }
    String id = Session.get();

    // UserApi.getUser(id).then((user) => {
    //       // projectId = user.project as String,
    //     });
    projectId = "q4oj64rKP4G8phj4lPQf";

    ProjectApi.getProject(projectId).then((project) {
      setState(() {
        title = project.title;
        description = project.description;
        meetingWay = project.meetingWay;
        leaderId = project.leaderId;
        meetingTime = project.meetingTime;
      });
    });

    // UserApi.getUser(leaderId).then((user) => {
    //       leaderNickname = user.nickname,
    //     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
      bottomNavigationBar: SizedBox(
          height: 60,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.color3, // Background color
              ),
              child: Text("신청자 내역",
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, '/userList');
              })),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              description,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Text(
            //프로젝트 설명
            ProjectWritePage.introduceProject,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            alignment: Alignment.topLeft,
            child: const Text(
              "리더",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: 50,
                width: 50,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  height: 50,
                  width: 100,
                  alignment: Alignment.topLeft,
                  child: Text(leaderNickname)), // 닉네임
              Container(
                margin: EdgeInsets.only(left: 100),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/userCheck');
                  },
                  child: Text("프로필"),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: CustomColor.color3),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            alignment: Alignment.topLeft,
            child: const Text(
              "모임",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 30,
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      meetingWay == 1
                          ? '온라인'
                          : meetingWay == 2
                              ? '오프라인'
                              : meetingWay == 3
                                  ? '온오프라인'
                                  : '',
                    ),
                    Text(
                      meetingTime,
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
                Text(ProjectWritePage.workingTime) //기간
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              "모집 인원",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  height: 50,
                  width: 80,
                  alignment: Alignment.topLeft,
                  child: Text("백엔드")),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                height: 60,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Text("최소 경력"),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                          height: 20,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: CustomColor.color1,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Text(
                            "3년",
                            style: TextStyle(color: CustomColor.color3),
                          ),
                        )
                      ],
                    )),
                    Container(
                        child: Column(
                      children: [
                        const Text("필요 기술"),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                        )
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  height: 50,
                  width: 80,
                  alignment: Alignment.topLeft,
                  child: Text("프론트엔드")),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                height: 60,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Text("최소 경력"),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          height: 20,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: CustomColor.color1,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Text(
                            "5년",
                            style: TextStyle(color: CustomColor.color3),
                          ),
                        )
                      ],
                    )),
                    Column(
                      children: [
                        const Text("필요 기술"),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
