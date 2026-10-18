import 'package:equatable/equatable.dart';

/// Base Failure class extending Equatable for value equality.
/// Pure Dart - zero Flutter framework dependencies.
abstract class Failure extends Equatable {
  final String message;
  final String? code;

  const Failure(this.message, [this.code]);

  @override
  List<Object?> get props => [message, code];
}

/// Returned when a remote server or Supabase operation fails.
class ServerFailure extends Failure {
  const ServerFailure(super.message, [super.code]);
}

/// Returned when authentication or authorization operations fail.
class AuthFailure extends Failure {
  const AuthFailure(super.message, [super.code]);
}

/// Returned when an action requires internet connectivity but none is available.
class NetworkFailure extends Failure {
  const NetworkFailure([
    super.message = 'Network connection failure',
    super.code = 'NETWORK_FAILURE',
  ]);
}

/// Returned when a local storage or cache retrieval fails.
class CacheFailure extends Failure {
  const CacheFailure([
    super.message = 'Cache failure',
    super.code = 'CACHE_FAILURE',
  ]);
}

/// Returned when input validation fails before dispatching a request.
class ValidationFailure extends Failure {
  const ValidationFailure(super.message, [super.code]);
}
