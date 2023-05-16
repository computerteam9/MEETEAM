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
        "MEETEAM",
        style: TextStyle(
            color: titleColor, fontSize: 20.0, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      // 뒤로가기 버튼
      leading: IconButton(
        icon: const Icon(Icons.notifications_none, color: iconColor, size: 30),
        tooltip: 'notification',
        onPressed: () => {Navigator.pushNamed(context, '/notice')},
      ),
      actions: [
        // 검색 버튼
        IconButton(
          icon: const Icon(Icons.search, color: iconColor, size: 30),
          tooltip: 'search',
          onPressed: () => {Navigator.pushNamed(context, '/explorer')},
        ),
        // 프로필 버튼
        IconButton(
          icon: const Icon(Icons.account_circle, color: iconColor, size: 30),
          tooltip: 'profile',
          onPressed: () => {Navigator.pushNamed(context, '/profile')},
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
