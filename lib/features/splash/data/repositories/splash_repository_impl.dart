import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/splash_config.dart';
import '../../domain/repositories/splash_repository.dart';
import '../datasources/splash_local_datasource.dart';

/// Concrete implementation of [SplashRepository] handling error boundaries.
class SplashRepositoryImpl implements SplashRepository {
  final SplashLocalDataSource localDataSource;

  const SplashRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, SplashConfig>> getSplashConfig() async {
    try {
      final config = await localDataSource.getSplashConfig();
      return Right(config);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message, e.code));
    } catch (e) {
      return Left(CacheFailure('Unexpected error: $e'));
    }
  }
}
