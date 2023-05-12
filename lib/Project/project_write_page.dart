import 'package:flutter/material.dart';
import 'package:meetteam/Appbar/normal_appbar.dart';

class ProjectWritePage extends StatefulWidget {
  ProjectWritePage({super.key});

  static String projectTitle = _ProjectWritePageState().projectTitleController.text;
  static String requiredCareer =
      _ProjectWritePageState().requiredCareerController.text;
  static String workingTime = _ProjectWritePageState().workingTimeController.text;
  static String personNumber = _ProjectWritePageState().personNumberController.text;
  static String introduceProject =
      _ProjectWritePageState().introduceProjectController.text;

  @override
  State<StatefulWidget> createState() => _ProjectWritePageState();
}

class _ProjectWritePageState extends State<ProjectWritePage> {
  TextEditingController projectTitleController = TextEditingController();
  TextEditingController requiredCareerController = TextEditingController();
  TextEditingController workingTimeController = TextEditingController();
  TextEditingController personNumberController = TextEditingController();
  TextEditingController introduceProjectController = TextEditingController();

  static const iconColor = Colors.black;

  List imageList = [];
  List fileList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "프로젝트 제목",
                    ),
                    textAlign: TextAlign.start,
                    controller: projectTitleController,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "경력",
                    ),
                    textAlign: TextAlign.start,
                    controller: requiredCareerController,
                    minLines: 1,
                    maxLines: 3,
                  ),
                  // ),
                ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 10,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "기간",
                      ),
                      textAlign: TextAlign.start,
                      controller: workingTimeController,
                    ),
                  ),
                  const Spacer(flex: 1),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 10,
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "인원"),
                      textAlign: TextAlign.start,
                      controller: personNumberController,
                    ),
                  ),
                ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "프로젝트 내용",
              ),
              textAlign: TextAlign.start,
              controller: introduceProjectController,
              minLines: 1,
              maxLines: 3,
            ),
          ),
          Container(
            //여기에 업로드된 파일 리스트
              child:(() {
                if (fileList.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        //파일 불러올 수 있게 만드는 공간 만듬
                      );
                    },
                  );
                }
                else {
                }
              })()
          ),
          Container(
            //여기에 업로드된 파일 리스트
          ),
          Container(
            margin: const EdgeInsets.all(30),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.image, color:iconColor, size: 30),
                    onPressed: () {
                      //imageList에 요소 추가하기
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.file_upload, color: iconColor, size: 30),
                    onPressed: () {
                      //fileList에 요소 추가하기

                    },
                  )
            ]),
          ),
        ElevatedButton(
          child: Text("저장"),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/project');
          },
        ),
      ]),
      )
    );
  }
}
