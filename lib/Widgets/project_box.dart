import 'package:flutter/material.dart';
import 'package:meetteam/Color.dart';

class ProjectBox extends StatelessWidget {
  final String title;
  final String description;
  final String tag;
  final String dDay;
  final Color color;


  const ProjectBox({super.key,
    required this.title,
    required this.description,
    required this.tag,
    required this.dDay,
    this.color = CustomColor.color3,
  });

  @override
  Widget build(BuildContext context){
    return Container(
        height: 100,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const ClipOval(
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                  const TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  description,
                  style: const TextStyle(
                      height: 2, fontSize: 10, color: Colors.white),
                ),
                Text(
                  tag,
                  maxLines:3,
                  overflow: TextOverflow.ellipsis,
                  style:
                  const TextStyle(fontSize: 8, color: Colors.white),
                ),
              ],
            ),
            Text(
              dDay,
              style: const TextStyle(
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.white),
            )
          ],
        ));
  }
}