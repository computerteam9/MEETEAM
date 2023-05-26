import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meetteam/Model/user.dart';

class UserApi {
  static FirebaseFirestore db = FirebaseFirestore.instance;

  UserApi() {}

  static void addUser(
      String email,
      String id,
      String password,
      String nickname,
      String introduction,
      String blogUrl,
      List<Spec> spec,
      List<Field> interest) {
    DocumentReference ref = db.collection("users").doc();
    String myId = ref.id;

    User newUser = User(
        email, id, password, nickname, introduction, blogUrl, spec, interest);

    db.collection('users').doc().set({
      'email': newUser.email,
      'id': newUser.id,
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
