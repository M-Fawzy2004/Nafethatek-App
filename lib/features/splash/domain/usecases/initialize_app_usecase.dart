import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/splash_config.dart';
import '../repositories/splash_repository.dart';

/// Single-responsibility use case to load splash configurations and initiate warmup.
class InitializeAppUseCase implements UseCase<SplashConfig, NoParams> {
  final SplashRepository repository;

  const InitializeAppUseCase(this.repository);

  @override
  Future<Either<Failure, SplashConfig>> call(NoParams params) async {
    return await repository.getSplashConfig();
  }
}
