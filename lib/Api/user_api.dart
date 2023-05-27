import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meetteam/Model/user.dart';

class UserApi {
  static FirebaseFirestore db = FirebaseFirestore.instance;

  UserApi();

  static void addUser(
      String email,
      String password,
      String nickname,
      String introduction,
      String blogUrl,
      List<Spec> spec,
      List<Field> interest) async {
    User newUser =
        User(email, password, nickname, introduction, blogUrl, spec, interest);

    await db
        .collection('users')
        .where('nickname', isEqualTo: nickname)
        .get()
        .then((queryResult) {
      if (queryResult.docs.isNotEmpty) throw Exception('해당 닉네임으로 이미 가입되었습니다.');
    });

    await db
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((queryResult) {
      if (queryResult.docs.isNotEmpty) throw Exception('해당 이메일로 이미 가입되었습니다.');
    });

    await db.collection('users').doc().set({
      'email': newUser.email,
      'password': newUser.password,
      'nickname': newUser.nickname,
      'introduction': newUser.introduction,
      'blogUrl': newUser.blog_url,
      'spec': newUser.spec,
      'interest': newUser.interest,
    });
  }

  // static User getUser() {
  //   final users = firestore.collection('users').doc('9NiS8rz74IM8ae3IZDD9');
  //   users.get().
  // }
}
