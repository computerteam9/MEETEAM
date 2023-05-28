// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:meetteam/Model/project.dart';

// class ProjectApi {
//   static FirebaseFirestore db = FirebaseFirestore.instance;

//   ProjectApi();

//   static Future<void> addUser(
//       String email,
//       String password,
//       String nickname,
//       String introduction,
//       String blogUrl,
//       List<Map<String, int>> spec,
//       List<String> interest) async {
//     await db
//         .collection('users')
//         .where('nickname', isEqualTo: nickname)
//         .get()
//         .then((queryResult) {
//       if (queryResult.docs.isNotEmpty) throw Exception('해당 닉네임으로 이미 가입되었습니다.');
//     });

//     await db
//         .collection('users')
//         .where('email', isEqualTo: email)
//         .get()
//         .then((queryResult) {
//       if (queryResult.docs.isNotEmpty) throw Exception('해당 이메일로 이미 가입되었습니다.');
//     });

//     await db.collection('users').doc().set({
//       'email': newUser.email,
//       'password': newUser.password,
//       'nickname': newUser.nickname,
//       'introduction': newUser.introduction,
//       'blogUrl': newUser.blogUrl,
//       'spec': newUser.spec,
//       'interest': newUser.interest,
//     });
//   }

//   static Future<String> verifyUser(String email, String password) async {
//     String result = '';
//     await db
//         .collection('users')
//         .where('email', isEqualTo: email)
//         .where('password', isEqualTo: password)
//         .get()
//         .then((queryResult) {
//       if (queryResult.docs.isNotEmpty) {
//         result = queryResult.docs[0].id;
//       }
//     });
//     return result;
//   }

//   static Future<User> getUser(String id) {
//     return db.collection('users').doc(id).get().then((doc) {
//       if (doc.exists) {
//         List<Map<String, int>> spec = [];
//         List<String> interest = [];
//         for (var item in doc['spec']) {
//           spec.add(Map<String, int>.from(item));
//         }
//         for (var item in doc['interest']) {
//           interest.add(item);
//         }
//         return User(doc['email'], doc['password'], doc['nickname'],
//             doc['introduction'], doc['blogUrl'], spec, interest);
//       } else {
//         throw Exception('해당 유저가 존재하지 않습니다.');
//       }
//     });
//   }
// }
