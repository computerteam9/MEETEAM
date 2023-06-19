import 'package:flutter/material.dart';
import 'package:meetteam/Color.dart';

class ProjectBox extends StatelessWidget {
  final String title;
  final String description;
  final String tag;
  final String dDay;
  final Color color;

  const ProjectBox({
    super.key,
    required this.title,
    required this.description,
    required this.tag,
    required this.dDay,
    this.color = CustomColor.color3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/project');
      },
      child: Container(
          height: 100,
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const ClipOval(
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      title,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                            height: 1.7, fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  "D-$dDay",
                  style: const TextStyle(
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              )
            ],
          )),
    ));
  }
}
