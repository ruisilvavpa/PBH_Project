class ApiEndPoints {
  static const String baseUrl = 'http://localhost:7197';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = '/api/Authentication/Register';
  final String loginEmail = '/api/Authentication/Login';
  final String forgotPassword = 'authaccount/forgotPassword';
}
