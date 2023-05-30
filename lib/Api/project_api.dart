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

  static Future<Project> getProject(String projectId) async {
    return DB.instance.collection('projects').doc(projectId).get().then((doc) {
      if (doc.exists) {
        List<Map<String, int>> minSpec = [];
        List<Map<String, String>> applicants = [];

        for (var item in doc['minSpec']) {
          minSpec.add(Map<String, int>.from(item));
        }
        for (var item in doc['applicants']) {
          applicants.add(Map<String, String>.from(item));
        }

        return Project(
            doc['title'],
            doc['description'],
            doc['meetingWay'],
            doc['meetingTime'],
            DateTime.parse(doc['startDate']),
            DateTime.parse(doc['endDate']),
            minSpec,
            applicants,
            doc['leaderId']);
      } else {
        throw Exception('해당 프로젝트가 존재하지 않습니다.');
      }
    });
  }
}
