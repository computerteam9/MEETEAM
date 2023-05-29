import 'package:meetteam/Model/project.dart';
import 'package:meetteam/Api/db.dart';
import 'package:intl/intl.dart';

class ProjectApi {
  ProjectApi();

  static Future<void> addProject(
      String title,
      String description,
      int meetingWay,
      String meetingTime,
      DateTime startDate,
      DateTime endDate,
      List<Map<String, int>> minSpec,
      List<Map<String, String>> applicants) async {
    Project newProject = Project(title, description, meetingWay, meetingTime,
        startDate, endDate, minSpec, applicants);

    await DB.instance.collection('projects').doc().set({
      'title': newProject.title,
      'description': newProject.description,
      'meetingWay': newProject.meetingWay,
      'meetingTime': newProject.meetingTime,
      'startDate': DateFormat('yyyy-MM-dd').format(newProject.startDate),
      'endDate': DateFormat('yyyy-MM-dd').format(newProject.endDate),
      'minSpec': newProject.minSpec,
      'applicants': newProject.applicants,
    });
  }
}
