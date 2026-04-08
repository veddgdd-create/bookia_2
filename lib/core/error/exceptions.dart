// Server exceptions
class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

class CacheException implements Exception {
  const CacheException();
}

// Network exceptions
class NetworkException implements Exception {}
