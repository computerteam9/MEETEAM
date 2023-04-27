import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meetteam/app_bar.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<StatefulWidget> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  TextEditingController nickName = TextEditingController();
  TextEditingController supportArea = TextEditingController();
  TextEditingController requiredCareer = TextEditingController();
  TextEditingController workingTime = TextEditingController();
  TextEditingController introduceUser = TextEditingController();


  static const iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(key: UniqueKey(), appBar: AppBar()),
      body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 7,
                        child:TextFormField(
                          decoration: InputDecoration(
                            labelText: "닉네임",
                          ),
                          textAlign: TextAlign.start,
                          controller: nickName,
                        ),
                      ),
                      Spacer(flex:1),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 10,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: "지원 분야"
                          ),
                          textAlign: TextAlign.start,
                          controller: supportArea,
                          minLines: 1,
                          maxLines: 3,
                        ),
                      ),
                    ]),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "경력",
                    ),
                    textAlign: TextAlign.start,
                    controller: requiredCareer,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: "활동 시간"
                    ),
                    textAlign: TextAlign.start,
                    controller: workingTime,
                    minLines: 1,
                    maxLines: 3,
                  ),
                ]),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "한 줄 소개",
                  ),
                  textAlign: TextAlign.start,
                  controller: introduceUser,
                  minLines: 1,
                  maxLines: 3,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(30),
                alignment: Alignment.centerLeft,
                child:
                  const Icon(Icons.add, color: iconColor, size: 30,),
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

/*
child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(50),
                child: Column(
                    verticalDirection: VerticalDirection.down,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextField(
                            keyboardType: TextInputType.name,
                            controller: nickName,
                            decoration: const InputDecoration(
                              hintText: '닉네임',
                            ),
                          ),
                        ]

                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: requiredCareer,
                        decoration: const InputDecoration(
                          hintText: '경력',
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextField(
                              keyboardType: TextInputType.text,
                              controller: supportArea,
                              decoration: const InputDecoration(
                                hintText: '지원 분야',
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.datetime,
                              controller: workingTime,
                              decoration: const InputDecoration(
                                hintText: '활동 시간',
                              ),
                            )
                          ]
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: introduceProject,
                        decoration: const InputDecoration(
                          hintText: '한 줄 소개',
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, color: iconColor, size: 30),
                        tooltip: 'search',
                        onPressed: () => {},
                      ),
                    ]
                )
            )
          ],

        )

 */

