import "package:flutter/material.dart";
import 'package:meetteam/Appbar1.dart';
import 'package:meetteam/UserCheckPage.dart';

class UserCheck extends StatelessWidget {
  static const color1 = Color(0Xff4676BA);
  static const color2 = Colors.black;
  static const color3 = Color(0xff83B8EE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: BaseAppBar2(key: UniqueKey(), appBar: AppBar()));
  }
}
