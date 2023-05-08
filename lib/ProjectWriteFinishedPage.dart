import "package:flutter/material.dart";
import "package:meetteam/Appbar/NormalAppbar.dart";
import "package:meetteam/Color.dart";
import "package:meetteam/UserCheckPage.dart";

class ProjectWriteFinishedPage extends StatefulWidget {
  const ProjectWriteFinishedPage({super.key});

  @override
  State<StatefulWidget> createState() => ProjectWriteFinishedPageState();

}

class ProjectWriteFinishedPageState extends State<ProjectWriteFinishedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
      bottomNavigationBar: Container(
        height: 60,
        color: CustomColor.color3,
        alignment: Alignment.center,
        child:
        const Text(
          "확인",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: const Center(
        child:
        Text(
          "작성이 완료되었습니다.",
          style: TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}