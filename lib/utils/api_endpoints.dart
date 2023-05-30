class ApiEndPoints {
  static const String baseUrl = 'https://localhost:7197/api/';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'Authentication/Register';
  final String loginEmail = 'Authentication/Login';
}
