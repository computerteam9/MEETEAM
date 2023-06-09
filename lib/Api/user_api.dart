import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meetteam/Model/user.dart';
import 'package:meetteam/Api/db.dart';

class UserApi {
  UserApi();

  static Future<String> addUser(
      String email,
      String password,
      String nickname,
      String introduction,
      String blogUrl,
      List<Map<String, int>> spec,
      List<String> interest) async {
    User newUser = User(
      email,
      password,
      nickname,
      introduction,
      blogUrl,
      spec,
      interest,
      {"leader": [], "member": []},
    );
    DocumentReference documentRef = DB.instance.collection('users').doc();

    await DB.instance
        .collection('users')
        .where('nickname', isEqualTo: nickname)
        .get()
        .then((queryResult) {
      if (queryResult.docs.isNotEmpty) throw Exception('해당 닉네임으로 이미 가입되었습니다.');
    });

    await DB.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((queryResult) {
      if (queryResult.docs.isNotEmpty) throw Exception('해당 이메일로 이미 가입되었습니다.');
    });

    await documentRef.set({
      'email': newUser.email,
      'password': newUser.password,
      'nickname': newUser.nickname,
      'introduction': newUser.introduction,
      'blogUrl': newUser.blogUrl,
      'spec': newUser.spec,
      'interest': newUser.interest,
      'project': newUser.project,
    });

    return documentRef.id;
  }

  static Future<String> verifyUser(String email, String password) async {
    String result = '';
    await DB.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get()
        .then((queryResult) {
      if (queryResult.docs.isNotEmpty) {
        result = queryResult.docs[0].id;
      }
    });
    return result;
  }

  static Future<User> getUser(String id) {
    return DB.instance.collection('users').doc(id).get().then((doc) {
      if (doc.exists) {
        List<Map<String, int>> spec = [];
        List<String> interest = [];
        Map<String, List<String>> project = {};
        for (var item in doc['spec']) {
          spec.add(Map<String, int>.from(item));
        }
        for (var item in doc['interest']) {
          interest.add(item);
        }
        for (var item in doc['project'].keys) {
          project[item] = List<String>.from(doc['project'][item]);
        }
        return User(doc['email'], doc['password'], doc['nickname'],
            doc['introduction'], doc['blogUrl'], spec, interest, project);
      } else {
        throw Exception('해당 유저가 존재하지 않습니다.');
      }
    });
  }

  static Future<void> updateUser(
      String id,
      String email,
      String password,
      String nickname,
      String introduction,
      String blogUrl,
      List<Map<String, int>> spec,
      List<String> interest,
      Map<String, List<String>> project) async {
    User newUser = User(email, password, nickname, introduction, blogUrl, spec,
        interest, project);

    if (nickname != newUser.nickname) {
      await DB.instance
          .collection('users')
          .where('nickname', isEqualTo: nickname)
          .get()
          .then((queryResult) {
        if (queryResult.docs.isNotEmpty)
          throw Exception('해당 닉네임으로 이미 가입되었습니다.');
      });
    }
    if (email != newUser.email) {
      await DB.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get()
          .then((queryResult) {
        if (queryResult.docs.isNotEmpty) throw Exception('해당 이메일로 이미 가입되었습니다.');
      });
    }

    await DB.instance.collection('users').doc(id).update({
      'email': newUser.email,
      'password': newUser.password,
      'nickname': newUser.nickname,
      'introduction': newUser.introduction,
      'blogUrl': newUser.blogUrl,
      'spec': newUser.spec,
      'interest': newUser.interest,
      'project': newUser.project,
    });
  }
}
