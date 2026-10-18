/// Base class for all application exceptions caught in the data layer.
abstract class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, [this.code]);

  @override
  String toString() => 'AppException(message: $message, code: $code)';
}

/// Thrown when a remote server or Supabase operation fails.
class ServerException extends AppException {
  const ServerException(super.message, [super.code]);
}

/// Thrown when authentication or authorization fails.
class AuthException extends AppException {
  const AuthException(super.message, [super.code]);
}

/// Thrown when network connectivity is unavailable.
class NetworkException extends AppException {
  const NetworkException([
    super.message = 'No internet connection',
    super.code = 'NO_INTERNET',
  ]);
}

/// Thrown when a local caching or storage operation fails.
class CacheException extends AppException {
  const CacheException([
    super.message = 'Cache operation failed',
    super.code = 'CACHE_ERROR',
  ]);
}
