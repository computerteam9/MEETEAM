import 'package:flutter/material.dart';
import 'package:meetteam/Appbar/WriteAppbar.dart';

class ProjectWritePage extends StatefulWidget {
  ProjectWritePage({super.key});

  String projectTitle = _ProjectWritePageState().projectTitleController.text;
  String requiredCareer =
      _ProjectWritePageState().requiredCareerController.text;
  String workingTime = _ProjectWritePageState().workingTimeController.text;
  String personNumber = _ProjectWritePageState().personNumberController.text;
  String introduceProject =
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Flexible(
                //   fit: FlexFit.tight,
                //   flex: 10,
                //   child:
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
                // ),
                // const Spacer(flex: 1),
                // Flexible(
                // fit: FlexFit.tight,
                // flex: 10,
                // child:
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
          margin: const EdgeInsets.all(30),
          alignment: Alignment.centerLeft,
          child: const Icon(
            Icons.add,
            color: iconColor,
            size: 30,
          ),
          // const IconButton(
          //   icon: Icon(Icons.add, color:iconColor, size: 30),
          //   onPressed: () => {print("hi")},
          // ),
        ),
      ]),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
