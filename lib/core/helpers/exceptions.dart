class ServerException implements Exception {
  String errorMessage;
  dynamic code;
  dynamic errorData;

  ServerException({required this.errorMessage, this.code, this.errorData});

  factory ServerException.defaultMessage() =>
      ServerException(errorMessage: 'Some error happened.');
}

class CacheException implements Exception {
  final String? message;
  CacheException({this.message});
}
