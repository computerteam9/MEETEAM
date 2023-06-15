import 'package:flutter/material.dart';
import 'package:meetteam/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:meetteam/Api/project_api.dart';
import 'package:meetteam/Api/user_api.dart';

class ProjectCard extends StatefulWidget {
  final String id;

  const ProjectCard({
    super.key,
    required this.id,
  });

  @override
  State<StatefulWidget> createState() => ProjectCardState(id);
}

class ProjectCardState extends State<ProjectCard> {
  static String title = '';
  static String nickname = '';
  static String dDay = '';
  static String description = '';

  ProjectCardState(String id) {
    ProjectApi.getProject(id).then((project) {
      UserApi.getUser(project.leaderId).then((user) {
        setState(() {
          title = project.title;
          dDay = project.deadline.difference(DateTime.now()).toString();
          description = project.description;
          nickname = user.nickname;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 360,
        margin: const EdgeInsets.fromLTRB(0, 25, 0, 10),
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
            color: CustomColor.color3, borderRadius: BorderRadius.circular(20)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const ClipOval(
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                      width: 80,
                      child: Text(
                        nickname,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                        height: 40,
                        width: 100,
                        margin: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                        decoration: BoxDecoration(
                            color: CupertinoColors.systemGrey3,
                            borderRadius: BorderRadius.circular(37)),
                        child: Text("D-$dDay",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                            textAlign: TextAlign.center)),
                  ]),
              Container(
                height: 180,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration:
                    const BoxDecoration(color: CupertinoColors.systemGrey3),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        Text(
                          description,
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        )
                      ])),
            ]));
  }
}
