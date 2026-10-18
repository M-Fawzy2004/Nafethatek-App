import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../entities/splash_config.dart';

/// Contract for splash screen data and setup resolution.
abstract class SplashRepository {
  /// Resolves the initial splash configuration and verifies pre-requisites.
  Future<Either<Failure, SplashConfig>> getSplashConfig();
}
