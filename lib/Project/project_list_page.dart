import 'package:flutter/material.dart';
import 'package:meetteam/Appbar/normal_appbar.dart';
import 'package:meetteam/Color.dart';
import '../Api/project_api.dart';
import '../Api/session.dart';
import '../Api/user_api.dart';
import '../Model/project.dart';
import '../Widgets/project_box.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectListPage();
}

class _ProjectListPage extends State<ProjectListPage> {
  List<Project> leaderProjects = [];
  List<Project> memberProjects = [];

  @override
  void initState() {
    super.initState();
    String id = Session.get();
    if (id != "") {
      UserApi.getUser(id).then((user) async {
        Map<String, List<String>> projects = user.project;

        if (projects["leader"]?.isNotEmpty == true) {
          for (String projectId in projects["leader"]!) {
            await ProjectApi.getProject(projectId).then((project) {
              setState(() => leaderProjects.add(project));
            });
          }
        }

        if (projects["member"]?.isNotEmpty == true) {
          for (String projectId in projects["member"]!) {
            await ProjectApi.getProject(projectId).then((project) {
              setState(() => memberProjects.add(project));
            });
          }
        }
      });
    }
  }

  List<Widget> getProjectWidgets(List<Project> projects) {
    List<Widget> projectWidgets = [];

    if (projects.isEmpty) {
      return [
        const Text(
          "\n프로젝트가 없습니다.",
        ),
      ];
    }

    for (Project project in projects) {
      Duration dDay = DateTime.now().difference(project.deadline);
      List<String> tags = [];

      for (var item in project.minSpec) {
        tags.add(item.keys.first);
      }

      projectWidgets.add(
        ProjectBox(
          title: project.title,
          description: project.description,
          tag: tags.join(", ") + ' 개발자 모집중',
          dDay: dDay.inDays.toString(),
          color: CustomColor.color1,
        ),
      );
    }

    return projectWidgets;
  }

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
                    const Text("모집 내역"),
                    Column(
                      children: getProjectWidgets(leaderProjects),
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(50, 0, 50, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("참가 내역"),
                    Column(
                      children: getProjectWidgets(memberProjects),
                    ),
                  ],
                ))
          ])
        )
    );
  }

}
