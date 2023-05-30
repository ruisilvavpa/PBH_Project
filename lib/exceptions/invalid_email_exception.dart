class InvalidEmailException implements Exception {
  final String message;

  InvalidEmailException(this.message);

  @override
  String toString() {
    return 'InvalidEmailException: $message';
  }
}
