import 'package:flutter/material.dart';
import 'package:meetteam/Api/session.dart';
import 'package:meetteam/Appbar/normal_appbar.dart';
import 'package:meetteam/color.dart';
import 'package:meetteam/Api/project_api.dart';
import 'package:meetteam/Api/user_api.dart';

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
  //이후 삭제 예정

  @override
  State<StatefulWidget> createState() => _ProjectWritePageState();
}

class _ProjectWritePageState extends State<ProjectWritePage> {
  TextEditingController projectTitleController = TextEditingController();
  TextEditingController requiredCareerController = TextEditingController();
  TextEditingController workingTimeController = TextEditingController();
  TextEditingController personNumberController = TextEditingController();
  TextEditingController introduceProjectController = TextEditingController();
  TextEditingController startPeriodController = TextEditingController();
  TextEditingController endPeriodController = TextEditingController();
  TextEditingController deadLineController = TextEditingController();

  bool checkStartPeriod = true;
  bool checkEndPeriod = true;
  bool checkDeadLine = true;

  @override
  dispose() {
    startPeriodController.dispose();
    endPeriodController.dispose();
    deadLineController.dispose();
    super.dispose();
  }

  static const meetingWay = ["만남 방식", "온라인", "오프라인", "온오프라인"];
  static const applicantLabel = [
    ["분야 선택", "개발", "디자인", "기획", "기타"],
    ["경력 선택", "1년 미만", "1~3년차", "3~5년차", "5년차 이상", "무관"],
    ["기술 선택", "Java", "Python", "JavaScript", "Go", "기타"]
  ];

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
  String deadLine = "";

  String uploadedFileName = "";

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

  List<Map<String, int>> getMinSpecOfApplicants(
      List selectedApplicantInfo, List<String> fieldList) {
    List<Map<String, int>> resultList = [];

    for (int i = 0; i < selectedApplicantInfo.length; i++) {
      resultList.add({
        selectedApplicantInfo[2][i]:
            fieldList.indexOf(selectedApplicantInfo[1][i])
      });
    }

    return resultList;
  }

  void checkDeadLineCondition() {
    String id = deadLineController.text;
    bool isValid = id.length == 10 &&
        id.contains(RegExp(r'^([0-9]{2})/?([0-9]{2})/?([0-9]{4})$'));
    setState(() {
      checkDeadLine = isValid;
    });
  }

  void checkStartPeriodCondition() {
    String id = startPeriodController.text;
    bool isValid = id.length == 10 &&
        id.contains(RegExp(r'^([0-9]{2})/?([0-9]{2})/?([0-9]{4})$'));
    setState(() {
      checkStartPeriod = isValid;
    });
  }

  void checkEndPeriodCondition() {
    String id = endPeriodController.text;
    bool isValid = id.length == 10 &&
        id.contains(RegExp(r'^([0-9]{2})/?([0-9]{2})/?([0-9]{4})$'));
    setState(() {
      checkEndPeriod = isValid;
    });
  }

  List<List<String>> getNewUserProject(
      List<List<String>> userProject, String newProject) {
    List<List<String>> resultProject = userProject;
    List<String> tmp = resultProject[0];
    tmp.add(newProject);
    resultProject[0] = tmp;

    return resultProject;
  }

  DateTime getDateTime(String datetime) {
    List<String> dateList = datetime.split("/"); // mm/dd/yyyy

    int month = int.parse(dateList[0]);
    int day = int.parse(dateList[1]);
    int year = int.parse(dateList[2]);

    return DateTime.utc(year, month, day);
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
            // 프로젝트 제목 영역
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "프로젝트 제목", hintText: 'ex: 그룹 버킷리스트 공유 앱 개발'),
                textAlign: TextAlign.start,
                controller: projectTitleController,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            // 프로젝트 내용 영역
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "프로젝트 내용",
                  hintText: '프로젝트 시작 동기, 서비스 계획, 사용자 타겟팅, 우대 사항, 그 외 기타 등등'),
              textAlign: TextAlign.start,
              controller: introduceProjectController,
              minLines: 1,
              maxLines: 3,
            ),
            Expanded(
              child: TextField(
                controller: deadLineController,
                onChanged: (value) => setState(() {
                  checkDeadLineCondition();
                  deadLine = value;
                }),
                decoration: InputDecoration(
                    labelText: '프로젝트 모집 마감 날짜',
                    hintText: 'mm/dd/yyyy',
                    errorText: checkDeadLine ? null : '형식과 맞지 않습니다.'),
              ),
            ),
            // 만남 방식, 만남 시간 영역
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
                  labelText: '만남 장소 및 시간',
                ),
                onChanged: (value) {
                  setState(() {
                    meetingTime = value;
                  });
                },
              )),
            ]),
            // 프로젝트 시작 날짜, 마감 날짜 영역
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: startPeriodController,
                    onChanged: (value) => setState(() {
                      checkStartPeriodCondition();
                      startPeriod = value;
                    }),
                    decoration: InputDecoration(
                        labelText: '프로젝트 시작 날짜',
                        hintText: 'mm/dd/yyyy',
                        errorText: checkStartPeriod ? null : '형식과 맞지 않습니다.'),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: endPeriodController,
                    onChanged: (value) => setState(() {
                      checkEndPeriodCondition();
                      endPeriod = value;
                    }),
                    decoration: InputDecoration(
                        labelText: '프로젝트 종료 날짜',
                        hintText: 'mm/dd/yyyy',
                        errorText: checkEndPeriod ? null : '형식과 맞지 않습니다.'),
                  ),
                ),
              ],
            ),
            // 지원자 요구 스펙 영역
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
            // 모집 인원 추가, 삭제 영역
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => removeApplicantInputField(),
                    child: Text(
                        style: TextStyle(color: CustomColor.color3), "인원 삭제")),
                TextButton(
                    onPressed: () => addApplicantInputField(),
                    child: Text(
                        style: TextStyle(color: CustomColor.color3), "인원 추가"))
              ],
            ),
            // 저장 버튼
            Container(
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.color3),
                child: Text("저장"),
                onPressed: () {
                  String userId = Session.get();

                  ProjectApi.addProject(
                    projectTitleController.text,
                    introduceProjectController.text,
                    meetingWay.indexOf(selectedMeetingWay),
                    meetingTime,
                    getDateTime(startPeriod),
                    getDateTime(endPeriod),
                    getMinSpecOfApplicants(selectedApplicantInfo,
                        applicantLabel[1]), // String int // 파이썬, 3
                    [], // 신청자 user Id, 한 줄 소개
                    userId,
                    getDateTime(deadLine),
                  ).then((projectId) {
                    UserApi.getUser(userId).then((user) {

                      List<List<String>> newProjectList =
                          getNewUserProject(user.project, projectId);

                      UserApi.updateUser(
                          userId,
                          user.email,
                          user.password,
                          user.nickname,
                          user.introduction,
                          user.blogUrl,
                          user.spec,
                          user.interest,
                          newProjectList);

                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/project');
                    });
                  });
                },
              ),
            ),
          ]),
        )));
  }
}
