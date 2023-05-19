import 'package:flutter/material.dart';
import 'package:meetteam/Appbar/normal_appbar.dart';

class ApplicantInfo {
  String field = "";
  String career = "";
  String tech = "";

  ApplicantInfo(
      {required this.field, required this.career, required this.tech});
}

class ProjectWritePage extends StatefulWidget {
  const ProjectWritePage({super.key});

  static String projectTitle =
      _ProjectWritePageState().projectTitleController.text;
  static String workingTime =
      _ProjectWritePageState().workingTimeController.text;
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
  static const meetingWay = ["만남 방식", "온라인", "오프라인"];
  static const applicantLabel = [
    ["분야 선택", "개발", "디자인", "기획", "기타"],
    ["경력 선택", "신입", "경력", "무관"],
    ["기술 선택", "Java", "Python", "JavaScript", "Go", "기타"]
  ];

  List imageList = [];
  List fileList = [];
  List selectedApplicantInfo = [
    [
      "분야 선택",
      "경력 선택",
      "기술 선택",
    ]
  ];
  String selectedMeetingWay = meetingWay[0];
  String meetingTime = "";

  String startPeriod = "";
  String endPeriod = "";

  void addApplicantInputField() {
    // 최대 5명까지 추가 가능
    if (selectedApplicantInfo.length < 5) {
      setState(() {
        selectedApplicantInfo.add([
          "분야 선택",
          "경력 선택",
          "기술 선택",
        ]);
      });
    }
  }

  void removeApplicantInputField() {
    // 최소 1명까지 삭제 가능
    if (selectedApplicantInfo.length > 1) {
      setState(() {
        selectedApplicantInfo.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
          child:
              Wrap(runSpacing: 10, alignment: WrapAlignment.center, children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
            ]),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "프로젝트 내용",
              ),
              textAlign: TextAlign.start,
              controller: introduceProjectController,
              minLines: 1,
              maxLines: 3,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              DropdownButton<String>(
                value: selectedMeetingWay,
                onChanged: (value) {
                  setState(() {
                    selectedMeetingWay = value!;
                  });
                },
                items: [
                  for (int i = 0; i < meetingWay.length; i++)
                    DropdownMenuItem<String>(
                      value: meetingWay[i],
                      child: Text(meetingWay[i]),
                    ),
                ],
              ),
              Expanded(
                  child: TextField(
                decoration: const InputDecoration(
                  labelText: '만남 시간',
                ),
                onChanged: (value) {
                  setState(() {
                    meetingTime = value;
                  });
                },
              )),
            ]),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      labelText: '시작 날짜', hintText: 'mm/dd/yyyy'),
                  onChanged: (value) => setState(() {
                    startPeriod = value;
                  }),
                )),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      labelText: '마감 날짜', hintText: 'mm/dd/yyyy'),
                  onChanged: (value) => setState(() {
                    endPeriod = value;
                  }),
                )),
              ],
            ),
            Column(
              children: [
                // 지원자 수만큼 반복
                for (int i = 0; i < selectedApplicantInfo.length; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // 지원자 정보 입력 (분야, 경력, 기술)
                      for (int j = 0; j < applicantLabel.length; j++)
                        DropdownButton<String>(
                          value: selectedApplicantInfo[i][j],
                          onChanged: (value) {
                            setState(() {
                              selectedApplicantInfo[i][j] = value!;
                            });
                          },
                          items: [
                            // 각 분야, 경력, 기술 드롭다운 메뉴
                            for (int k = 0; k < applicantLabel[j].length; k++)
                              DropdownMenuItem<String>(
                                value: applicantLabel[j][k],
                                child: Text(applicantLabel[j][k]),
                              ),
                          ],
                        ),
                    ],
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => removeApplicantInputField(),
                    child: Text("인원 삭제")),
                TextButton(
                    onPressed: () => addApplicantInputField(),
                    child: Text("인원 추가"))
              ],
            ),
            Container(
                //여기에 업로드된 파일 리스트
                child: (() {
              if (fileList.isNotEmpty) {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        //파일 불러올 수 있게 만드는 공간 만듬
                        );
                  },
                );
              } else {}
            })()),
            Container(
                //여기에 업로드된 파일 리스트
                ),
            Container(
              // margin: const EdgeInsets.all(30),
              alignment: Alignment.centerLeft,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                IconButton(
                  icon: Icon(Icons.image, color: iconColor, size: 30),
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
        )));
  }
}
