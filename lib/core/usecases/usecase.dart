import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../errors/failures.dart';

/// Base contract for single-responsibility Use Cases.
/// Pure Dart - zero Flutter framework dependencies.
abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

/// Helper class to represent empty parameters for Use Cases that do not accept inputs.
class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
