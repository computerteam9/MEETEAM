import 'package:flutter/material.dart';
import 'package:meetteam/Appbar1.dart';
import 'package:meetteam/Color.dart';


class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectListPage();
}

class _ProjectListPage extends State<ProjectListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar2(key: UniqueKey(), appBar: AppBar()),
      body: Column(children: [
        Container(
            margin: const EdgeInsets.fromLTRB(50, 20, 50, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "확정 내역"),
                Column(children: [
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      height: 100,
                      decoration: BoxDecoration(
                          color: CustomColor.color3,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const ClipOval(
                            child: Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "프로젝트 명",
                                style:
                                TextStyle(fontSize: 15, color: Colors.white),
                              ),
                              Text(
                                "프로젝트 설명...",
                                style: TextStyle(
                                    height: 2, fontSize: 10, color: Colors.white),
                              ),
                              Text(
                                "오프라인, 매주 토요일 10시\n백엔드 1 , 디자이너 1,",
                                style:
                                TextStyle(fontSize: 8, color: Colors.white),
                              ),
                            ],
                          ),
                          const Text(
                            "진행중",
                            style: TextStyle(
                                height: 1.2,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          )
                        ],
                      )
                ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 100,
                    decoration: BoxDecoration(
                        color: CustomColor.color3,
                        borderRadius: BorderRadius.circular(20)),
                  ),
              ],),
            ],
            )
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    "신청 내역"),
                Column(children: [
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      height: 100,
                      decoration: BoxDecoration(
                          color: CustomColor.color3,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const ClipOval(
                            child: Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "프로젝트 명",
                                style:
                                TextStyle(fontSize: 15, color: Colors.white),
                              ),
                              Text(
                                "프로젝트 설명...",
                                style: TextStyle(
                                    height: 2, fontSize: 10, color: Colors.white),
                              ),
                              Text(
                                "오프라인, 매주 토요일 10시\n백엔드 1 , 디자이너 1,",
                                style:
                                TextStyle(fontSize: 8, color: Colors.white),
                              ),
                            ],
                          ),
                          const Text(
                            "D-7",
                            style: TextStyle(
                                height: 1.2,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          )
                        ],
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 100,
                    decoration: BoxDecoration(
                        color: CustomColor.color3,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 100,
                    decoration: BoxDecoration(
                        color: CustomColor.color3,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ],),
              ],
            )
        )
      ])
    );
  }
}
