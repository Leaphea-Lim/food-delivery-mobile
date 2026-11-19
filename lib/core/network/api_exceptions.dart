/// Standardized application network and API exceptions.
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  const ApiException({
    required this.message,
    this.statusCode,
    this.data,
  });

  @override
  String toString() => 'ApiException(statusCode: $statusCode, message: $message)';
}

class NetworkException extends ApiException {
  const NetworkException({super.message = 'No internet connection available.'});
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException({super.message = 'Session expired. Please log in again.', super.statusCode = 401});
}

class NotFoundException extends ApiException {
  const NotFoundException({super.message = 'Requested resource not found.', super.statusCode = 404});
}

class ServerException extends ApiException {
  const ServerException({super.message = 'Server encountered an error. Please try again later.', super.statusCode = 500});
}
