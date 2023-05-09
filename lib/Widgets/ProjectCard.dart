import 'package:flutter/material.dart';
import 'package:meetteam/Color.dart';
import 'package:flutter/cupertino.dart';

class ProjectCard extends StatelessWidget {
  String title;
  String description;
  String dDay;
  String nickname;
  ProjectCard(
      {required this.title,
      required this.description,
      required this.dDay,
      required this.nickname});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 360,
        margin: const EdgeInsets.fromLTRB(0, 10, 50, 10),
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
            color: CustomColor.color3, borderRadius: BorderRadius.circular(20)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const ClipOval(
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    Text(
                      nickname,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    Container(
                        height: 40,
                        width: 100,
                        margin: const EdgeInsets.only(top: 5),
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
