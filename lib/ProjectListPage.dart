import 'package:flutter/material.dart';
import 'package:meetteam/Appbar1.dart';


class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectListPage();
}

class _ProjectListPage extends State<ProjectListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar2(key: UniqueKey(), appBar: AppBar()),
    );
  }
}
