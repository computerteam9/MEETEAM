import "package:flutter/material.dart";
import "package:meetteam/Appbar/normal_appbar.dart";
import "package:meetteam/Color.dart";
import "project_read_page.dart";

class WriteFinishedPageArgument {
  final String? label;

  WriteFinishedPageArgument(this.label);
}

class WriteFinishedPage extends StatefulWidget {
  const WriteFinishedPage({super.key});

  @override
  State<StatefulWidget> createState() => WriteFinishedPageState();
}

class WriteFinishedPageState extends State<WriteFinishedPage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as WriteFinishedPageArgument;
    return Scaffold(
      appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
      bottomNavigationBar: SizedBox(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectReadPage(),
                ));
          },
          child: Container(
            height: 60,
            color: CustomColor.color3,
            alignment: Alignment.center,
            child: const Text(
              "확인",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          args.label!,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
