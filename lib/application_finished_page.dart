import "package:flutter/material.dart";
import "package:meetteam/Appbar/normal_appbar.dart";
import "package:meetteam/application_check_page.dart";
import "package:meetteam/Color.dart";

class ApplicationFinishedPage extends StatefulWidget {
  const ApplicationFinishedPage({super.key});

  @override
  State<StatefulWidget> createState() => ApplicationFinishedPageState();

}

class ApplicationFinishedPageState extends State<ApplicationFinishedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
      bottomNavigationBar: SizedBox(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(
              builder: (context) => const ApplicationCheckPage(),
            ));
          },
          child: Container(
            height: 60,
            color: CustomColor.color3,
            alignment: Alignment.center,
            child:
            const Text(
              "확인",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
      body: const Center(
        child:
        Text(
          "지원이 완료되었습니다.",
          style: TextStyle(
              fontSize: 20
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}