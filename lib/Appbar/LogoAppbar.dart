import 'package:flutter/material.dart';

class BaseAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppbar({required Key key, required this.appBar}) : super(key: key);
  final AppBar appBar;
  static const titleColor = Color(0xff2c4096);
  static const iconColor = Colors.black;
  static const bgColor = Color(0xfffafafa);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      // 중앙 로고
      title: const Text(
        "MEETTEAM",
        style: TextStyle(
            color: titleColor, fontSize: 20.0, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
