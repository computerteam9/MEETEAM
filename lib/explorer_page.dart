import 'package:flutter/material.dart';
import 'package:meetteam/app_bar.dart';
import 'package:meetteam/color.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({super.key});

  @override
  State<StatefulWidget> createState() => _ExplorerState();
}

class _ExplorerState extends State<ExplorerPage> {
  static const List<String> tagList = [
    "오프라인",
    "Javascript",
    "백엔드",
    "프론트엔드",
    "안드로이드",
    "IOS",
    "웹",
    "데스크탑",
    "게임",
    "데이터베이스",
    "기타"
  ];
  // tagList의 갯수만큼 false로 초기화
  static List<bool> isTagSelected = List.filled(tagList.length, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(key: UniqueKey(), appBar: AppBar()),
        body: Column(children: [
          Container(
              margin: const EdgeInsets.all(50),
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
                      onPressed: () => {},
                      icon: const Icon(Icons.search, size: 30)),
                ],
              )),
          Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              // Wrap으로 감싸서 자동 줄바꿈
              child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  spacing: 5,
                  children: [
                    // ToggleButtons 반복 생성
                    for (int i = 0; i < tagList.length; i++)
                      ToggleButtons(
                          color: Colors.black.withOpacity(0.60),
                          selectedColor: CustomColor.color3,
                          selectedBorderColor: CustomColor.color3,
                          fillColor: CustomColor.color3.withOpacity(0.08),
                          splashColor: CustomColor.color3.withOpacity(0.12),
                          hoverColor: CustomColor.color3.withOpacity(0.04),
                          borderRadius: BorderRadius.circular(4.0),
                          constraints: const BoxConstraints(minHeight: 36.0),
                          isSelected: [isTagSelected[i]],
                          onPressed: (index) {
                            setState(() {
                              isTagSelected[i] = !isTagSelected[i];
                            });
                          },
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(tagList[i]))
                          ]),
                  ]))
        ]));
  }
}
