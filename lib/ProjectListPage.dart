import 'package:flutter/material.dart';
import 'package:meetteam/Appbar/NormalAppbar.dart';
import 'package:meetteam/Color.dart';
import 'Widgets/ProjectBox.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectListPage();
}

class _ProjectListPage extends State<ProjectListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: SingleChildScrollView(
          child: ListBody(children: [
            Container(
                margin: const EdgeInsets.fromLTRB(50, 20, 50, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("확정 내역"),
                    Column(
                      children: const [
                        ProjectBox(
                          title: "프로젝트 1",
                          description: "프로젝트 설명...",
                          tag: "오프라인, 백엔드 1, 디자이너1, ...",
                          dDay: "진행중",
                        ),
                        ProjectBox(
                          title: "프로젝트 2",
                          description: "프로젝트 설명...",
                          tag: "오프라인, 백엔드 1, 디자이너1, ...",
                          dDay: "진행중",
                        ),
                        ProjectBox(
                          title: "프로젝트 3",
                          description: "프로젝트 설명...",
                          tag: "오프라인, 백엔드 1, 디자이너1, ...",
                          dDay: "진행중",
                        ),
                      ],
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("신청 내역"),
                    Column(
                      children: const [
                        ProjectBox(
                          title: "프로젝트 1",
                          description: "프로젝트 설명...",
                          tag: "오프라인, 백엔드 1, 디자이너1, ...",
                          dDay: "D-7",
                          color: CustomColor.color1,
                        ),
                        ProjectBox(
                          title: "프로젝트 2",
                          description: "프로젝트 설명...",
                          tag: "오프라인, 백엔드 1, 디자이너1, ...",
                          dDay: "D-2",
                          color: CustomColor.color1,
                        ),
                        ProjectBox(
                          title: "프로젝트 3",
                          description: "프로젝트 설명...",
                          tag: "오프라인, 백엔드 1, 디자이너1, ...",
                          dDay: "D-5",
                          color: CustomColor.color1,
                        ),
                        ProjectBox(
                          title: "프로젝트 4",
                          description: "프로젝트 설명...",
                          tag: "오프라인, 백엔드 1, 디자이너1, ...",
                          dDay: "D-4",
                          color: CustomColor.color1,
                        ),
                      ],
                    ),
                  ],
                ))
          ])
        )
    );
  }
}
