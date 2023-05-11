import "package:flutter/material.dart";
import "package:meetteam/Appbar/normal_appbar.dart";
import "package:meetteam/Color.dart";

//스크롤 미구현 상태
//body 영역에 대한 스크롤 구현
//프로필 버튼 누르면 프로필로 이동 구현
//그 외 각각 연결해줄 변수.. 리스트 등등..
class ProjectReadPage extends StatefulWidget {
  const ProjectReadPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectReadPage();
}

class _ProjectReadPage extends State<ProjectReadPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
      bottomNavigationBar: Container(
          height: 60,
          color: CustomColor.color3,
          alignment: Alignment.center,
          child: const Text(
            "신청자 내역",
            style: TextStyle(fontSize: 30, color: Colors.white),
          )),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
              alignment: Alignment.topLeft,
              child: Text(
                "프로젝트명",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "프로젝트 설명",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Text(
              "풍부하게 앞이 수 인생을 스며들어 얼마나 꾸며 위하여 밝은 운다. 기쁘며, 놀이 얼마나 심장은 기관과 얼마나 피고 목숨을 있으랴? 뼈 안고, 철환하였는가?",
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              alignment: Alignment.topLeft,
              child: Text(
                "리더",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  height: 50,
                  width: 50,
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                      color: Colors.grey, shape: BoxShape.circle),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    height: 50,
                    width: 100,
                    alignment: Alignment.topLeft,
                    child: Text("닉네임")),
                Container(
                  margin: EdgeInsets.fromLTRB(100, 30, 0, 0),
                  height: 40,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: CustomColor.color3,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  alignment: Alignment.center,
                  child: const Text(
                    "프로필",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              alignment: Alignment.topLeft,
              child: const Text(
                "모임",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(100, 10, 0, 0),
              height: 30,
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text("오프라인  "),
                      Text(
                        "zoom",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ],
                  ),
                  Text("매주 토요일 20시")
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "모집 인원",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                      color: Colors.grey, shape: BoxShape.circle),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    height: 50,
                    width: 80,
                    alignment: Alignment.topLeft,
                    child: Text("백엔드")),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  height: 60,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          child: Column(
                        children: [
                          Text("최소 경력"),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            height: 20,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: CustomColor.color1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              "3년",
                              style: TextStyle(color: CustomColor.color3),
                            ),
                          )
                        ],
                      )),
                      Container(
                          child: Column(
                        children: [
                          Text("필요 기술"),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle),
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                      color: Colors.grey, shape: BoxShape.circle),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    height: 50,
                    width: 80,
                    alignment: Alignment.topLeft,
                    child: Text("프론트엔드")),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  height: 60,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          child: Column(
                        children: [
                          Text("최소 경력"),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            height: 20,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: CustomColor.color1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              "5년",
                              style: TextStyle(color: CustomColor.color3),
                            ),
                          )
                        ],
                      )),
                      Container(
                          child: Column(
                        children: [
                          Text("필요 기술"),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle),
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
