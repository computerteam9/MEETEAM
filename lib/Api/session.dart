class Session {
  static String _userId = '';

  static void set(id) {
    _userId = id;
  }

  static String get() {
    return _userId;
  }
}
