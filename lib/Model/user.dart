enum Tech { java, c, cpp, python }

enum Field { web, app, game, ai }

Tech? labelToTech(String label) {
  switch (label) {
    case '자바':
      return Tech.java;
    case 'C언어':
      return Tech.c;
    case 'C++':
      return Tech.cpp;
    case '파이썬':
      return Tech.python;
    default:
      return null;
  }
}

Field? labelToField(String label) {
  switch (label) {
    case '웹':
      return Field.web;
    case '앱':
      return Field.app;
    case '게임':
      return Field.game;
    case '인공지능':
      return Field.ai;
    default:
      return null;
  }
}

class Spec {
  Tech _tech;
  int _career;
  // 0, 1, 2, 3

  Spec(this._tech, this._career) {
    _tech = tech;
    _career = career;
  }

  Tech get tech => _tech;
  int get career => _career;
}

class User {
  String _email;
  String _id;
  String _password;
  String _nickname;
  String _introduction;
  String _blogUrl;
  List<Spec> _spec = <Spec>[];
  List<Field> _interest = <Field>[];

  User(this._email, this._id, this._password, this._nickname,
      this._introduction, this._blogUrl, this._spec, this._interest) {
    _email = email;
    _id = id;
    _password = password;
    _nickname = nickname;
    _introduction = introduction;
    _blogUrl = blog_url;
    _spec = spec;
    _interest = interest;
  }

  String get email => _email;
  String get id => _id;
  String get password => _password;
  String get nickname => _nickname;
  String get introduction => _introduction;
  String get blog_url => _blogUrl;
  List<Spec> get spec => _spec;
  List<Field> get interest => _interest;
}
