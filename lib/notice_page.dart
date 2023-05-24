import 'package:flutter/material.dart';
import 'package:meetteam/Appbar/normal_appbar.dart';

class Notice_page extends StatefulWidget {
  @override
  _Notice_page createState() => _Notice_page();
}
class _Notice_page extends State<Notice_page> {
  static const color1 = Color(0xffb5ddf6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
        body: SingleChildScrollView(
              child: Center(
                child: Column(children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(20, 20, 20,0),
                      padding: const EdgeInsets.all(10),
                      height: 70,
                      width: 430,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),color:color1 ,
                          border: Border.all(color: color1, width: 5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(width: 10.0,),
                                IconButton(
                                  icon: const Icon(Icons.person_add, size: 20),
                                  onPressed: () => {Navigator.pushNamed(context, '/userList')},
                                ),
                                SizedBox(width: 30.0,),
                                //글 부분
                                Text("내 프로젝트 신청자 += 1"),
                              ],
                            ),
                      ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20,0),
                    padding: const EdgeInsets.all(10),
                    height: 70,
                    width: 430,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),color:color1 ,
                        border: Border.all(color: color1, width: 5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 10.0,),
                        IconButton(
                          icon: const Icon(Icons.groups, size: 20),
                          onPressed: () => {},
                        ),
                        SizedBox(width: 30.0,),
                        Text("OO프로젝트에 신청자 확정되었습니다."),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20,0),
                    padding: const EdgeInsets.all(10),
                    height: 70,
                    width: 430,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),color:color1 ,
                        border: Border.all(color: color1, width: 5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 10.0,),
                        IconButton(
                          icon: const Icon(Icons.description, size: 20),
                          onPressed: () => {},
                        ),
                        SizedBox(width: 30.0,),
                        Text("OO관련 프로젝트가 모집 진행중입니다."),
                      ],
                    ),
                  ),
                ]),
              ),)
        );
    }
}
