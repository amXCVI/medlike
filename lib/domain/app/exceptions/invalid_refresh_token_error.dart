class InvalidRefreshTokenError implements Exception {
  String _message = '';
  InvalidRefreshTokenError([String message = 'Invalid refresh token']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
