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
  // 0번째 : 자신이 리더인 프로젝트의 id, 1번째 : 자신이 신청한/멤버인 프로젝트의 id
  Map<String, List<String>> _project;

  User(this._email, this._password, this._nickname, this._introduction,
      this._blogUrl, this._spec, this._interest, this._project) {
    _email = email;
    _password = password;
    _nickname = nickname;
    _introduction = introduction;
    _blogUrl = blogUrl;
    _spec = spec;
    _interest = interest;
    _project = project;
  }

  String get email => _email;
  String get password => _password;
  String get nickname => _nickname;
  String get introduction => _introduction;
  String get blogUrl => _blogUrl;
  List<Map<String, int>> get spec => _spec;
  List<String> get interest => _interest;
  Map<String, List<String>> get project => _project;
}
