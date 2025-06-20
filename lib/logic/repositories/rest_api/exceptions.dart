/// 400 error
class BadRequestException implements Exception {
  BadRequestException({this.message = ''});

  final String message;

  @override
  String toString() => 'exceptions.bad_request';
}

/// 401 error
class UnauthorizedException implements Exception {
  UnauthorizedException({this.message = ''});

  final String message;

  @override
  String toString() => 'exceptions.unauthorized';
}

/// 404 error
class NotFoundException implements Exception {
  NotFoundException({this.message = ''});

  final String message;

  @override
  String toString() => 'exceptions.not_found';
}

/// 409 error
class ConflictException implements Exception {
  ConflictException({this.message = ''});

  final String message;

  @override
  String toString() => 'exceptions.conflict';
}

/// 500 error
class InternalServerErrorException implements Exception {
  InternalServerErrorException({this.message = ''});

  final String message;

  @override
  String toString() => 'exceptions.internal_server_error';
}
