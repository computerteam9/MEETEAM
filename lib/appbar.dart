import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({required Key key, required this.appBar}) : super(key: key);
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
            color: titleColor, fontSize: 20.0, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      leading: const Icon(Icons.notifications_none, color: iconColor, size: 30),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search, color: iconColor, size: 30),
          tooltip: 'search',
          onPressed: () => {},
        ),
        IconButton(
          icon: const Icon(Icons.account_circle, color: iconColor, size: 30),
          onPressed: () => {},
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
