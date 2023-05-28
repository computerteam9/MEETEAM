class Spec {
  String _tech;
  int _career;
  // 0 : 신입 (1년 이하), 1 : 1~3년, 2 : 3~5, 3 : 5년 이상

  Spec(this._tech, this._career) {
    _tech = tech;
    _career = career;
  }

  String get tech => _tech;
  int get career => _career;

  Map<String, String> toMap() {
    return {
      'tech': _tech.toString(),
      'career': _career.toString(),
    };
  }
}

class User {
  String _email;
  String _password;
  String _nickname;
  String _introduction;
  String _blogUrl;
  // List<Map<기술(언어), 경력>>
  // 0 : 신입 (1년 이하), 1 : 1~3년, 2 : 3~5, 3 : 5년 이상
  List<Map<String, int>> _spec;
  // List<분야>
  List<String> _interest = <String>[];

  User(this._email, this._password, this._nickname, this._introduction,
      this._blogUrl, this._spec, this._interest) {
    _email = email;
    _password = password;
    _nickname = nickname;
    _introduction = introduction;
    _blogUrl = blogUrl;
    _spec = spec;
    _interest = interest;
  }

  String get email => _email;
  String get password => _password;
  String get nickname => _nickname;
  String get introduction => _introduction;
  String get blogUrl => _blogUrl;
  List<Map<String, int>> get spec => _spec;
  List<String> get interest => _interest;
}
