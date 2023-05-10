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
        icon: const Icon(Icons.arrow_back, color: iconColor, size: 30),
        tooltip: 'go_back',
        onPressed: () => {Navigator.pop(context)},
      ),
      actions: <Widget>[
        // 수정 버튼
        IconButton(
          icon: const Icon(Icons.edit, color: iconColor, size: 30),
          onPressed: () => {Navigator.pushNamed(context, '/profileWrite')},
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
