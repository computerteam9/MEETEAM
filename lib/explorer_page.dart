import 'package:flutter/material.dart';
import 'package:meetteam/app_bar.dart';
import 'package:meetteam/color.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({super.key});
  static const List<String> tagList = ["오프라인", "Javascript", "백엔드"];
  static List<bool> isTagSelected = [false, false, false];

  @override
  State<StatefulWidget> createState() => _ExplorerState();
}

class _ExplorerState extends State<ExplorerPage> {
  static const List<String> tagList = ["오프라인", "Javascript", "백엔드"];
  static List<bool> isTagSelected = [false, false, false];

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
              child: Row(children: [
            for (int i = 0; i < tagList.length; i++)
              ToggleButtons(
                  color: Colors.black.withOpacity(0.60),
                  selectedColor: CustomColor.color3,
                  selectedBorderColor: CustomColor.color3,
                  fillColor: CustomColor.color3.withOpacity(0.08),
                  splashColor: CustomColor.color3.withOpacity(0.12),
                  hoverColor: CustomColor.color3.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(4.0),
                  constraints: BoxConstraints(minHeight: 36.0),
                  isSelected: [isTagSelected[i]],
                  onPressed: (index) {
                    setState(() {
                      isTagSelected[i] = !isTagSelected[i];
                    });
                  },
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(tagList[i],
                          style: const TextStyle(fontSize: 18)),
                    )
                  ]),
          ]))
        ]));
  }
}
