import 'package:flutter/material.dart';
import 'package:meetteam/Color.dart';
import 'package:meetteam/Appbar/normal_appbar.dart';
import 'package:meetteam/Widgets/project_box.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({super.key});

  @override
  State<StatefulWidget> createState() => _ExplorerState();
}

class _ExplorerState extends State<ExplorerPage> {
  // DropDownButton에 들어갈 리스트
  static const List<String> sortList = ["정렬", "최신순", "인기순", "마감임박순"];
  static const List<String> fieldList = ["분야 선택", "웹", "모바일 앱", "게임"];
  static const List<String> meetList = ["모임 방식", "온라인", "오프라인"];

  // DropDownButton에서 선택된 값
  static String selectedSort = sortList[0];
  static String selectedField = fieldList[0];
  static String selectedMeet = meetList[0];

  // 검색 결과 값
  static List<ProjectBox> searchResult = [];

  // 현재 페이지로 들아왔을 때 검색 결과 초기화
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedSort = sortList[0];
    selectedField = fieldList[0];
    selectedMeet = meetList[0];
    searchResult.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: Column(children: [
          Container(
              margin: const EdgeInsets.fromLTRB(50, 20, 50, 30),
              child: Row(
                children: <Widget>[
                  // Row안에 TextField 넣기 위해 Expanded 사용
                  const Expanded(
                      // 검색 입력 박스
                      child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '프로젝트 검색',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: CustomColor.color3),
                      ),
                    ),
                  )),
                  // 검색 버튼
                  IconButton(
                      onPressed: () => {
                            setState(() => searchResult = [
                                  const ProjectBox(
                                    title: "프로젝트1",
                                    description: "설명1",
                                    tag: "태그1",
                                    dDay: "7",
                                    color: CustomColor.color1,
                                  ),
                                  const ProjectBox(
                                    title: "프로젝트2",
                                    description: "설명2",
                                    tag: "태그2",
                                    dDay: "7",
                                    color: CustomColor.color3,
                                  ),
                                  const ProjectBox(
                                    title: "프로젝트3",
                                    description: "설명3",
                                    tag: "태그3",
                                    dDay: "7",
                                    color: CustomColor.color3,
                                  ),
                                  const ProjectBox(
                                    title: "프로젝트4",
                                    description: "설명4",
                                    tag: "태그4",
                                    dDay: "7",
                                    color: CustomColor.color1,
                                  ),
                                  const ProjectBox(
                                    title: "프로젝트5",
                                    description: "설명5",
                                    tag: "태그5",
                                    dDay: "7",
                                    color: CustomColor.color3,
                                  ),
                                  const ProjectBox(
                                    title: "프로젝트6",
                                    description: "설명6",
                                    tag: "태그6",
                                    dDay: "7",
                                    color: CustomColor.color1,
                                  ),
                                  const ProjectBox(
                                    title: "프로젝트7",
                                    description: "설명7",
                                    tag: "태그7",
                                    dDay: "7",
                                    color: CustomColor.color3,
                                  ),
                                ])
                          },
                      icon: const Icon(Icons.search, size: 30)),
                ],
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 정렬 선택
                  DropdownButton<String>(
                      value: selectedSort,
                      items: [
                        for (int i = 0; i < sortList.length; i++)
                          DropdownMenuItem<String>(
                              value: sortList[i], child: Text(sortList[i]))
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedSort = value!;
                        });
                      }),
                  // 분야 선택
                  DropdownButton<String>(
                      value: selectedField,
                      items: [
                        for (int i = 0; i < fieldList.length; i++)
                          DropdownMenuItem<String>(
                              value: fieldList[i], child: Text(fieldList[i]))
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedField = value!;
                        });
                      }),
                  // 모임 방식 선택
                  DropdownButton<String>(
                      value: selectedMeet,
                      items: [
                        for (int i = 0; i < meetList.length; i++)
                          DropdownMenuItem<String>(
                              value: meetList[i], child: Text(meetList[i]))
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedMeet = value!;
                        });
                      }),
                ],
              )),
          // 검색 결과
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (BuildContext context, int index) {
                  return searchResult[index];
                },
              ),
            ),
          ),
        ]));
  }
}
