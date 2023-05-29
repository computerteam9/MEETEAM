class Project {
  String _title;
  String _description;
  int _meetingWay;
  String _meetingTime;
  DateTime _startDate;
  DateTime _endDate;
  // List<Map<기술(언어), 경력>>
  // 0 : 신입 (1년 이하), 1 : 1~3년, 2 : 3~5, 3 : 5년 이상
  List<Map<String, int>> _minSpec;
  // List<Map<지원자 user ID, 한줄소개>>
  List<Map<String, String>> _applicants;

  Project(this._title, this._description, this._meetingWay, this._meetingTime,
      this._startDate, this._endDate, this._minSpec, this._applicants) {
    _title = _title;
    _description = _description;
    _meetingWay = _meetingWay;
    _meetingTime = _meetingTime;
    _startDate = _startDate;
    _endDate = _endDate;
    _minSpec = _minSpec;
    _applicants = _applicants;
  }

  String get title => _title;
  String get description => _description;
  int get meetingWay => _meetingWay;
  String get meetingTime => _meetingTime;
  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;
  List<Map<String, int>> get minSpec => _minSpec;
  List<Map<String, String>> get applicants => _applicants;
}
