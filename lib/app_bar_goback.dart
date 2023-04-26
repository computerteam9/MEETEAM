import 'package:flutter/material.dart';

class BaseAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar2({required Key key, required this.appBar}) : super(key: key);
  final AppBar appBar;
  static const titleColor = Color(0xff2c4096);
  static const iconColor = Colors.black;
  static const bgColor = Color(0xfffafafa);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      title: const Text(
        "MEETTEAM",
        style: TextStyle(
            color: titleColor, fontSize: 10.0, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
//      leading: const Icon(Icons.notifications_none, color: iconColor, size: 30),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: iconColor, size: 30),
        tooltip: 'go_back',
        onPressed: () => {},
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
