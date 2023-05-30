import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meetteam/Model/project.dart';
import 'package:meetteam/Api/db.dart';
import 'package:intl/intl.dart';

class ProjectApi {
  ProjectApi();

  static Future<String> addProject(
      String title,
      String description,
      int meetingWay,
      String meetingTime,
      DateTime startDate,
      DateTime endDate,
      List<Map<String, int>> minSpec,
      List<Map<String, String>> applicants,
      String leaderId) async {
    Project newProject = Project(title, description, meetingWay, meetingTime,
        startDate, endDate, minSpec, applicants, leaderId);
    DocumentReference documentRef = DB.instance.collection('projects').doc();
    await documentRef.set({
      'title': newProject.title,
      'description': newProject.description,
      'meetingWay': newProject.meetingWay,
      'meetingTime': newProject.meetingTime,
      'startDate': DateFormat('yyyy-MM-dd').format(newProject.startDate),
      'endDate': DateFormat('yyyy-MM-dd').format(newProject.endDate),
      'minSpec': newProject.minSpec,
      'applicants': newProject.applicants,
      'leaderId': newProject.leaderId,
    });

    return documentRef.id;
  }
}
